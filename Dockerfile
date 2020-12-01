FROM omrsregrepo/bahmni_092:18112020
# bahmni updates happen here
ARG container_name
ARG bind_mount_dest
ADD db_script.sh /tmp/db_script.sh
RUN chmod a+x /tmp/db_script.sh
ADD development.sh /tmp/development.sh
RUN chmod a+x /tmp/db_script.sh
ADD backup.sql /tmp/backup.sql
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
    systemd-tmpfiles-setup.service ] || rm -f $i; done); \
    rm -f /lib/systemd/system/multi-user.target.wants/*;\
    rm -f /etc/systemd/system/*.wants/*;\
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*;\
    rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]

CMD ["/usr/sbin/init"]

#ENTRYPOINT /tmp/db_script.sh ; bahmni -ilocal start ; sh /tmp/db_script.sh ; /bin/bash