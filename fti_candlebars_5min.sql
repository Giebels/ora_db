create or replace procedure candlelight_5min_prc( p_date_time in timestamp ) as
  pragma autonomous_transaction;
begin
  --
  insert into fti_candlebar_5min(open_time, open, high, low, close, volume, close_time)
  select * from ( select first_value(date_time) over (order by date_time asc)  as datum_open
                  ,      first_value(last_price) over (order by date_time)     as open
                  ,      max(last_price) over ()                               as high  
                  ,      min(last_price) over ()                               as low   
                  ,      last_value(last_price) over (order by date_time desc) as close 
                  ,      null                                                  as volume
                  ,      last_value(date_time) over (order by date_time asc)   as datum_close
                  from   fti_last_price
                  where  date_time between to_timestamp(date_time) - interval '5' minute and p_date_time
                ) 
  where rownum = 1;  
  --
  commit;
  --
  exception  
     when others then rollback;
end;
/

/*
-------------------------------------------------------
--  testing --

select *
from fti_ema
where date_time between '2019-12-13 21:55:00' and '2019-12-13 21:59:59';

select last_value(date_time) over (partition by trunc(date_time,'HH24')) as datum
,      first_value(last_price) over (order by date_time) as open    -- 604.9
,      max(last_price) over (partition by trunc(date_time,'HH24')) as high  --605.05
,      min(last_price) over (partition by trunc(date_time,'HH24')) as low   --  604.9
,      last_value(last_price) over (order by date_time desc) as close 
-- ,      last_value(date_time) over (order by trunc(date_time,'HH24')) as close   --605.05
from fti_last_price
where date_time between '2019-12-13 21:55:00' and '2019-12-13 21:59:59'
and rownum = 1;

select * from (
select first_value(date_time) over (order by date_time asc)  as datum_open
,      last_value(date_time) over (order by date_time asc) as datum_close
,      first_value(last_price) over (order by date_time)                  as open    -- 604.9
,      max(last_price) over () as high  --605.05   partition by trunc(date_time,'HH24')
,      min(last_price) over () as low   --  604.9   partition by trunc(date_time,'HH24')
,      last_value(last_price) over (order by date_time desc) as close 
-- ,      last_value(date_time) over (order by trunc(date_time,'HH24')) as close   --605.05
from fti_last_price
where date_time between '2019-12-13 21:55:00' and '2019-12-13 21:59:59'
) where rownum = 1;


select max(last_price) over () as max_price
         ,      min(last_price) over () as min_price
         ,      first_value(last_price) over (order by date_time desc) as open_price
         ,      last_value(last_price) over (order by date_time asc)   as close_price 
from   fti_last_price 
where date_time between '2019-12-13 21:55:00' and '2019-12-13 21:59:59'   ;      




create table fti_candlebars_5min
( datum_open   timestamp(6) not null enable
, open         number(8,3)
, high         number(8,3) 
, low          number(8,3) 
, close        number(8,3)
, volume       integer
, datum_close  timestamp(6) not null enable 
, constraint future_candlebars_pk primary key (datum_open) using index tablespace tws_index
) tablespace tws_data;


DATUM
OPEN
HIGH
LOW
CLOSE
VOLUME
*/
