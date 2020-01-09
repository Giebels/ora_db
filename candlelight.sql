create or replace procedure candlelight( p_date_time in timestamp )
as
begin
  --
  insert into fti_candlebars(datum, open, high, low, close, volume)
  values ( select  *
           from ( select max(last_price) over () as max_price
                  ,      min(last_price) over () as min_price
                  ,      first_value(last_price) over (order by date_time desc) as open_price
                  ,      last_value(last_price) over (order by date_time asc)   as close_price 
                  from   fti_last_price 
                  where  date_time between to_timestamp(p_date_time) - interval '3' minute and p_date_time
                )
           where rownum=1;
        );   
  --
end;
/
