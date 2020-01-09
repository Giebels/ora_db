declare
begin
  for i in ( select symbol_id, date_time, last_price from bck_fti_last_price where symbol_id >= 10)
  loop
    insert into fti_last_price_size_ema(symbol_id, time_last_price, last_price) values(i.symbol_id, i.date_time, i.last_price);
    commit;
  end loop;
end;
/
--------------------------------------------------------------------------------------------------------------------------------



--------------------------------------------------------------------------------------------------------------------------------

create global temporary table temp_ema3_9
( date_time  timestamp
, price      number(10,2)
) on commit preserve rows;

--------------------------------------------------------------------------------------------------------------------------------

create global temporary table temp_ema3_21
( date_time  timestamp
, price      number(10,2)
) on commit preserve rows;

--------------------------------------------------------------------------------------------------------------------------------

create global temporary table temp_ema3_21
( date_time  timestamp
, price      number(10,2)
) on commit preserve rows;

alter system set temp_undo_enabled = true;
select * from v$parameter where name='compatible';
select * from v$tempundostat;

--------------------------------------------------------------------------------------------------------------------------------



create table dtws.fti_last_price_size_ema_hist 
(	symbol_id number(*,0), 
	start_date timestamp (4), 
	time_last_price timestamp (4), 
	last_price number(10,2), 
	ema9_3min number(10,2), 
	ema21_3min number(10,2), 
	ema9_5min number(10,2), 
	ema21_5min number(10,2), 
	ema9_10min number(10,2), 
	ema21_10min number(10,2), 
	ema9_20min number(10,2), 
	ema21_20min number(10,2), 
	ema9_1hour number(10,2), 
	ema21_1hour number(10,2), 
	time_bid_price timestamp (4), 
	bid_price number(10,2), 
	time_ask_price timestamp (4), 
	ask_price number(10,2), 
	time_high_day timestamp (4), 
	high_day number(10,2), 
	time_low_day timestamp (4), 
	low_day number(10,2), 
	time_close_price timestamp (4), 
	close_price number(10,2), 
	nr_contract_bid_price number(*,0), 
	nr_contract_ask_price number(*,0), 
	nr_contract_last_price number(*,0), 
	volume number(*,0), 
	 constraint fti_last_price_size_ema_hist_fk foreign key (symbol_id)
	  references dtws.futures (symbol_id) enable
   ) tablespace dtws;
   
create global temporary table temp_ema 
  (	EMA3_9_0  number(5,2), 
	EMA3_9_1  number(5,2), 
	EMA3_9_2  number(5,2), 
	EMA3_21_0 number(5,2), 
	EMA3_21_1 number(5,2), 
	EMA3_21_2 number(5,2), 
	EMA5_9_0  number(5,2), 
	EMA5_9_1  number(5,2), 
	EMA5_9_2  number(5,2), 
	EMA5_9_3  number(5,2), 
	EMA5_9_4  number(5,2), 
	EMA5_9_5  number(5,2), 
	EMA5_21_0 number(5,2), 
	EMA5_21_1 number(5,2), 
	EMA5_21_2 number(5,2), 
	EMA5_21_3 number(5,2), 
	EMA5_21_4 number(5,2)
   ) on commit preserve rows;

-----------------------------------------------------------

drop table fti_last_price_size_ema;

