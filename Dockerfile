# requires --privileged parameter to docker-run,
# to mount/umount an image.
FROM ubuntu:bionic

RUN apt update && apt install -y \
	android-tools-fsutils \
	make \
	sudo \
	git \
	libcap2-bin

RUN useradd packer \
	&& echo "packer:packer" | chpasswd \
	&& adduser packer sudo \
	&& echo "packer ALL=NOPASSWD: ALL" >> /etc/sudoers

WORKDIR /sharp

RUN chown packer:packer /sharp

COPY --chown=packer:packer . /sharp

USER packer

CMD ["make", "test"]
