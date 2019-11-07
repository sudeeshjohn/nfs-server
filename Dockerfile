FROM ppc64le/centos:latest
MAINTAINER "Alphayax <alphayax@gmail.com>"

# Install nfs-utils
RUN yum -y install /usr/bin/ps nfs-utils && yum clean all

# Copy entrypoint
ADD run_nfs.sh /usr/local/bin/run_nfs.sh

ADD index.html /tmp/index.html

RUN chmod 644 /tmp/index.html

# Create exports dir
RUN mkdir -p /exports \
 && chmod +x /usr/local/bin/run_nfs.sh

# Export NFS Ports
EXPOSE 20048/tcp 2049/tcp

# Expose volume
VOLUME /exports

# Launch entrypoint
ENTRYPOINT ["/usr/local/bin/run_nfs.sh"]
CMD ["/exports", "/"]
CMD ["/exports/data-0", "/exports/data-1", "/exports/data-2", "/exports/data-3", "/exports/data-4", "/exports/data-5", "/exports/data-6", "/exports/data-7", "exports/data-8", "/exports/data-9"]
