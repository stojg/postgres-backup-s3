run: build
	docker run --env-file .env -it --rm stojg/postgres-backup-s3

build:
	docker buildx build --platform=linux/amd64 . -t stojg/postgres-backup-s3

push:
	docker buildx build --platform=linux/amd64 . -t stojg/postgres-backup-s3:latest -t stojg/postgres-backup-s3:$(shell git rev-parse --verify HEAD)
	docker push stojg/postgres-backup-s3:latest
	docker push stojg/postgres-backup-s3:$(shell git rev-parse --verify HEAD)
