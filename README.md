# docker-unifi
# This is a first attept at a building a Unifi server via Docker.  Strongly recommend ignoring for the time being as there are going to be issues :)
# Stop Unifi server
servce unifi stop
# Migrate data over to mapped volume
rsync -avzh /var/lib/unifi/ /config/unifi
# Delete original location
rm -r -f /var/lib/unifi
# Symlink the mapped volume data back to the original location
ln -s /config/unifi /var/lib/unifi
# Restart Unifi server
service unifi start
