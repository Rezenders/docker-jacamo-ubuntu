FROM ubuntu:bionic

RUN apt-get update && apt-get install -y \
	vim \
	git \
	default-jdk \
	gradle  \
	&& rm -rf /var/lib/apt/lists/

ENV JAVA_HOME=/usr/lib/jvm/default-java

WORKDIR /
RUN ["/bin/bash", "-c", "git clone https://github.com/jacamo-lang/jacamo.git"]
WORKDIR /jacamo
RUN ["/bin/bash", "-c", "gradle config"]
ENV JACAMO_HOME=/jacamo/build
ENV PATH=$JACAMO_HOME/scripts:$PATH

CMD ["bash"]
