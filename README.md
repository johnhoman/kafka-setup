## Setup single node kafka broker

### run
docker run -d -t -p 2181:2181 -p 9082:9082 --name=kafka kafka
