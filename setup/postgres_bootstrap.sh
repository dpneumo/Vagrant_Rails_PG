#!/bin/bash

echo ===================================
echo =
echo =       Installing postgres
echo =
echo ===================================

# Edit the following to change the name of the database user that will be created:
app_db_user=$DBUSER
app_db_pass=$DBPASS

# Edit the following to change the name of the database that is created (defaults to the user name)
app_db_name=$app_db_user

# Edit the following to change the version of PostgreSQL that is installed
pg_version=$PG_VERSION

###########################################################
# Changes below this line are probably not necessary
###########################################################
print_db_usage () {
  echo "PostgreSQL has been setup. A DB has been setup for you."
  echo "It can be accessed on your local machine on the forwarded port (default: 15432)"
  echo "  Host: localhost"
  echo "  Port: 15432"
  echo "  Database: $app_db_name"
  echo ""
  echo "This user can create DBs and roles. It created the $app_db_name DB:"
  echo "  Username: $app_db_user"
  echo "  Password: $app_db_pass"
  echo ""
  echo "Admin access to postgres user via VM:"
  echo "  vagrant ssh"
  echo "  sudo su - postgres"
  echo ""
  echo "psql access to app database user via VM:"
  echo "  vagrant ssh"
  echo "  sudo su - postgres"
  echo "  PGUSER=$app_db_user PGPASSWORD=$app_db_pass psql -h localhost $app_db_name"
  echo ""
  echo "Env variable for application development:"
  echo "  DATABASE_URL=postgresql://$app_db_user:$app_db_pass@localhost:15432/$app_db_name"
  echo ""
  echo "Local command to access the database via psql:"
  echo "  PGUSER=$app_db_user PGPASSWORD=$app_db_pass psql -h localhost -p 15432 $app_db_name"
}

export DEBIAN_FRONTEND=noninteractive

provisioned_on=/etc/vm_provision_on_timestamp
if [ -f "$provisioned_on" ]
then
  echo "VM was already provisioned at: $(cat $provisioned_on)"
  echo "To run system updates manually login via 'vagrant ssh' and run 'apt-get update && apt-get upgrade'"
  echo ""
  print_db_usage
  exit
fi

pg_repo_apt_source=/etc/apt/sources.list.d/pgdg.list
if [ ! -f "$pg_repo_apt_source" ]
then
  # Add PG apt repo:
  echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > "$pg_repo_apt_source"

  # Add PGDG repo key:
  sudo wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
fi

# Update package list and upgrade all packages
sudo apt-get update > /dev/null
sudo apt-get -y upgrade > /dev/null

sudo apt-get -y install "postgresql-$pg_version" "postgresql-contrib-$pg_version"

pg_conf="/etc/postgresql/$pg_version/main/postgresql.conf"
pg_hba="/etc/postgresql/$pg_version/main/pg_hba.conf"
pg_dir="/var/lib/postgresql/$pg_version/main"

# Edit postgresql.conf to change listen address to '*':
sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" "$pg_conf"

# Append to pg_hba.conf to add password auth:
sudo echo "host    all             all             all                     md5" >> "$pg_hba"

# Explicitly set default client_encoding
sudo chmod 666 "$pg_conf"
sudo echo "client_encoding = utf8" >> "$pg_conf"
sudo chmod 644 "$pg_conf"

# Restart so that all new config is loaded:
sudo service postgresql restart

cat << EOF | sudo su - postgres -c psql
-- Create the database user:
CREATE USER $app_db_user WITH PASSWORD '$app_db_pass';
ALTER ROLE $app_db_user CREATEROLE CREATEDB;

-- Create the database:
CREATE DATABASE $app_db_name WITH OWNER=$app_db_user
                                  LC_COLLATE='en_US.utf8'
                                  LC_CTYPE='en_US.utf8'
                                  ENCODING='UTF8'
                                  TEMPLATE=template0;
EOF

# Tag the provision time:
date > "$provisioned_on"

echo "Successfully created PostgreSQL dev virtual machine."
echo ---
print_db_usage

echo ---
echo postgres installation is complete!
echo ===================================
