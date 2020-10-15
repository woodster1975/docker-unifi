# docker-unifi
# This is a first attept at a building a Unifi server via Docker.  Strongly recommend ignoring for the time being as there are going to be issues :)
# Build image
docker build -t “woodster1975:unifi" .
# Run container
docker run -d \
  --name=unifi-controller \
  -it \
  -p 3478:3478/udp \
  -p 10001:10001/udp \
  -p 8080:8080 \
  -p 8443:8443 \
  -p 1900:1900/udp \
  -p 8843:8843 \
  -p 8880:8880 \
  -p 6789:6789 \
  -p 5514:5514 \
  --privileged \
  --restart unless-stopped \
  -v /home/paul/Docker/Unifi/config:/config \
  woodster1975/unifi
# You should now have a working Unifi controller
# In order to make the data persistant you will need to migrate it over to the mapped volume
# The following can be done using docker exec from host or interactivly in the container
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
