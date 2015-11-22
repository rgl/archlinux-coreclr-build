FROM archlinux
ADD coreclr-build.sh /tmp/
RUN /tmp/coreclr-build.sh
