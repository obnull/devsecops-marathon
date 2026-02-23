#!/bin/bash

sudo -v
if [ $? -ne 0 ]; then
echo "This script requires sudo privileges. Exiting."
exit 1
fi

USERS="alice bob charlie"
USER_GROUPS="developers operators auditors"
PROJECT_DIR="/srv/project"
SUDOERS_FILE="/etc/sudoers.d/operators"

for group in $USER_GROUPS; do
if ! getent group "$group" &>/dev/null; then
sudo groupadd "$group"
echo "Group $group created!"
else
echo "Group $group already exists!"
fi
done

for user in $USERS; do
if ! id "$user" &>/dev/null; then
sudo useradd -m -s /bin/bash $user
echo "User $user created!"
echo "$user:qwerty" | sudo chpasswd
echo "User $user password created!"
else
echo "User $user already exists!"
fi

case "$user" in
alice)
sudo usermod -aG developers "$user"
echo "Alice added to developers"
;;
bob)
sudo usermod -aG operators "$user"
echo "Bob added to operators"
;;
charlie)
sudo usermod -aG auditors "$user"
echo "Charlie added to auditors"
;;
esac
done

sudo mkdir -p $PROJECT_DIR/{dev,logs,audit}
for folder in dev logs audit; do
if [ -d "$PROJECT_DIR/$folder" ]; then
echo "$folder successfully created!"
else
echo "Error creating directory"
fi
done

sudo chown alice:developers "$PROJECT_DIR/dev"
sudo chmod 770 "$PROJECT_DIR/dev"

sudo chown bob:operators "$PROJECT_DIR/logs"
sudo chmod 750 "$PROJECT_DIR/logs"

sudo chown charlie:auditors "$PROJECT_DIR/audit"
sudo chmod 700 "$PROJECT_DIR/audit"

sudo chmod 2770 "$PROJECT_DIR/dev"

echo "%operators ALL=(ALL) NOPASSWD: /bin/systemctl restart rsyslog" | sudo tee /etc/sudoers.d/operators
sudo chmod 440 /etc/sudoers.d/operators

echo ""
echo "===Verification==="
echo "Folder permissions:"
ls -ld $PROJECT_DIR/*

echo ""
echo "Sudo for Bob:"
sudo -l -U bob | grep rsyslog || echo "Sudo rule not found"

echo ""
echo "SGID on dev:"
if [ -g "$PROJECT_DIR/dev" ]; then
echo "SGID enabled on /dev"
else
echo "SGID not enabled"
fi

echo ""
echo "RBAC laboratory deployed!"
