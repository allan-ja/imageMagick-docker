FROM centos:7

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8 

RUN yum -y update &&\
	yum install -y wget ImageMagick &&\
	yum erase -y ImageMagick

RUN wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm &&\
	rpm -ivh epel-release-latest-7.noarch.rpm &&\
	yum install -y fftw-libs-double openjpeg2 libwebp 

RUN wget https://imagemagick.org/download/linux/CentOS/x86_64/ImageMagick-libs-7.0.8-33.x86_64.rpm \
	&& wget https://imagemagick.org/download/linux/CentOS/x86_64/ImageMagick-7.0.8-33.x86_64.rpm \
	&& rpm -Uvh ImageMagick-libs-7.0.8-33.x86_64.rpm \
	&& rpm -Uvh ImageMagick-7.0.8-33.x86_64.rpm \
	&& rm -f *rpm

# Install Python 3
RUN yum -y install https://centos7.iuscommunity.org/ius-release.rpm &&\
	yum -y install python36u &&\
	yum -y install python36u-pip &&\
	ln -s /usr/bin/python3.6 /usr/bin/python3 &&\
	ln -s /usr/bin/pip3.6 /usr/bin/pip3 &&\
	pip3 install --upgrade pip
