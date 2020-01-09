show parameter log_archive_dest;
show parameter db_recover;

alter system set log_archive_dest_1='location=/u04/rman/db12c';

alter system set log_archive_dest=''

log_archive_dest
log_archive_dest_n;

select * from v$log;
alter database add logfile group 5 size 4G;
alter database drop logfile group 5;