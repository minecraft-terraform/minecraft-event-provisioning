resource "aws_ecs_cluster" "minecraft_server" {
  name = "minecraft_server"
}

resource "aws_ecs_task_definition" "minecraft_server" {
  cpu                      = "4096"
  memory                   = "8192"
  family                   = "minecraft-server"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  task_role_arn            = aws_iam_role.minecraft_server_permission.arn
  # execution_role_arn  = aws_iam_role.minecraft_server_permission.arn


  container_definitions = jsonencode([
    {
      name       = "minecraft-server"
      image      = "itzg/minecraft-server:java17-alpine"
      essential  = true
      tty        = true
      stdin_open = true
      restart    = "unless-stopped"

      portMappings = [
        {
          containerPort = 25565
          hostPort      = 25565
          protocol      = "tcp"
        },
        {
          containerPort = 25575
          hostPort      = 25575
          protocol      = "tcp"
        }
      ]
      environment = [
        {
          name  = "EULA"
          value = "TRUE"
        },
        {
          "name" : "VERSION",
          "value" : "1.20.2"
        },
        {
          "name" : "ENABLE_RCON",
          "value" : "true"
        },
        {
          "name" : "RCON_PORT",
          "value" : "25575"
        },
        {
          "name" : "RCON_PASSWORD",
          "value" : "Worlt"
        },
        {
          "name" : "MODE",
          "value" : "creative"
        },
        {
          "name" : "LEVEL_TYPE",
          "value" : "FLAT"
        },
        {
          name  = "SPAWN_ANIMALS"
          value = "FALSE"
        },
        {
          name  = "SPAWN_MONSTERS"
          value = "FALSE"
        },
        {
          name  = "SPAWN_NPCS"
          value = "FALSE"
        },
        {
          name  = "DIFFICULTY"
          value = "hard"
        },
        {
          name  = "SEED"
          value = "-1785852800490497910"
        },
        {
          name  = "OVERRIDE_OPS"
          value = "true"
        },
        {
          name  = "OPS"
          value = "N0tNamed"
        },
        {
          name  = "AWS_CONTAINER_CREDENTIALS_RELATIVE_URI"
          value = "/opt/aws/container/credentials"
        }
      ]
      mountPoints = [
        {
          sourceVolume  = "minecraft-data"
          containerPath = "/data"
        },
      ],
    }
  ])

  volume {
    name = "minecraft-data"
    efs_volume_configuration {
      file_system_id = aws_efs_file_system.minecraft_server.id
      root_directory = "/"
    }
  }
}


resource "aws_ecs_service" "minecraft_server" {
  name            = "minecraft_server"
  cluster         = aws_ecs_cluster.minecraft_server.id
  task_definition = aws_ecs_task_definition.minecraft_server.arn
  desired_count   = 1
  network_configuration {
    subnets          = module.vpc.public_subnets
    security_groups  = [aws_security_group.minecraft_server.id]
    assign_public_ip = true
  }
  launch_type = "FARGATE"
}



