FROM dockerfile/ubuntu
MAINTAINER duane.johnson@gmail.com
ENV DEBIAN_FRONTEND noninteractive

#
#  Get the build-dependencies.
#
RUN apt-get -q update
RUN apt-get -y install build-essential

#
#  Download and unpack the source
#
ADD http://github.com/kr/beanstalkd/archive/v1.9.tar.gz /tmp/
RUN cd /tmp && tar zxf v1.9.tar.gz

#
#  Build and "install".
#
RUN cd /tmp/beanstalkd-1.9/ && make
RUN cp /tmp/beanstalkd-1.9/beanstalkd /usr/local/bin/

#
#  Expose the port.
#
EXPOSE 11300

#
#  Launch the daemon
#
CMD ["/usr/local/bin/beanstalkd","-n"]