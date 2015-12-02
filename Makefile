
all: image

image: Dockerfile
	docker build -t mjuenema/pythons .

clean:
	# I always forget the syntax
	docker rmi `docker images -q -f dangling=true`
