delete from fti_last_price where symbol_id=1;

 drop table stock_contract;
  CREATE TABLE "DTWS"."STOCK_CONTRACT" 
   (	"CONID" NUMBER(*,0), 
	"MARKETNAME" VARCHAR2(10 BYTE), 
	"LONGNAME" VARCHAR2(50 BYTE), 
	"INDUSTRY" VARCHAR2(20 BYTE), 
	"CURRENCY" VARCHAR2(5 BYTE), 
	"EXCHANGE" VARCHAR2(5 BYTE), 
	"PRIMARYEXCHANGE" VARCHAR2(5 BYTE), 
	"SYMBOL" VARCHAR2(5 BYTE), 
	"LOCALSYMBOL" VARCHAR2(5 BYTE), 
	"CATEGORY" VARCHAR2(20 BYTE), 
	"SUBCATEGORY" VARCHAR2(30 BYTE), 
	"SECIDTYPE" VARCHAR2(5 BYTE), 
	"SECTYPE" VARCHAR2(5 BYTE), 
	"SECID" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TWS_DATA" ;
  
  alter table stock_contract modify industry varchar2(30);
  commit;

alter table stock_contract add constraint stock_contracts_pk primary key (conid) using index;

alter user dtws identified by "N33d_2_KnoW";
begin
dbms_service.create_service('dtws', 'dtws');
end;
/
select * from v$services;

create table stock_contract( 
  conid           integer
, currency        varchar2(5)
, exchange        varchar2(5)
, primaryExchange varchar2(5)
, symbol          varchar2(5)
, localsymbol     varchar2(5)
, marketname      varchar2(10)
, longname        varchar2(50)
, industry        varchar2(30)
, category        varchar2(5)
, subcategory     varchar2(5)
, ordertypes      varchar2(5)
, secidtype       varchar2(5) 
, sectype         varchar2(5)
, secid           integer
) ;

/*
41275388,BINCK,STK,,0.0,,,SMART,AEB,EUR,BINCK,BINCK,False,,combo:,BINCK,0.0001,ACTIVETIM,ADJUST,ALERT,ALGO,ALGOLTH,ALLOC,AVGCOST,BASKET,BENCHPX,
COND,CONDORDER,CONSCOST,DAY,DEACT,DEACTDIS,DEACTEOD,GAT,GTC,GTD,GTT,HID,IOC,LIT,LMT,LOC,LTH,MIT,MKT,MKT2BBO,MOC,MTL,NGCOMB,NONALGO,OCA,OPG,PEGBENCH,REL,SCALE,SCALERST,SNAPMID,SNAPMKT,SNAPREL,STP,STPLMT,TRAIL,TRAILLIT,TRAILLMT,TRAILMIT,WHATIF,SMART,FWB,AEB,CHIXEN,TRQXEN,BATEEN,TGATE,1,0,BINCKBANK N.V.,,Financial,Diversified Finan Serv,Finance-Invest Bnkr/Brkr,MET,20190806:0800-20190806:2000;20190807:0800-20190807:2000,20190806:0900-20190806:1730;20190807:0900-20190807:1730,,0,1,,,1871,1871,1871,1871,1940,1871,1871,6,[139811682857984: ISIN=NL0000335578;],,,,,,,False,False,0,False,,,,,False,
*/

Date: 20190806  11:15:00  Open: 540.05 High: 540.6 Low: 539.95 Close: 540.55 Volume: 231

drop table fti_candlebars;
create table fti_candlebars
( datum  timestamp 
, open   number(8,2)
, high   number(8,2)
, low    number(8,2)
, close  number(8,2)
, volume integer 
, constraint future_candlebars_pk primary key(datum) using index
);

insert into future_candlebars