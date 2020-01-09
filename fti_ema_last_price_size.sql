
  CREATE TABLE "DTWS"."FTI_LAST_PRICE_SIZE_EMA" 
   (	"START_DATE" TIMESTAMP (4), 
	"TIME_LAST_PRICE" TIMESTAMP (4), 
	"LAST_PRICE" NUMBER(10,2), 
	"EMA9_3MIN_0" NUMBER(10,2), 
	"EMA9_3MIN_1" NUMBER(10,2), 
	"EMA9_3MIN_2" NUMBER(10,2), 
	"EMA12_3MIN_0" NUMBER(10,2), 
	"EMA12_3MIN_1" NUMBER(10,2), 
	"EMA12_3MIN_2" NUMBER(10,2), 
	"EMA21_3MIN_0" NUMBER(10,2), 
	"EMA21_3MIN_1" NUMBER(10,2), 
	"EMA21_3MIN_2" NUMBER(10,2), 
	"EMA26_3MIN_0" NUMBER(10,2), 
	"EMA26_3MIN_1" NUMBER(10,2), 
	"EMA26_3MIN_2" NUMBER(10,2), 
	"EMA9_5MIN_0" NUMBER(10,2), 
	"EMA9_5MIN_1" NUMBER(10,2), 
	"EMA9_5MIN_2" NUMBER(10,2), 
	"EMA9_5MIN_3" NUMBER(10,2), 
	"EMA9_5MIN_4" NUMBER(10,2), 
	"EMA12_5MIN_0" NUMBER(10,2), 
	"EMA12_5MIN_1" NUMBER(10,2), 
	"EMA12_5MIN_2" NUMBER(10,2), 
	"EMA12_5MIN_3" NUMBER(10,2), 
	"EMA12_5MIN_4" NUMBER(10,2), 
	"EMA21_5MIN_0" NUMBER(10,2), 
	"EMA21_5MIN_1" NUMBER(10,2), 
	"EMA21_5MIN_2" NUMBER(10,2), 
	"EMA21_5MIN_3" NUMBER(10,2), 
	"EMA21_5MIN_4" NUMBER(10,2), 
	"EMA26_5MIN_0" NUMBER(10,2), 
	"EMA26_5MIN_1" NUMBER(10,2), 
	"EMA26_5MIN_2" NUMBER(10,2), 
	"EMA26_5MIN_3" NUMBER(10,2), 
	"EMA26_5MIN_4" NUMBER(10,2), 
         macd9_3min_0  number(10,2),
         macd9_3min_1  number(10,2),
         macd9_3min_2  number(10,2),
         macd9_5min_0  number(10,2),
         macd9_5min_1  number(10,2),
         macd9_5min_2  number(10,2),
         macd9_5min_3  number(10,2),
         macd9_5min_4  number(10,2),
	"SMA9_3MIN_0" NUMBER(10,2), 
	"SMA9_3MIN_1" NUMBER(10,2), 
	"SMA9_3MIN_2" NUMBER(10,2), 
	"SMA21_3MIN_0" NUMBER(10,2), 
	"SMA21_3MIN_1" NUMBER(10,2), 
	"SMA21_3MIN_2" NUMBER(10,2), 
	"SMA9_5MIN_0" NUMBER(10,2), 
	"SMA9_5MIN_1" NUMBER(10,2), 
	"SMA9_5MIN_2" NUMBER(10,2), 
	"SMA9_5MIN_3" NUMBER(10,2), 
	"SMA9_5MIN_4" NUMBER(10,2), 
	"SMA21_5MIN_0" NUMBER(10,2), 
	"SMA21_5MIN_1" NUMBER(10,2), 
	"SMA21_5MIN_2" NUMBER(10,2), 
	"SMA21_5MIN_3" NUMBER(10,2), 
	"SMA21_5MIN_4" NUMBER(10,2), 
	"TIME_BID_PRICE" TIMESTAMP (4), 
	"BID_PRICE" NUMBER(10,2), 
	"TIME_ASK_PRICE" TIMESTAMP (4), 
	"ASK_PRICE" NUMBER(10,2), 
	"TIME_HIGH_DAY" TIMESTAMP (4), 
	"HIGH_DAY" NUMBER(10,2), 
	"TIME_LOW_DAY" TIMESTAMP (4), 
	"LOW_DAY" NUMBER(10,2), 
	"TIME_CLOSE_PRICE" TIMESTAMP (4), 
	"CLOSE_PRICE" NUMBER(10,2), 
	"NR_CONTRACT_BID_PRICE" NUMBER(*,0), 
	"NR_CONTRACT_ASK_PRICE" NUMBER(*,0), 
	"NR_CONTRACT_LAST_PRICE" NUMBER(*,0), 
	"VOLUME" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 5 PCTUSED 70 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DTWS" ;

   COMMENT ON COLUMN "DTWS"."FTI_LAST_PRICE_SIZE_EMA"."START_DATE" IS 'Timestamp of the inital/first record in this range of TWS ticks';
   COMMENT ON COLUMN "DTWS"."FTI_LAST_PRICE_SIZE_EMA"."TIME_LAST_PRICE" IS 'Timestamp of latest TWS tick';
   COMMENT ON COLUMN "DTWS"."FTI_LAST_PRICE_SIZE_EMA"."LAST_PRICE" IS 'tickType = 4, last price at which the contract traded';
   COMMENT ON COLUMN "DTWS"."FTI_LAST_PRICE_SIZE_EMA"."TIME_BID_PRICE" IS 'Timestamp of latest TWS tick';
   COMMENT ON COLUMN "DTWS"."FTI_LAST_PRICE_SIZE_EMA"."BID_PRICE" IS 'tickType = 1, last highest bid price for the contract';
   COMMENT ON COLUMN "DTWS"."FTI_LAST_PRICE_SIZE_EMA"."ASK_PRICE" IS 'tickType = 2, last lowest offer price for the contract';
   COMMENT ON COLUMN "DTWS"."FTI_LAST_PRICE_SIZE_EMA"."HIGH_DAY" IS 'tickType = 6, high price for the day';
   COMMENT ON COLUMN "DTWS"."FTI_LAST_PRICE_SIZE_EMA"."LOW_DAY" IS 'tickType = 7, low price for the day';
   COMMENT ON COLUMN "DTWS"."FTI_LAST_PRICE_SIZE_EMA"."CLOSE_PRICE" IS 'tickType = 9, the last available closing price for the previous day';
   COMMENT ON COLUMN "DTWS"."FTI_LAST_PRICE_SIZE_EMA"."NR_CONTRACT_BID_PRICE" IS 'tickType = 0, number of contracts offered at the bid price';
   COMMENT ON COLUMN "DTWS"."FTI_LAST_PRICE_SIZE_EMA"."NR_CONTRACT_ASK_PRICE" IS 'tickType = 3, number of contracts offered at the ask price';
   COMMENT ON COLUMN "DTWS"."FTI_LAST_PRICE_SIZE_EMA"."NR_CONTRACT_LAST_PRICE" IS 'tickType = 5, number of contracts traded at the last price';
   COMMENT ON COLUMN "DTWS"."FTI_LAST_PRICE_SIZE_EMA"."VOLUME" IS 'tickSize = 8, trading volume for the day (US stocks multiplier 100)';
   COMMENT ON TABLE "DTWS"."FTI_LAST_PRICE_SIZE_EMA"  IS 'Table contains the future latest prices, volumes and EMA';

  CREATE OR REPLACE EDITIONABLE TRIGGER "DTWS"."FTI_LAST_PRICE_EMA_COMPOUND_TRG" for update on fti_last_price_size_ema compound trigger
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
        :new.ema12_3min_0    := calc_ema12_fnc(p_price => :new.last_price, p_ema => :old.ema12_3min_0, p_threshold => 35, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema21_3min_0    := calc_ema21_fnc(p_price => :new.last_price, p_ema => :old.ema21_3min_0, p_threshold => 62, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema26_3min_0    := calc_ema26_fnc(p_price => :new.last_price, p_ema => :old.ema26_3min_0, p_threshold => 77, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        --         
        :new.sma9_3min_0     := calc_sma9_fnc( p_threshold => 26, p_time_last_price => l_time_last_price, p_price => :new.last_price);
        :new.sma21_3min_0    := calc_sma21_fnc(p_threshold => 62, p_time_last_price => l_time_last_price, p_price => :new.last_price);
        --
      elsif l_mod3 = 1 then 
        :new.ema9_3min_1     := calc_ema9_fnc( p_price => :new.last_price, p_ema => :old.ema9_3min_1 , p_threshold => 26, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema12_3min_1    := calc_ema12_fnc(p_price => :new.last_price, p_ema => :old.ema12_3min_1, p_threshold => 35, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema21_3min_1    := calc_ema21_fnc(p_price => :new.last_price, p_ema => :old.ema21_3min_1, p_threshold => 62, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema26_3min_1    := calc_ema26_fnc(p_price => :new.last_price, p_ema => :old.ema26_3min_1, p_threshold => 77, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        --
        :new.sma9_3min_1     := calc_sma9_fnc( p_threshold => 26, p_time_last_price => l_time_last_price, p_price => :new.last_price);
        :new.sma21_3min_1    := calc_sma21_fnc(p_threshold => 62, p_time_last_price => l_time_last_price, p_price => :new.last_price);
        --
      elsif l_mod3 = 2 then
        :new.ema9_3min_2     := calc_ema9_fnc( p_price => :new.last_price, p_ema => :old.ema9_3min_2 , p_threshold => 26, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema12_3min_2    := calc_ema12_fnc(p_price => :new.last_price, p_ema => :old.ema12_3min_2, p_threshold => 35, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema21_3min_2    := calc_ema21_fnc(p_price => :new.last_price, p_ema => :old.ema21_3min_2, p_threshold => 62, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema26_3min_2    := calc_ema26_fnc(p_price => :new.last_price, p_ema => :old.ema26_3min_2, p_threshold => 77, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        --
        :new.sma9_3min_2     := calc_sma9_fnc( p_threshold => 26, p_time_last_price => l_time_last_price, p_price => :new.last_price);
        :new.sma21_3min_2    := calc_sma21_fnc(p_threshold => 62, p_time_last_price => l_time_last_price, p_price => :new.last_price);
        --
      end if;
      -------------------------------------------------------------------------------------------------------------------------
      if l_mod5 = 0 then
        :new.ema9_5min_0     := calc_ema9_fnc( p_price => :new.last_price, p_ema => :old.ema9_5min_0 , p_threshold => 44,  p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema12_5min_0    := calc_ema12_fnc(p_price => :new.last_price, p_ema => :old.ema12_5min_0, p_threshold => 59,  p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema21_5min_0    := calc_ema21_fnc(p_price => :new.last_price, p_ema => :old.ema21_5min_0, p_threshold => 104, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema26_5min_0    := calc_ema26_fnc(p_price => :new.last_price, p_ema => :old.ema26_5min_0, p_threshold => 129, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        --
        :new.sma9_5min_0     := calc_sma9_fnc( p_threshold => 44,  p_time_last_price => l_time_last_price, p_price => :new.last_price);
        :new.sma21_5min_0    := calc_sma21_fnc(p_threshold => 104, p_time_last_price => l_time_last_price, p_price => :new.last_price);
        --
      elsif l_mod5 = 1 then
        :new.ema9_5min_1     := calc_ema9_fnc( p_price => :new.last_price, p_ema => :old.ema9_5min_1 , p_threshold => 44 , p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema12_5min_1    := calc_ema12_fnc(p_price => :new.last_price, p_ema => :old.ema12_5min_1, p_threshold => 59,  p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema21_5min_1    := calc_ema21_fnc(p_price => :new.last_price, p_ema => :old.ema21_5min_1, p_threshold => 104, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema26_5min_1    := calc_ema26_fnc(p_price => :new.last_price, p_ema => :old.ema26_5min_1, p_threshold => 129, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        --
        :new.sma9_5min_1     := calc_sma9_fnc( p_threshold => 44,  p_time_last_price => l_time_last_price, p_price => :new.last_price);
        :new.sma21_5min_1    := calc_sma21_fnc(p_threshold => 104, p_time_last_price => l_time_last_price, p_price => :new.last_price);
        --
      elsif l_mod5 = 2 then
        :new.ema9_5min_2     := calc_ema9_fnc( p_price => :new.last_price, p_ema => :old.ema9_5min_2 , p_threshold => 44 , p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema12_5min_2    := calc_ema12_fnc(p_price => :new.last_price, p_ema => :old.ema12_5min_2, p_threshold => 59,  p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema21_5min_2    := calc_ema21_fnc(p_price => :new.last_price, p_ema => :old.ema21_5min_2, p_threshold => 104, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema26_5min_2    := calc_ema26_fnc(p_price => :new.last_price, p_ema => :old.ema26_5min_2, p_threshold => 129, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        --
        :new.sma9_5min_2     := calc_sma9_fnc( p_threshold => 44,  p_time_last_price => l_time_last_price, p_price => :new.last_price);
        :new.sma21_5min_2    := calc_sma21_fnc(p_threshold => 104, p_time_last_price => l_time_last_price, p_price => :new.last_price);
        --
      elsif l_mod5 = 3 then
        :new.ema9_5min_3     := calc_ema9_fnc( p_price => :new.last_price, p_ema => :old.ema9_5min_3 , p_threshold => 44 , p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema12_5min_3    := calc_ema12_fnc(p_price => :new.last_price, p_ema => :old.ema12_5min_3, p_threshold => 59,  p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema21_5min_3    := calc_ema21_fnc(p_price => :new.last_price, p_ema => :old.ema21_5min_3, p_threshold => 104, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema26_5min_3    := calc_ema26_fnc(p_price => :new.last_price, p_ema => :old.ema26_5min_3, p_threshold => 129, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        --
        :new.sma9_5min_3     := calc_sma9_fnc( p_threshold => 44,  p_time_last_price => l_time_last_price, p_price => :new.last_price);
        :new.sma21_5min_3    := calc_sma21_fnc(p_threshold => 104, p_time_last_price => l_time_last_price, p_price => :new.last_price);
        --
      elsif l_mod5 = 4 then
        :new.ema9_5min_4     := calc_ema9_fnc( p_price => :new.last_price, p_ema => :old.ema9_5min_4 , p_threshold => 44 , p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema12_5min_4    := calc_ema12_fnc(p_price => :new.last_price, p_ema => :old.ema12_5min_4, p_threshold => 59,  p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema21_5min_4    := calc_ema21_fnc(p_price => :new.last_price, p_ema => :old.ema21_5min_4, p_threshold => 104, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
        :new.ema26_5min_4    := calc_ema26_fnc(p_price => :new.last_price, p_ema => :old.ema26_5min_4, p_threshold => 129, p_time_last_price => l_time_last_price, p_start_date => :old.start_date );
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
       insert into fti_ema( time_last_price, last_price
                          , ema9_3min, ema12_3min, ema21_3min, ema26_3min
                          , ema9_5min, ema12_5min, ema21_5min, ema26_5min
                          -- , sma9_3min, sma21_3min, sma9_5min, sma21_5min
                          )
       values( l_time_last_price
             , :new.last_price
             , case l_mod3 when 0 then :new.ema9_3min_0
                           when 1 then :new.ema9_3min_1
                           else        :new.ema9_3min_2
               end 
             , case l_mod3 when 0 then :new.ema12_3min_0
                           when 1 then :new.ema12_3min_1
                           else        :new.ema12_3min_2
               end    
             , case l_mod3 when 0 then :new.ema21_3min_0
                           when 1 then :new.ema21_3min_1
                           else        :new.ema21_3min_2
               end
             , case l_mod3 when 0 then :new.ema26_3min_0
                           when 1 then :new.ema26_3min_1
                           else        :new.ema26_3min_2
               end    
             ---  
             , case l_mod5 when 0 then :new.ema9_5min_0
                           when 1 then :new.ema9_5min_1
                           when 2 then :new.ema9_5min_2
                           when 3 then :new.ema9_5min_3
                           else        :new.ema9_5min_4
               end
             , case l_mod5 when 0 then :new.ema12_5min_0 
                           when 1 then :new.ema12_5min_1 
                           when 2 then :new.ema12_5min_2 
                           when 3 then :new.ema12_5min_3 
                           else        :new.ema12_5min_4 
               end

             , case l_mod5 when 0 then :new.ema21_5min_0 
                           when 1 then :new.ema21_5min_1 
                           when 2 then :new.ema21_5min_2 
                           when 3 then :new.ema21_5min_3 
                           else        :new.ema21_5min_4 
               end
             , case l_mod5 when 0 then :new.ema26_5min_0 
                           when 1 then :new.ema26_5min_1 
                           when 2 then :new.ema26_5min_2 
                           when 3 then :new.ema26_5min_3 
                           else        :new.ema26_5min_4 
               end
             ---
/*             , case l_mod3 when 0 then :new.sma26_3min_0
                           when 1 then :new.sma26_3min_1
                           else        :new.sma26_3min_2
               end    
             , case l_mod3 when 0 then :new.sma9_3min_0
                           when 1 then :new.sma9_3min_1
                           else        :new.sma9_3min_2
               end 
             , case l_mod5 when 0 then :new.sma21_5min_0 
                           when 1 then :new.sma21_5min_1 
                           when 2 then :new.sma21_5min_2 
                           when 3 then :new.sma21_5min_3 
                           else        :new.sma21_5min_4 
               end  */
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
ALTER TRIGGER "DTWS"."FTI_LAST_PRICE_EMA_COMPOUND_TRG" ENABLE;

