ALTER TABLE orders SET PARTITIONING AUTOMATIC;

begin
  for i in (select owner, table_name from dba_part_tables where owner='PTWS')
  loop
    begin
      execute immediate 'alter table ' || i.owner || '.' || i.table_name || ' set partitioning automatic';
    exception
      when others then
        null;
    end;    
  end loop;
end;
/