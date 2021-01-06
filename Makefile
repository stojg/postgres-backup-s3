run: build
	docker run -it --rm stojg/postgres-backup-s3

build:
	docker build . -t stojg/postgres-backup-s3

push: build
	docker build . -t stojg/postgres-backup-s3:latest -t stojg/postgres-backup-s3:$(shell git rev-parse --verify HEAD)
	docker push stojg/postgres-backup-s3:latest
	docker push stojg/postgres-backup-s3:$(shell git rev-parse --verify HEAD)