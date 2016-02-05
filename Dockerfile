#
# Python versions on CentOS 6
#
# Markus Juenemann, 26-Nov-2015

FROM centos:6
MAINTAINER Markus Juenemann <markus@juenemann.net>

# Yum proxy
#
RUN [ "$http_proxy" == "" ] || echo "proxy=$http_proxy" >> /etc/yum.conf
RUN yum clean all

# Update
#
RUN [ -f /etc/yum.repos.d/epel.repo ] || yum -y -v install https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
RUN [ -f /etc/yum.repos.d/repoforge ] || yum -y -v install http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
RUN yum -y update


# Install requirements
#
RUN yum -y install sqlite-devel \
                   gdbm-devel \
                   zlib-devel \
                   ncurses-devel \
                   openssl-devel \
                   readline-devel \
                   bzip2-devel \
                   libxslt-devel \
                   python-devel \
                   libxml2-devel \
                   gcc \
                   make \
                   file \
                   which \
                   sudo \
                   tar \
                   wget \
                   git \
                   gitflow \
                   subversion \
                   mercurial \
                   vim-enhanced \
                   rpm-build


# Download get-pip.py
#
RUN wget --no-check-certificate https://bootstrap.pypa.io/get-pip.py


# Python 2.6.9
#
RUN wget https://www.python.org/ftp/python/2.6.9/Python-2.6.9.tgz && \
    tar xvfz Python-2.6.9.tgz && \
    cd Python-2.6.9 && \
    ./configure && \
    make clean && \
    make && \
    make altinstall && \
    cd - && \
    /usr/local/bin/python2.6 get-pip.py && \
    pip2.6 install tox setuptools nose coverage && \
    rm -rfv Python* \
    rm -fv `find /usr/local/lib -name "*.pyc"` && \
    rm -fv `find /usr/local/lib -name "*.pyo"`


# Python 2.7.10
#
RUN wget https://www.python.org/ftp/python/2.7.10/Python-2.7.10.tgz && \
    tar xvfz Python-2.7.10.tgz && \
    cd Python-2.7.10 && \
    ./configure && \
    make clean && \
    make && \
    make altinstall && \
    cd - && \
    /usr/local/bin/python2.7 get-pip.py && \
    pip2.7 install tox setuptools nose coverage && \
    rm -rfv Python-* \
    rm -fv `find /usr/local/lib -name "*.pyc"` && \
    rm -fv `find /usr/local/lib -name "*.pyo"`


## Python 3.2.6
##
RUN wget https://www.python.org/ftp/python/3.2.6/Python-3.2.6.tgz && \
    tar xvfz Python-3.2.6.tgz && \
    cd Python-3.2.6 && \
    ./configure && \
    make clean && \
    make && \
    make altinstall && \
    cd - && \
    #/usr/local/bin/python3.2 get-pip.py && \
    #pip3.2 install setuptools && \
    rm -rfv Python-* \
    rm -fv `find /usr/local/lib -name "*.pyc"` && \
    rm -fv `find /usr/local/lib -name "*.pyo"`


# Python 3.3.6
#
RUN wget https://www.python.org/ftp/python/3.3.6/Python-3.3.6.tgz && \
    tar xvfz Python-3.3.6.tgz && \
    cd Python-3.3.6 && \
    ./configure && \
    make clean && \
    make && \
    make altinstall && \
    cd - && \
    /usr/local/bin/python3.3 get-pip.py && \
    pip3.3 install tox setuptools nose coverage && \
    rm -rfv Python-* \
    rm -fv `find /usr/local/lib -name "*.pyc"` && \
    rm -fv `find /usr/local/lib -name "*.pyo"`


# Python 3.4.3
#
RUN wget https://www.python.org/ftp/python/3.4.3/Python-3.4.3.tgz && \
    tar xvfz Python-3.4.3.tgz && \
    cd Python-3.4.3 && \
    ./configure && \
    make clean && \
    make && \
    make altinstall && \
    cd - && \
    /usr/local/bin/python3.4 get-pip.py && \
    pip3.4 install tox setuptools nose coverage && \
    rm -rfv Python-* \
    rm -fv `find /usr/local/lib -name "*.pyc"` && \
    rm -fv `find /usr/local/lib -name "*.pyo"`


# Python 3.5.0
#
RUN wget https://www.python.org/ftp/python/3.5.0/Python-3.5.0.tgz && \
    tar xvfz Python-3.5.0.tgz && \
    cd Python-3.5.0 && \
    ./configure && \
    make clean && \
    make && \
    make altinstall && \
    cd - && \
    /usr/local/bin/python3.5 get-pip.py && \
    pip3.5 install tox setuptools nose coverage && \
    rm -rfv Python-* \
    rm -fv `find /usr/local/lib -name "*.pyc"` && \
    rm -fv `find /usr/local/lib -name "*.pyo"`


# Pypy and Jython
#
RUN yum -y install pypy jython


# Undo yum proxy
#
RUN [ "$http_proxy" == "" ] || sed --in-place 's/^proxy//g' /etc/yum.conf


USER developer
ENV HOME /home/developer
WORKDIR /home/developer
CMD /bin/bash
