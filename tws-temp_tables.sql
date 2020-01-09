select a.date_time, a.last_price, mod(extract(minute from a.date_time), 3) as mod
from fti_last_price a
,  ( select  max(date_time) as date_time from fti_ema where date_time <= '2018-12-13 14:06:00.000000000' ) b
where a.date_time between b.date_time - interval '3' minute and b.date_time;

select min(last_price) keep ( dense_rank first order by a.date_time) as open_price
,      max(last_price) as high_price
,      min(last_price) as low_price
,      max(last_price) keep ( dense_rank last order by a.date_time) as close_price
from fti_last_price a
,  ( select  max(date_time) as date_time from fti_ema where date_time <= '2018-12-13 14:42:00.000000000' ) b
where a.date_time between b.date_time - interval '2' minute and b.date_time;


create global temporary table temp_ema3_9
( date_time  timestamp
, price      number(10,2)
) on commit preserve rows;


create global temporary table temp_ema3_21
( date_time    timestamp
, open_price   number(10,2)
, close_price  number(10,2)
, high_price   number(10,2)
, low_price    number(10,2)
) on commit preserve rows;

create global temporary table temp_candle_bar
( date_time    timestamp
, open_price   number(10,2)
, close_price  number(10,2)
, high_price   number(10,2)
, low_price    number(10,2)
) on commit preserve rows;


insert into temp_candle_bar(open_price) values(100);
commit;
select * from temp_candle_bar;
update temp_candle_bar set high_price = 120 where open_price < 120;

rollback;
alter system set temp_undo_enabled = true;
select * from v$parameter where name='compatible';
select * from v$tempundostat;

-- update on fti)last_price_ema







select insert_sql from ( select 'insert into temp_ema3_9 values(''' || date_time || ''', ' || last_price || ');' insert_sql
                         , row_number() over (order by date_time) rnum
                         from bck_fti_last_price where symbol_id = 11
                       ) 
where rnum < 200 ;


rollback;
truncate table temp_ema3_9;
select * from temp_ema3_9;

---------------------------------------- begin testen -----------------------------------------------
-- truncate table temp_ema3_9;
truncate table fti_last_price_size_ema;
alter table fti_last_price truncate partition sys_p311;   -- symbol_id = 11
alter table fti_last_price truncate partition sys_p316;   -- symbol_id = 12
alter table fti_ema truncate partition sys_p289;          -- symbol_id = 11  
alter table fti_ema truncate partition SYS_P442;          -- symbol_id = 12

declare
begin
   for i in ( select symbol_id, date_time, last_price 
              from ( select symbol_id, date_time, last_price, row_number() over (order by date_time) rnum 
                     from   bck_fti_last_price 
                     where  date_time > (select max(date_time) from fti_last_price)
                     and    symbol_id = 12
                     order by date_time
                   )
              where rnum < 300
            )
   loop
     -- insert into temp_ema3_9 values( i.date_time, i.last_price );   
     insert into fti_last_price values( i.symbol_id, i.date_time, i.last_price );   
     commit;
   end loop;
end;
/
-- maak gaten in range (delete records) in temp_ema3_9

alter table fti_last_price truncate partition sys_p311;

begin
   for i in ( select date_time, price from temp_ema3_9 order by date_time )
   loop
     insert into fti_last_price values( 11, i.date_time, i.price );   
     commit;
   end loop;
end;
/

--------------------------- einde testen ---------------------------------------------------
select (523.35 - 523.28) * 0.2 + 523.28 from dual;

select date_time, last_price, ema9_3min,
case when last_price > ema9_3min then 'buy'
     when last_price < ema9_3min then 'sell'
     else 'neutral'
end  as advice    
from ( select date_time, last_price, ema9_3min  
       from fti_ema 
       where mod(extract(minute from date_time),3) = 0 order by date_time );
       
select date_time, last_price, ema9_3min,
       case when last_price > ema9_3min then 'buy'
            when last_price < ema9_3min then 'sell'
            else 'neutral'
       end  as advice    
from fti_ema       
order by date_time;
       

select max(date_time) as max_time 
,      max(date_time) - interval '27' minute as min_time 
from   fti_ema  
where  symbol_id = 12;
     
select *
from fti_ema a
,  ( select max(date_time) as max_time 
     ,      max(date_time) - interval '27' minute as min_time 
     from   fti_ema  
     where  symbol_id = 12
   ) b   
where trunc(a.date_time,'MI') between b.min_time and b.max_time
and   mod(extract(minute from a.date_time), 3) = 1;


select  round(sum(last_price)/9, 2)
from fti_ema a
,  ( select max(date_time) as max_time 
     ,      max(date_time) - interval '3' minute as min_time 
     from   fti_ema  
     where  symbol_id = 12
   ) b   
where a.date_time between b.min_time and b.max_time
and   mod(extract(minute from a.date_time), 3) = 1;



alter session set nls_timestamp_format='RRRR-MM-DD hh24:mi:ssxff';
select symbol_id || '|' || date_time || '|' || last_price from bck_fti_last_price where symbol_id = 12 order by date_time;











alter table fti_ema drop column init_time;

alter table fti_ema truncate partition sys_p289;
alter table fti_last_price truncate partition sys_p311;


select row_id from (select rowid as row_id, rownum as row_num from temp_ema3_9 order by date_time asc) where row_num = 1;

delete from temp_ema3_9 where row_id = ((select rowid as row_id, rownum as row_num from temp_ema3_9 order by date_time asc) where row_num = 1);
delete from temp_ema3_9 where rowid in ( select row_id from (select rowid as row_id, date_time, row_number() over (order by date_time) as xx from temp_ema3_9) where xx = 1) ;