create table fti_last_price_size_ema 
(   start_date        timestamp (4), 
	time_last_price   timestamp (4), 
	last_price        number(10,2), 
	ema9_3min_0       number(10,2), 
	ema9_3min_1       number(10,2), 
	ema9_3min_2       number(10,2),     
	ema12_3min_0      number(10,2), 
	ema12_3min_1      number(10,2), 
	ema12_3min_2      number(10,2),     
	ema21_3min_0      number(10,2), 
	ema21_3min_1      number(10,2), 
    ema21_3min_2      number(10,2), 
	ema26_3min_0      number(10,2), 
	ema26_3min_1      number(10,2), 
    ema26_3min_2      number(10,2), 
	ema9_5min_0       number(10,2), 
	ema9_5min_1       number(10,2), 
	ema9_5min_2       number(10,2),     
	ema9_5min_3       number(10,2), 
	ema9_5min_4       number(10,2),     
	ema12_5min_0      number(10,2), 
	ema12_5min_1      number(10,2), 
	ema12_5min_2      number(10,2),     
	ema12_5min_3      number(10,2), 
	ema12_5min_4      number(10,2),     
	ema21_5min_0      number(10,2), 
	ema21_5min_1      number(10,2), 
	ema21_5min_2      number(10,2), 
	ema21_5min_3      number(10,2), 
	ema21_5min_4      number(10,2),     
	ema26_5min_0      number(10,2), 
	ema26_5min_1      number(10,2), 
	ema26_5min_2      number(10,2), 
	ema26_5min_3      number(10,2), 
	ema26_5min_4      number(10,2),     
	sma9_3min_0       number(10,2), 
	sma9_3min_1       number(10,2), 
	sma9_3min_2       number(10,2),     
	sma21_3min_0      number(10,2), 
	sma21_3min_1      number(10,2), 
    sma21_3min_2      number(10,2), 
    sma9_5min_0       number(10,2), 
	sma9_5min_1       number(10,2), 
	sma9_5min_2       number(10,2),     
	sma9_5min_3       number(10,2), 
	sma9_5min_4       number(10,2),     
    sma21_5min_0      number(10,2), 
	sma21_5min_1      number(10,2), 
	sma21_5min_2      number(10,2),     
	sma21_5min_3      number(10,2), 
	sma21_5min_4      number(10,2),     
	time_bid_price    timestamp (4), 
	bid_price         number(10,2), 
	time_ask_price    timestamp (4), 
	ask_price         number(10,2), 
	time_high_day     timestamp (4), 
	high_day          number(10,2), 
	time_low_day      timestamp (4), 
	low_day           number(10,2), 
	time_close_price       timestamp (4), 
	close_price            number(10,2), 
	nr_contract_bid_price  number(*,0), 
	nr_contract_ask_price  number(*,0), 
	nr_contract_last_price number(*,0), 
	volume                 number(*,0)
   ) pctfree 5 pctused 70 initrans 1 maxtrans 255 tablespace DTWS ;

comment on column fti_last_price_size_ema.symbol_id is 'Reference to primary key Future symbol'; 
comment on column fti_last_price_size_ema.start_date is 'Timestamp of the inital/first record in this range of TWS ticks';
comment on column fti_last_price_size_ema.time_last_price is 'Timestamp of latest TWS tick';
comment on column fti_last_price_size_ema.last_price is 'tickType = 4, last price at which the contract traded';
comment on column fti_last_price_size_ema.ema21_3min is 'Calculated EMA 9 periods, 3 minutes.';
comment on column fti_last_price_size_ema.ema9_5min is 'Calculated EMA 9 periods, 5 minutes.';
comment on column fti_last_price_size_ema.ema21_5min is 'Calculated EMA 21 periods, 5 minutes.';
comment on column fti_last_price_size_ema.ema9_10min is 'Calculated EMA 9 periods, 10 minutes.';
comment on column fti_last_price_size_ema.ema21_10min is 'Calculated EMA 21 periods, 10 minutes.';
comment on column fti_last_price_size_ema.ema9_20min is 'Calculated EMA 9 periods, 20 minutes.';
comment on column fti_last_price_size_ema.ema21_20min is 'Calculated EMA 21 periods, 20 minutes.';
comment on column fti_last_price_size_ema.ema9_1hour is 'Calculated EMA 9 periods, 1 hour.';
comment on column fti_last_price_size_ema.ema21_1hour is 'Calculated EMA 21 periods, 1 hour.';
comment on column fti_last_price_size_ema.time_bid_price is 'Timestamp of latest TWS tick';
comment on column fti_last_price_size_ema.bid_price is 'tickType = 1, last highest bid price for the contract';
comment on column fti_last_price_size_ema.ask_price is 'tickType = 2, last lowest offer price for the contract';
comment on column fti_last_price_size_ema.high_day is 'tickType = 6, high price for the day';
comment on column fti_last_price_size_ema.low_day is 'tickType = 7, low price for the day';
comment on column fti_last_price_size_ema.close_price is 'tickType = 9, the last available closing price for the previous day';
comment on column fti_last_price_size_ema.nr_contract_bid_price is 'tickType = 0, number of contracts offered at the bid price';
comment on column fti_last_price_size_ema.nr_contract_ask_price is 'tickType = 3, number of contracts offered at the ask price';
comment on column fti_last_price_size_ema.nr_contract_last_price is 'tickType = 5, number of contracts traded at the last price';
comment on column fti_last_price_size_ema.volume is 'tickSize = 8, trading volume for the day (US stocks multiplier 100)';
comment on table  fti_last_price_size_ema  is 'Table contains the future latest prices, volumes and EMA';

