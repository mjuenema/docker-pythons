# docker-eclipse-pydev-pythons
Docker image with multiple Python versions. This may
be useful for testaing Python projects 
against the following versions of Python. 

* Python 3.5.0
* Python 3.4.3
* Python 3.3.6
* Python 2.7.10
* Python 2.6.9

There is similar Docker image but with Eclipse and PyDev included:
https://github.com/mjuenema/docker-eclipse-pydev-pythons

## Building the Docker image
The build process is controlled through a `Makefile`. 
```
# make

# docker images
REPOSITORY                          TAG        IMAGE ID         VIRTUAL SIZE
mjuenema/pythons                    TODO:
```

## Using the Docker image
The intended purpose of this Docker image is to test Python projects against
multiple versions of Python. In most cases this would be done using the
tox tool. (https://pypi.python.org/pypi/tox)

### Creating a container

The command will create a Docker container named "mypythonproject".
```
# docker create -i -t --name="mypythonproject" bbc874dc97e3
8951df97c95f6a6d0d3057f42b2ce1d612174b370026e4b9f7ce9c1e1dd14f8a
```

### Starting the container
```
# docker start -i -a mypythonproject
bash-4.1$ 
```

### Testing Python projects
Once logged into the container, "download" your Python project from
the repository (github in the example below) and run `tox`.

```
bash-4.1$ git clone https://github.com/<user>/<mypythonproject>.git
bash-4.1$ cd <mypythonproject>
bash-4.1$ tox
```

Markus Juenemann, 26-Nov-2015
