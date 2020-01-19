docker run -it --rm \
  --workdir="/usr/src/app" \
  --volume "$HOME"/.m2:/root/.m2 \
  --volume "$PWD":/usr/src/app/ \
  --volume "$PWD"/target:/root/.cache \
  maven:3-amazoncorretto-11 \
  /bin/bash -c \
  "mvn package jib:buildTar" \
  && \

ls -d $PWD/app-* | \
  while read x; \
    do docker load --input "$x/target/jib-image.tar";
  done && \

docker-compose up --force-recreate
