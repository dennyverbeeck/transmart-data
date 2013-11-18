--
-- Type: TABLE; Owner: BIOMART; Name: BIO_LIT_MODEL_DATA
--
 CREATE TABLE "BIOMART"."BIO_LIT_MODEL_DATA" 
  (	"BIO_LIT_MODEL_DATA_ID" NUMBER(18,0) NOT NULL ENABLE, 
"ETL_ID" NVARCHAR2(50), 
"MODEL_TYPE" NVARCHAR2(50), 
"DESCRIPTION" NVARCHAR2(1000), 
"STIMULATION" NVARCHAR2(1000), 
"CONTROL_CHALLENGE" NVARCHAR2(500), 
"CHALLENGE" NVARCHAR2(1000), 
"SENTIZATION" NVARCHAR2(1000), 
"ZYGOSITY" NVARCHAR2(250), 
"EXPERIMENTAL_MODEL" NVARCHAR2(250), 
"ANIMAL_WILD_TYPE" NVARCHAR2(250), 
"TISSUE" NVARCHAR2(250), 
"CELL_TYPE" NVARCHAR2(250), 
"CELL_LINE" NVARCHAR2(250), 
"BODY_SUBSTANCE" NVARCHAR2(250), 
"COMPONENT" NVARCHAR2(250), 
"GENE_ID" NVARCHAR2(250), 
 CONSTRAINT "BIO_LIT_MODEL_DATA_PK" PRIMARY KEY ("BIO_LIT_MODEL_DATA_ID")
 USING INDEX
 TABLESPACE "INDX"  ENABLE
  ) SEGMENT CREATION DEFERRED
 TABLESPACE "BIOMART" ;

--
-- Type: TRIGGER; Owner: BIOMART; Name: TRG_BIO_LIT_MODEL_DATA_ID
--
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_LIT_MODEL_DATA_ID" 
before insert on "BIO_LIT_MODEL_DATA"
for each row
begin
     if inserting then
       if :NEW."BIO_LIT_MODEL_DATA_ID" is null then
          select SEQ_BIO_DATA_ID.nextval into :NEW."BIO_LIT_MODEL_DATA_ID" from dual;
       end if;
    end if; end;







/
ALTER TRIGGER "BIOMART"."TRG_BIO_LIT_MODEL_DATA_ID" ENABLE;
 