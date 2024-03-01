#!/bin/bash

if [[ $EUID != "0" ]]; then
    echo "!! Run as rootx|"
    exit
fi

# Pad naar het JSON-bestand met gebruikersnamen
usernames_file="./usernames.json"

# Directory voor het opslaan van SSH-sleutels
keys_directory="/data/keys"

# Controleer of de keys_directory bestaat, anders maak het aan
if [ ! -d "$keys_directory" ]; then
    mkdir -p "$keys_directory"
    echo "Directory $keys_directory aangemaakt."
fi

# Controleer of het JSON-bestand bestaat
if [ ! -f "$usernames_file" ]; then
    echo "Fout: Het opgegeven JSON-bestand bestaat niet."
    exit 1
fi

# Lees de gebruikersnamen uit het JSON-bestand
usernames=$(jq -r '.users[].username' "$usernames_file")

# Loop door de gebruikersnamen en maak de gebruikers aan
for username in $usernames; do
        userdel -f -r "$username"
	rm -fr ${keys_directory}/${username}
        echo "Gebruiker $username is verwijderd."
done

echo "Script voltooid."
root@ip-10-0-101-89:/home/ubuntu# ^C
root@ip-10-0-101-89:/home/ubuntu# vi delete_users.sh
root@ip-10-0-101-89:/home/ubuntu# ./delete_users.sh ^C
root@ip-10-0-101-89:/home/ubuntu# cat delete_users.sh
#!/bin/bash

# Array van systeemaccounts die niet moeten worden verwijderd
system_accounts=("root" "ubuntu")

# Array van systeemgebruikers die niet moeten worden verwijderd
system_usernames=("daemon" "bin" "sys" "sync" "games" "man" "lp" "mail" "news" "uucp" "proxy" "www-data" "backup" "list" "irc" "gnats" "nobody" "systemd-network" "systemd-resolve" "systemd-timesync" "messagebus" "avahi" "ntp" "sshd" "lxd" "pollinate" "landscape" "snapd" "ubuntu-dock" "pulse" "rtkit" "whoopsie" "kernoops" "sandbox" "systemd-coredump" "uuidd" "dnsmasq" "colord" "geoclue" "gnome-initial-setup" "gdm" "speech-dispatcher" "hplip" "kernoops" "rwhod" "gssproxy" "nm-openvpn" "nm-openconnect" "wdmd" "vboxadd" "administrator" "sssd" "stunnel4" "ceph" "cephuser")

# Verwijder gebruikers die geen systeemaccounts zijn
for user in $(cut -d: -f1 /etc/passwd); do
    if [[ ! " ${system_accounts[@]} " =~ " $user " ]] && [[ ! " ${system_usernames[@]} " =~ " $user " ]]; then
        echo "Verwijderen van gebruiker: $user"
        sudo deluser --remove-home $user
    fi
done
