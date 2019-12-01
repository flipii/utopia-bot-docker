docker build -t utopia --no-cache .

docker-compose down
docker-compose up -d
docker-compose logs -f
