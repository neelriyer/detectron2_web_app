
# stop containers
docker stop $(docker ps -a -q) 

# remove containers
docker rm $(docker ps -a -q) && docker rmi $(docker images | grep '^<none>' | awk '{print $3}')

# build container
docker build . -f Dockerfile -t detectron2

# run contrainer on port 8080
docker run -d -p 8080:8080 detectron2

# see stats
docker stats $(docker ps -q)

