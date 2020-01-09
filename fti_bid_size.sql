
CREATE TABLE FTI_BID_SIZE 
( SYMBOL_ID NUMBER(*,0), 
  DATE_TIME TIMESTAMP (4) DEFAULT sysdate, 
  BID_SIZE NUMBER(*,0), 
  CONSTRAINT FTI_BID_SIZE_FK1 FOREIGN KEY (SYMBOL_ID)
	  REFERENCES FUTURES (SYMBOL_ID) ENABLE
) 
TABLESPACE DTWS;

COMMENT ON COLUMN FTI_BID_SIZE.SYMBOL_ID IS 'Reference to primary key Future symbol';
COMMENT ON COLUMN FTI_BID_SIZE.DATE_TIME IS 'Timestamp of TWS tickprice';
COMMENT ON COLUMN FTI_BID_SIZE.BID_SIZE IS 'tickSize = 0, number of futures offered for the highest bid price';
COMMENT ON TABLE FTI_BID_SIZE  IS 'Table contains number of futures offered for the bid price';

CREATE INDEX FTI_BID_SIZE_IDX1 ON FTI_BID_SIZE (DATE_TIME) TABLESPACE DTWS ;

CREATE OR REPLACE EDITIONABLE TRIGGER FTI_BID_SIZE_AI_TRG after insert on fti_bid_size for each row
declare
begin
  update fti_last_price_size_ema
  set    nr_contract_bid_price = :new.bid_size
  where symbol_id = :new.symbol_id;
end;
/

ALTER TRIGGER FTI_BID_SIZE_AI_TRG ENABLE;

