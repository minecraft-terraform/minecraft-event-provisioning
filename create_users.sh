#!/bin/bash

# JSON-bestand met gebruikersnamen
json_file="usernames.json"

# Map voor private keys
private_keys_dir="/data/privkeys"

# Maak de map aan als deze nog niet bestaat
mkdir -p "$private_keys_dir"

# Usergroep
user_group="creative_users"

# Controleer of het JSON-bestand bestaat
if [ ! -f "$json_file" ]; then
  echo "JSON-bestand ($json_file) niet gevonden."
  exit 1
fi

# Controleer of de usergroep bestaat
if ! getent group "$user_group" &>/dev/null; then
  echo "Usergroep $user_group bestaat niet. Aanmaken..."
  groupadd "$user_group"
fi

# Lees gebruikersnamen uit het JSON-bestand
usernames=$(jq -r '.users | .[] | .username' "$json_file")

# Loop door de gebruikersnamen
for username in $usernames; do
  # Controleer of de gebruiker al bestaat
  if id "$username" &>/dev/null; then
    echo "Gebruiker $username bestaat al."
  else
    # Maak de gebruiker aan als deze nog niet bestaat
    useradd -m -s /bin/bash -g "$user_group" "$username"
    echo "Gebruiker $username aangemaakt met standaardgroep $user_group."
  fi

  # Genereer een SSH-key-pair voor de gebruiker
  sudo -u "$username" ssh-keygen -t rsa -b 2048 -f "/home/$username/.ssh/id_rsa" -N ''

  # Kopieer de private key naar de map /data/privkeys met unieke naam
  cp "/home/$username/.ssh/id_rsa" "$private_keys_dir/id_rsa_$username"
  # Voeg de public key toe aan authorized_keys
  cat "/home/$username/.ssh/id_rsa.pub" >> "/home/$username/.ssh/authorized_keys"
  echo "Public key toegevoegd aan authorized_keys voor gebruiker $username."
done

  # Prepare minecraft setup


# Zorg ervoor dat de usergroep schrijftoegang heeft tot de /data/privkeys directory
chown :"$user_group" "$private_keys_dir"
chmod 770 "$private_keys_dir"

echo "Script voltooid."