create table hist_fti_ema as select * from fti_last_price_size_ema where 1 = 0;


create or replace trigger fti_last_price_ema_compound_trg for update on fti_last_price_size_ema compound trigger
-- global declarations
  l_minute_new      integer;
  l_minute_old      integer := -1;
  l_mod3            integer;
  l_mod5            integer;
  l_time_diff       timestamp;
  l_exec_insert     boolean := false;
  l_time_last_price fti_last_price_size_ema.time_last_price%type;
-----------------------------------------------------------------------------------------------------
/*
before statement is
begin
  null;
end before statement;
*/
-----------------------------------------------------------------------------------------------------

before each row is
begin
    -------------------------------------------------------------------------------------------------
    ----                       Expentional Moving Average                                        ----    
    -------------------------------------------------------------------------------------------------
    l_minute_old := extract(minute from :old.time_last_price);
    l_minute_new := extract(minute from :new.time_last_price);
    l_time_diff  := :new.time_last_price - interval '27' minute;
    --
    if l_minute_new = 0 and l_minute_old <> 0 then                       -- fetch the minute for EMA sample calculation 0,3,6,9.etc
      l_minute_new := 60;                                                -- minute 0 become 60 because 0 - 59 is more then 1 minute 60 - 59 is not
    end if;  
    --
    dbms_output.put_line( l_time_diff || ' > ' || :old.start_date || ' ----- ' || l_minute_old || ' < ' || l_minute_new );
    if l_minute_old < l_minute_new      -- only 1 sample per interval, only use the first price, ignore other prices within the same minute
    and l_time_diff > :old.start_date
    then
      l_exec_insert     := true;
      l_mod3            := mod(l_minute_new, 3);
      l_mod5            := mod(l_minute_new, 5);
      l_time_last_price := trunc(:new.time_last_price, 'MI');
      -- calculate every 3 minutes the EMA, firstrange is (0-27) then (1-25) then (2-26) now starts repeting (3-30) = (0-27) so use ema of (0-27) 
      if l_mod3 = 0 then 
        :new.ema9_3min_0     := calc_ema9_fnc( p_price => :new.last_price, p_ema => :old.ema9_3min_0 , p_threshold => 26, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema12_3min_0    := calc_ema12_fnc(p_price => :new.last_price, p_ema => :old.ema12_3min_0, p_threshold => 15, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema21_3min_0    := calc_ema21_fnc(p_price => :new.last_price, p_ema => :old.ema21_3min_0, p_threshold => 62, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        --         
        :new.sma9_3min_0     := calc_sma9_fnc( p_threshold => 26, p_time_last_price => l_time_last_price, p_price => :new.last_price);
        :new.sma21_3min_0    := calc_sma21_fnc(p_threshold => 62, p_time_last_price => l_time_last_price, p_price => :new.last_price);
        --
      elsif l_mod3 = 1 then 
        :new.ema9_3min_1     := calc_ema9_fnc( p_price => :new.last_price, p_ema => :old.ema9_3min_1 , p_threshold => 26, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema12_3min_1    := calc_ema12_fnc(p_price => :new.last_price, p_ema => :old.ema12_3min_1, p_threshold => 15, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema21_3min_1    := calc_ema21_fnc(p_price => :new.last_price, p_ema => :old.ema21_3min_1, p_threshold => 62, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        --
        :new.sma9_3min_1     := calc_sma9_fnc( p_threshold => 26, p_time_last_price => l_time_last_price, p_price => :new.last_price);
        :new.sma21_3min_1    := calc_sma21_fnc(p_threshold => 62, p_time_last_price => l_time_last_price, p_price => :new.last_price);
        --
      elsif l_mod3 = 2 then
        :new.ema9_3min_2     := calc_ema9_fnc( p_price => :new.last_price, p_ema => :old.ema9_3min_2 , p_threshold => 26, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema12_3min_2    := calc_ema12_fnc(p_price => :new.last_price, p_ema => :old.ema12_3min_2, p_threshold => 15, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema21_3min_2    := calc_ema21_fnc(p_price => :new.last_price, p_ema => :old.ema21_3min_2, p_threshold => 62, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        --
        :new.sma9_3min_2     := calc_sma9_fnc( p_threshold => 26, p_time_last_price => l_time_last_price, p_price => :new.last_price);
        :new.sma21_3min_2    := calc_sma21_fnc(p_threshold => 62, p_time_last_price => l_time_last_price, p_price => :new.last_price);
        --
      end if;
      -------------------------------------------------------------------------------------------------------------------------
      if l_mod5 = 0 then
        :new.ema9_5min_0     := calc_ema9_fnc( p_price => :new.last_price, p_ema => :old.ema9_5min_0 , p_threshold => 44,  p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema12_5min_0    := calc_ema21_fnc(p_price => :new.last_price, p_ema => :old.ema12_5min_0, p_threshold => 59,  p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema21_5min_0    := calc_ema21_fnc(p_price => :new.last_price, p_ema => :old.ema21_5min_0, p_threshold => 104, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema26_5min_0    := calc_ema21_fnc(p_price => :new.last_price, p_ema => :old.ema26_5min_0, p_threshold => 129, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        --
        :new.sma9_5min_0     := calc_sma9_fnc( p_threshold => 44,  p_time_last_price => l_time_last_price, p_price => :new.last_price);
        :new.sma21_5min_0    := calc_sma21_fnc(p_threshold => 104, p_time_last_price => l_time_last_price, p_price => :new.last_price);
        --
      elsif l_mod5 = 1 then
        :new.ema9_5min_1     := calc_ema9_fnc( p_price => :new.last_price, p_ema => :old.ema9_5min_1 , p_threshold => 44 , p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema12_5min_1    := calc_ema21_fnc(p_price => :new.last_price, p_ema => :old.ema12_5min_1, p_threshold => 59,  p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema21_5min_1    := calc_ema21_fnc(p_price => :new.last_price, p_ema => :old.ema21_5min_1, p_threshold => 104, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema26_5min_1    := calc_ema21_fnc(p_price => :new.last_price, p_ema => :old.ema26_5min_1, p_threshold => 129, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        --
        :new.sma9_5min_1     := calc_sma9_fnc( p_threshold => 44,  p_time_last_price => l_time_last_price, p_price => :new.last_price);
        :new.sma21_5min_1    := calc_sma21_fnc(p_threshold => 104, p_time_last_price => l_time_last_price, p_price => :new.last_price);
        --
      elsif l_mod5 = 2 then
        :new.ema9_5min_2     := calc_ema9_fnc( p_price => :new.last_price, p_ema => :old.ema9_5min_2 , p_threshold => 44 , p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema12_5min_2    := calc_ema21_fnc(p_price => :new.last_price, p_ema => :old.ema12_5min_2, p_threshold => 59,  p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema21_5min_2    := calc_ema21_fnc(p_price => :new.last_price, p_ema => :old.ema21_5min_2, p_threshold => 104, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema26_5min_2    := calc_ema21_fnc(p_price => :new.last_price, p_ema => :old.ema26_5min_2, p_threshold => 129, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        --
        :new.sma9_5min_2     := calc_sma9_fnc( p_threshold => 44,  p_time_last_price => l_time_last_price, p_price => :new.last_price);
        :new.sma21_5min_2    := calc_sma21_fnc(p_threshold => 104, p_time_last_price => l_time_last_price, p_price => :new.last_price);
        --
      elsif l_mod5 = 3 then
        :new.ema9_5min_3     := calc_ema9_fnc( p_price => :new.last_price, p_ema => :old.ema9_5min_3 , p_threshold => 44 , p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema12_5min_3    := calc_ema21_fnc(p_price => :new.last_price, p_ema => :old.ema12_5min_3, p_threshold => 59,  p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema21_5min_3    := calc_ema21_fnc(p_price => :new.last_price, p_ema => :old.ema21_5min_3, p_threshold => 104, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema26_5min_3    := calc_ema21_fnc(p_price => :new.last_price, p_ema => :old.ema26_5min_3, p_threshold => 129, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        --
        :new.sma9_5min_3     := calc_sma9_fnc( p_threshold => 44,  p_time_last_price => l_time_last_price, p_price => :new.last_price);
        :new.sma21_5min_3    := calc_sma21_fnc(p_threshold => 104, p_time_last_price => l_time_last_price, p_price => :new.last_price);
        --
      elsif l_mod5 = 4 then
        :new.ema9_5min_4     := calc_ema9_fnc( p_price => :new.last_price, p_ema => :old.ema9_5min_4 , p_threshold => 44 , p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema12_5min_4    := calc_ema21_fnc(p_price => :new.last_price, p_ema => :old.ema12_5min_4, p_threshold => 59,  p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema21_5min_4    := calc_ema21_fnc(p_price => :new.last_price, p_ema => :old.ema21_5min_4, p_threshold => 104, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema26_5min_4    := calc_ema21_fnc(p_price => :new.last_price, p_ema => :old.ema26_5min_4, p_threshold => 129, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        --         
        :new.sma9_5min_4     := calc_sma9_fnc( p_threshold => 44,  p_time_last_price => l_time_last_price, p_price => :new.last_price);
        :new.sma21_5min_4    := calc_sma21_fnc(p_threshold => 104, p_time_last_price => l_time_last_price, p_price => :new.last_price);
      end if;
      --
    end if;
end before each row;

-----------------------------------------------------------------------------------------------------

after each row is
begin
    -------------------------------------------------------------------------------------------------
    ----                               CANDLEBARS                                                ----
    -------------------------------------------------------------------------------------------------
    -- insert a record in fti_candlebars
    -- must be a pragma transaction because insert of fti_last price is not yet commited
    create_candlebar( :new.time_last_price, :old.time_last_price );
    
    -------------------------------------------------------------------------------------------------
    ----        Create one history record for each minute needed for EMA calculation             ----    
    -------------------------------------------------------------------------------------------------
    if l_exec_insert         ---l_minute_old < l_minute_new
    then
       --
       insert into fti_ema( date_time, last_price, ema9_3min, sma9_3min, ema21_3min, sma21_3min, ema9_5min, sma9_5min, ema21_5min, sma21_5min )
       values( l_time_last_price
             , :new.last_price
             , case l_mod3 when 0 then :new.ema9_3min_0
                           when 1 then :new.ema9_3min_1
                           else        :new.ema9_3min_2
               end 
             , case l_mod3 when 0 then :new.sma9_3min_0
                           when 1 then :new.sma9_3min_1
                           else        :new.sma9_3min_2
               end 
             , case l_mod3 when 0 then :new.ema21_3min_0
                           when 1 then :new.ema21_3min_1
                           else        :new.ema21_3min_2
               end    
             , case l_mod3 when 0 then :new.sma21_3min_0
                           when 1 then :new.sma21_3min_1
                           else        :new.sma21_3min_2
               end    
             , case l_mod5 when 0 then :new.ema9_5min_0
                           when 1 then :new.ema9_5min_1
                           when 2 then :new.ema9_5min_2
                           when 3 then :new.ema9_5min_3
                           else        :new.ema9_5min_4
               end
             , case l_mod5 when 0 then :new.sma9_5min_0 
                           when 1 then :new.sma9_5min_1 
                           when 2 then :new.sma9_5min_2 
                           when 3 then :new.sma9_5min_3 
                           else        :new.sma9_5min_4 
               end
             , case l_mod5 when 0 then :new.ema21_5min_0 
                           when 1 then :new.ema21_5min_1 
                           when 2 then :new.ema21_5min_2 
                           when 3 then :new.ema21_5min_3 
                           else        :new.ema21_5min_4 
               end
             , case l_mod5 when 0 then :new.sma21_5min_0 
                           when 1 then :new.sma21_5min_1 
                           when 2 then :new.sma21_5min_2 
                           when 3 then :new.sma21_5min_3 
                           else        :new.sma21_5min_4 
               end
             );  
    end if; 
end after each row;
------------------------------------------------------------------------------------------------------
after statement is
begin
  null;
end after statement;
-----------------------------------------------------------------------------------------------------
end;
/

===============================================================================================================================
/*   partition version

drop table fti_last_price_size_ema;
create table fti_last_price_size_ema 
 (	symbol_id         number(*,0), 
	start_date        timestamp (4), 
	time_last_price   timestamp (4), 
	last_price        number(10,2), 
	ema9_3min_0       number(10,2), 
	ema9_3min_1       number(10,2), 
	ema9_3min_2       number(10,2),     
	ema21_3min_0      number(10,2), 
	ema21_3min_1      number(10,2), 
    ema21_3min_2      number(10,2), 
	ema9_5min_0       number(10,2), 
	ema9_5min_1       number(10,2), 
	ema9_5min_2       number(10,2),     
	ema9_5min_3       number(10,2), 
	ema9_5min_4       number(10,2),     
	ema21_5min_0      number(10,2), 
	ema21_5min_1      number(10,2), 
	ema21_5min_2      number(10,2), 
	ema21_5min_3      number(10,2), 
	ema21_5min_4      number(10,2),     
	ema9_10min      number(10,2), 
	ema21_10min     number(10,2), 
	ema9_20min      number(10,2), 
	ema21_20min     number(10,2), 
	ema9_1hour      number(10,2), 
	ema21_1hour     number(10,2), 
	time_bid_price  timestamp (4), 
	bid_price       number(10,2), 
	time_ask_price  timestamp (4), 
	ask_price       number(10,2), 
	time_high_day   timestamp (4), 
	high_day        number(10,2), 
	time_low_day    timestamp (4), 
	low_day         number(10,2), 
	time_close_price       timestamp (4), 
	close_price            number(10,2), 
	nr_contract_bid_price  number(*,0), 
	nr_contract_ask_price  number(*,0), 
	nr_contract_last_price number(*,0), 
	volume                 number(*,0), 
	 constraint fti_last_price_size_ema_fk foreign key (symbol_id)
	  references dtws.futures (symbol_id) enable
   ) pctfree 5 pctused 70 initrans 1 maxtrans 255 
  tablespace DTWS 
  partition by list (SYMBOL_ID) automatic 
 (partition FTI_LAST_PRICE_SIZE_EMA_FTIF8  values (1) segment creation immediate 
  pctfree 10 pctused 40 initrans 1 maxtrans 255 
 nocompress logging 
  storage(initial 8388608 next 1048576 minextents 1 maxextents 2147483645
  pctincrease 0 freelists 1 freelist groups 1
  buffer_pool default flash_cache default cell_flash_cache default)
  tablespace DTWS , 
 partition FTI_LAST_PRICE_SIZE_EMA_FTIG8  values (2) segment creation immediate 
  pctfree 10 pctused 40 initrans 1 maxtrans 255 
 nocompress logging 
  storage(initial 8388608 next 1048576 minextents 1 maxextents 2147483645
  pctincrease 0 freelists 1 freelist groups 1
  buffer_pool default flash_cache default cell_flash_cache default)
  tablespace DTWS , 
 partition FTI_LAST_PRICE_SIZE_EMA_FTIH8  values (3) segment creation immediate 
  pctfree 10 pctused 40 initrans 1 maxtrans 255 
 nocompress logging 
  storage(initial 8388608 next 1048576 minextents 1 maxextents 2147483645
  pctincrease 0 freelists 1 freelist groups 1
  buffer_pool default flash_cache default cell_flash_cache default)
  tablespace DTWS , 
 partition SYS_P426  values (10) segment creation immediate 
  pctfree 10 pctused 40 initrans 1 maxtrans 255 
 nocompress logging 
  storage(initial 8388608 next 1048576 minextents 1 maxextents 2147483645
  pctincrease 0 freelists 1 freelist groups 1
  buffer_pool default flash_cache default cell_flash_cache default)
  tablespace DTWS , 
 partition SYS_P442  values (11) segment creation immediate 
  pctfree 10 pctused 40 initrans 1 maxtrans 255 
 nocompress logging 
  storage(initial 8388608 next 1048576 minextents 1 maxextents 2147483645
  pctincrease 0 freelists 1 freelist groups 1
  buffer_pool default flash_cache default cell_flash_cache default)
  tablespace DTWS ) ;
*/
   

create or replace function calc_ema9_fnc( p_price           in fti_last_price_size_ema.last_price%type
                                        , p_ema             in fti_last_price_size_ema.ema9_3min_0%type
                                        , p_threshold       in integer  
                                        , p_time_last_price in fti_last_price_size_ema.time_last_price%type   --  :new.time_last_price
                                        , p_start_date      in fti_last_price_size_ema.start_date%type        -- :old.start_date
                                        ) return number   
as 
  -- p_interval are in minuntes. 3,5,10,20,30,60
  -- EMA = EMAp + {K x (Price - EMAp)}                               -- EMA   = Exponential Moving Average
  -- EMAp  = the previous period exponential moving average          -- K     = smoothing constant 
  -- Price = current (last) price
  -- The smoothing constant is derived from the time period selected by the user according to the following formula:
  --  K = 2/(n+1)    where n is the time period chosen by the user. 9 21 etc  2/(9+1) = 0.2    -> EMA = 63.563 + (0.20(61.33 - 63.563))    making  EMA = 63.117
  -- 1 dag / 24 uur / 60 minuten = 0.000694444444
  l_k           number  := 0.2;      -- 2 / (9 + 1);
  l_avg_price   number  := 0;
  l_count       integer := 0;
begin
  -- dbms_output.put_line('calc_ema9_fnc : ' || (trunc(p_time_last_price, 'MI') - numtodsinterval(p_threshold, 'MINUTE') ) || ' > ' ||  p_start_date || ' - mod - ' || ' ' || p_threshold);
  if p_ema is not null
  then
     return ( p_ema + ( l_k * (p_price - p_ema) ) );
  elsif ( trunc(p_time_last_price, 'MI') - numtodsinterval(p_threshold, 'MINUTE') ) >= p_start_date
  then
     if p_threshold = 26   -- 3 minute interval x 9 samples - 1 minute
     then
        -- 
        select round((p_price + sum(a.last_price))/9, 2), count(1) into l_avg_price, l_count 
        from fti_ema a
        where a.date_time >= ( p_time_last_price - interval '25' minute )  
        and mod(extract(minute from a.date_time), 3) = mod(extract(minute from p_time_last_price), 3);
        --
     elsif p_threshold = 44   -- 5 minute interval x 9 samples - 1 minute
     then
        -- 
        select round((p_price + sum(a.last_price))/9, 2), count(1) into l_avg_price, l_count 
        from fti_ema a
        where a.date_time >= ( p_time_last_price - interval '43' minute )  
        and mod(extract(minute from a.date_time), 5) = mod(extract(minute from p_time_last_price), 5);
        --
     end if;
     -- dbms_output.put_line('count : ' || l_count || ' -- avg_price : ' || l_avg_price);
     case when l_count = 8  then return l_avg_price;      -- p_threshold = 26 minutes period
          -- when l_count = 20 then return l_avg_price;      -- p_threshold = 44 minutes period
          else                   return null;
     end case;     
  else
    return null;
  end if;   
  --
end calc_ema9_fnc;

--------------------------------------------------------------------------------------------------------------------------------

create or replace function calc_ema12_fnc( p_price           in fti_last_price_size_ema.last_price%type
                                         , p_ema             in fti_last_price_size_ema.ema9_3min_0%type
                                         , p_threshold       in integer  
                                         , p_time_last_price in fti_last_price_size_ema.time_last_price%type   --  :new.time_last_price
                                         , p_start_date      in fti_last_price_size_ema.start_date%type        -- :old.start_date
                                         ) return number   
as 
  -- p_interval are in minuntes. 3,5,10,20,30,60
  -- EMA = EMAp + {K x (Price - EMAp)}                               -- EMA   = Exponential Moving Average
  -- EMAp  = the previous period exponential moving average          -- K     = smoothing constant 
  -- Price = current (last) price
  -- The smoothing constant is derived from the time period selected by the user according to the following formula:
  --  K = 2/(n+1)    where n is the time period chosen by the user. 9 21 etc  2/(9+1) = 0.2    -> EMA = 63.563 + (0.20(61.33 - 63.563))    making  EMA = 63.117
  -- 1 dag / 24 uur / 60 minuten = 0.000694444444
  l_k           number  := 0.154;       -- 2 / (12 + 1) = 0.153846154;
  l_avg_price   number  := 0;
  l_count       integer := 0;
begin
  -- dbms_output.put_line('calc_ema9_fnc : ' || (trunc(p_time_last_price, 'MI') - numtodsinterval(p_threshold, 'MINUTE') ) || ' > ' ||  p_start_date || ' - mod - ' || ' ' || p_threshold);
  if p_ema is not null
  then
     return ( p_ema + ( l_k * (p_price - p_ema) ) );
  elsif ( trunc(p_time_last_price, 'MI') - numtodsinterval(p_threshold, 'MINUTE') ) >= p_start_date
  then
     if p_threshold = 35   -- 3 minute interval x 12 samples - 1 minute
     then
        -- 
        select round((p_price + sum(a.last_price))/11, 2), count(1) into l_avg_price, l_count 
        from fti_ema a
        where a.date_time >= ( p_time_last_price - interval '35' minute )  
        and mod(extract(minute from a.date_time), 3) = mod(extract(minute from p_time_last_price), 3);
        --
     elsif p_threshold = 59   -- 5 minute interval x 12 samples - 1 minute
     then
        -- 
        select round((p_price + sum(a.last_price))/11, 2), count(1) into l_avg_price, l_count 
        from fti_ema a
        where a.date_time >= ( p_time_last_price - interval '57' minute )  
        and mod(extract(minute from a.date_time), 5) = mod(extract(minute from p_time_last_price), 5);
        --
     end if;
     -- dbms_output.put_line('count : ' || l_count || ' -- avg_price : ' || l_avg_price);
     case when l_count = 11 then return l_avg_price;      -- 12 samples
          -- when l_count = 20 then return l_avg_price;      -- 21 samples  ??? nooit aangeroepen, kan weg?
          else                   return null;
     end case;     
  else
    return null;
  end if;   
  --
end calc_ema12_fnc;
/

--------------------------------------------------------------------------------------------------------------------------------
create or replace function calc_ema26_fnc( p_price           in fti_last_price_size_ema.last_price%type
                                         , p_ema             in fti_last_price_size_ema.ema9_3min_0%type
                                         , p_threshold       in integer  
                                         , p_time_last_price in fti_last_price_size_ema.time_last_price%type   
                                         , p_start_date      in fti_last_price_size_ema.start_date%type        
                                         ) return number   
as 
  -- p_interval are in minuntes. 3,5,10,20,30,60
  -- EMA = EMAp + {K x (Price - EMAp)}                               -- EMA   = Exponential Moving Average
  -- EMAp  = the previous period exponential moving average          -- K     = smoothing constant 
  -- Price = current (last) price
  -- The smoothing constant is derived from the time period selected by the user according to the following formula:
  --  K = 2/(n+1)    where n is the time period chosen by the user. 9 21 etc  2/(9+1) = 0.2    -> EMA = 63.563 + (0.20(61.33 - 63.563))    making  EMA = 63.117
  -- 1 dag / 24 uur / 60 minuten = 0.000694444444
  l_k           number  := 0.074;       -- 2 / (26 + 1) = 0.074074074;
  l_avg_price   number  := 0;
  l_count       integer := 0;
begin
  -- dbms_output.put_line('calc_ema9_fnc : ' || (trunc(p_time_last_price, 'MI') - numtodsinterval(p_threshold, 'MINUTE') ) || ' > ' ||  p_start_date || ' - mod - ' || ' ' || p_threshold);
  if p_ema is not null
  then
     return ( p_ema + ( l_k * (p_price - p_ema) ) );
  elsif ( trunc(p_time_last_price, 'MI') - numtodsinterval(p_threshold, 'MINUTE') ) >= p_start_date
  then
     if p_threshold = 35   -- 3 minute interval x 26 samples - 1 minute
     then
        -- 
        select round((p_price + sum(a.last_price))/11, 2), count(1) into l_avg_price, l_count 
        from fti_ema a
        where a.date_time >= ( p_time_last_price - interval '35' minute )  
        and mod(extract(minute from a.date_time), 3) = mod(extract(minute from p_time_last_price), 3);
        --
     elsif p_threshold = 59   -- 5 minute interval x 26 samples - 1 minute
     then
        -- 
        select round((p_price + sum(a.last_price))/11, 2), count(1) into l_avg_price, l_count 
        from fti_ema a
        where a.date_time >= ( p_time_last_price - interval '57' minute )  
        and mod(extract(minute from a.date_time), 5) = mod(extract(minute from p_time_last_price), 5);
        --
     end if;
     -- dbms_output.put_line('count : ' || l_count || ' -- avg_price : ' || l_avg_price);
     case when l_count = 56 then return l_avg_price;      -- 12 samples
          -- when l_count = 20 then return l_avg_price;      -- 21 samples  ??? nooit aangeroepen, kan weg?
          else                   return null;
     end case;     
  else
    return null;
  end if;   
  --
end calc_ema26_fnc;
/

-----------------------------------------------------------


------------------------------------------------------------------------------------------------------

drop table fti_ema;

create table fti_ema 
(   time_last_price timestamp (4), 
	last_price      number(10,2), 
	ema9_3min       number(10,2), 
	ema12_3min      number(10,2), 
    ema21_3min      number(10,2),
	ema26_3min      number(10,2), 
	ema9_5min       number(10,2), 
	ema12_5min      number(10,2), 
	ema21_5min      number(10,2), 
	ema26_5min      number(10,2), 
	sma9_3min       number(10,2), 
	sma21_3min      number(10,2), 
    sma9_5min       number(10,2), 
    sma21_5min      number(10,2)
) pctfree 5 pctused 70 initrans 1 maxtrans 255 tablespace DTWS ;
