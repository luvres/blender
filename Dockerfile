FROM izone/amdgpu
MAINTAINER Leonardo Loures <luvres@hotmail.com>

RUN \
    apt-get update \
	&& apt-get install -y \
	libglu1-mesa libxrender1 libxi6 clinfo


WORKDIR /root
