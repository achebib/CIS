ansible-vault create ./vault/enc_vars.yml

mkdir ./handlers
mkdir ./tasks
mkdir ./defaults
mkdir ./templates
mkdir ./meta
mkdir ./roles
mkdir ./vars
mkdir ./playbooks
mkdir ./inventory
mkdir ./files
mkdir ./test
mkdir ./vault
mkdir ./ignore

touch ./ansible.cfg
touch ./inventory/hosts
touch ./main.yml
touch ./files/path_cred_perms.txt

clear
read -p "Enter your hostname: " servername
read -p "Enter your host ip address: " ipaddr

echo "[defaults]" > ansible.cfg
echo "#inventory = ./inventory/hosts" >> ansible.cfg
echo "inventory = ./inventory" >> ansible.cfg
echo "#host_key_checking = False" >> ansible.cfg
echo "roles_path = roles" >> ansible.cfg
echo "---" >> ./vars/main.yml
echo "---" >> ./vars/packages.yml

echo "[$servername]" > ./inventory/hosts
echo "$ipaddr" >> ./inventory/hosts

cat > ./main.yml <<EOF
---
- name: Playbook generado automaticamente por script
  hosts: $servername

  vars_files:
      - ./vars/main.yml
      - ./vars/packages.yml
      - ./vault/enc_vars.yml

  tasks:
    - include: ./task/test.yml                      #test yml
EOF

#------------------------------------------------------------------------------
#cd ./vault
#ansible-vault create vault

#asnible-playbook --ask-vault-pass


# ansible-galaxy init -p playbooks/roles web
#playbooks
#└── roles
#    └── web
#        ├── README.md
#        ├── defaults
#        │   └── main.yml
#        ├── files
#        ├── handlers
#        │   └── main.yml
#        ├── meta
#        │   └── main.yml
#        ├── tasks
#        │   └── main.yml
#        ├── templates
#        ├── tests
#        │   ├── inventory
#        │   └── test.yml
#        └── vars
#            └── main.yml
