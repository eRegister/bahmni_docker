FROM omrsregrepo/bahmni_base:69_260718
# bahmni updates happen here
ARG container_name
ARG bind_mount_dest
ADD db_script.sh /tmp/db_script.sh
RUN chmod a+x /tmp/db_script.sh
ADD development.sh /tmp/development.sh
RUN chmod a+x /tmp/db_script.sh
ADD db_backup.sql /tmp/db_backup.sql
ENTRYPOINT /bin/bash
