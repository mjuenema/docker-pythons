
all: image

image: Dockerfile
	docker build -t mjuenema/pythons .

clean:
	# I always forget the syntax
	[ "`docker images -q -f dangling=true`" != "" ] && docker rmi `docker images -q -f dangling=true`
