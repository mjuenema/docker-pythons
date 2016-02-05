
all: image

image: Dockerfile
	docker build -t mjuenema/pythons --build-arg http_proxy=$(http_proxy) --build-arg https_proxy=$(https_proxy) .

clean:
	# I always forget the syntax
	[ "`docker images -q -f dangling=true`" != "" ] && docker rmi `docker images -q -f dangling=true`
