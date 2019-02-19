# bash script to build & run thhe docker file each time
echo "Building Docker image"
`docker build -t myimage:$f1 .`
docker run myimage