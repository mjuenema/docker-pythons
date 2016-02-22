
all: help

help:
	@echo "make image"
	@echo "make run"
	@echo "make test"

image: Dockerfile
	docker build -t mjuenema/pythons --build-arg http_proxy=$(http_proxy) --build-arg https_proxy=$(https_proxy) .

run: image
	docker run -it --rm mjuenema/pythons

test: image
	./expect-lite test.elt

clean_dangling:
	# I always forget the syntax
	[ "`docker images -q -f dangling=true`" != "" ] && docker rmi `docker images -q -f dangling=true`

clean_failed:
	[ "`docker ps -a | egrep 'Exited \([^0]' | cut -c 1-16`" != "" ] && \
		docker rm `docker ps -a | egrep 'Exited \([^0]' | cut -c 1-16`
