
all: image

image: Dockerfile
	docker build -t mjuenema/pythons .
