# Server startup

## Requirements
Linux server with docker and docker-compose installed

## Copy env file
```shell
cp .env.example .env
```

## (Optional) Change env file
```shell
nano .env
```

## Build
```shell
./gradlew buildFatJar
```

## Run
```shell
docker-compose up --build -d
```