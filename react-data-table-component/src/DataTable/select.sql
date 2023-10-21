select
    description
	, iif(instr(description,"   ")
		, iif(instr(description, "CO ENTRY DESCR:")
			, iif(instr(description," SEC:")
				,substr(description,0,instr(description,”   “))||substr(description,instr(description, "CO ENTRY DESCR:”),instr(description," SEC:”)),substr(description,0,instr(description,”   “))),substr(description,0,instr(description,”   “)),substr(description,0,instr(description,”   “))), description) as "desc"
from
cash;


select description, iif(instr(description,"   "), iif(instr(description, "CO ENTRY DESCR:"), iif(instr(description," SEC:"), substr(description,0,instr(description,”   “)) || substr(description,instr(description, "CO ENTRY DESCR:"),instr(description," SEC:")),substr(description,0,instr(description,”   “))),substr(description,0,instr(description,”   “)),substr(description,0,instr(description,”   “))), description) as "desc"
from
cash;


select description, iif(instr(description,"   "), iif(instr(description, "CO ENTRY DESCR:"), iif(instr(description," SEC:"), substr(description,0,instr(description,"   ")) || substr(description,instr(description, "CO ENTRY DESCR:"),instr(description," SEC:")),substr(description,0,instr(description,"   "))),substr(description,0,instr(description,"   ")),substr(description,0,instr(description,"   "))), description) as "desc" from cash;


select description, iif(instr(description,"   "),iif(instr(description,"CO ENTRY DESCR:"),iif(instr(description," SEC:"),substr(description,0,instr(description,"   "))||" "||substr(description,instr(description,"CO ENTRY DESCR:"),instr(description," SEC:")),substr(description,0,instr(description,"   "))),substr(description,0,instr(description,"   "))),description) as "desc" from cash;


select description, iif(instr(description,"CHECK "),"CHECK",iif(instr(description,"   "),iif(instr(description,"CO ENTRY DESCR:"),iif(instr(description," SEC:"),substr(description,0,instr(description,"   "))||substr(description,instr(description,"CO ENTRY DESCR:"),instr(description," SEC:")-instr(description,"CO ENTRY DESCR:")),substr(description,0,instr(description,"   "))),substr(description,0,instr(description,"   "))),description)) as "desc" from cash;

select description, "<+>"||substr(description,0,instr(description,"   "))||"<+>"||substr(description,instr(description,"CO ENTRY DESCR:"),instr(description," SEC:")-instr(description,"CO ENTRY DESCR:"))||"<+>" from cash;

select substr(description,0,instr(description,"   "))||substr(description,instr(description,"CO ENTRY DESCR:"),instr(description," SEC:")-instr(description,"CO ENTRY DESCR:")) from cash;



select /* description, */ replace(iif(instr(description,"CHECK "),"CHECK",iif(instr(description,"   "),iif(instr(description,"CO ENTRY DESCR:"),iif(instr(description," SEC:"),substr(description,0,instr(description,"   "))||substr(description,instr(description,"CO ENTRY DESCR:"),instr(description," SEC:")-instr(description,"CO ENTRY DESCR:")),substr(description,0,instr(description,"   "))),substr(description,0,instr(description,"   "))),description)),"""""""","") as "desc" from cash;

drop table cash;
create table if not exists
cash (
    "acct" text null /* 1 */
    ,"detail" text null /* 2 */
    ,"post_dt" text null /* 3 */
    ,"description" text null /* 4 */
    ,"amount" real null /* 5 */
    ,"type" text null /* 6 */
    ,"balance" text null /* 7 */
    ,"form_nbr" text null /* 8 */
    ,"desc" text as (replace(replace(iif(instr(description,"CHECK "),"CHECK",iif(instr(description,"   "),iif(instr(description,"CO ENTRY DESCR:"),iif(instr(description," SEC:"),substr(description,0,instr(description,"   "))||substr(description,instr(description,"CO ENTRY DESCR:"),instr(description," SEC:")-instr(description,"CO ENTRY DESCR:")),substr(description,0,instr(description,"   "))),substr(description,0,instr(description,"   "))),description)),"""""""",""),'"','')) stored null /* 9 */
);

sed 's/^/CHECKING,/' Chase1199_Activity_20231015.CSV > acct2.csv && sed 's/^/SAVINGS,/' Chase9985_Activity_20231015.CSV >> acct2.csv
get data from csv file in excel and save-as tab delim txt file

.mode csv
.import acct2.csv acct
.import acct2.txt acct
insert into cash select * from acct;


-- debugging
grep -E -o -n '\t' acct2.txt | cut -d: -f1 | uniq -c

select
acct
,detail
,post_dt
,amount
,type
,balance
,desc
from cash;
    "acct" text null /* 1 */
    ,"detail" text null /* 2 */
    ,"post_dt" datetime null /* 3 */
    ,"description" text null /* 4 */
    ,"amount" real null /* 5 */
    ,"type" text null /* 6 */
    ,"balance" text null /* 7 */
    ,"form_nbr" text null /* 8 */
    ,"desc" text as (replace(replace(iif(instr(description,"CHECK "),"CHECK",iif(instr(description,"   "),iif(instr(description,"CO ENTRY DESCR:"),iif(instr(description," SEC:"),substr(description,0,instr(description,"   "))||substr(description,instr(description,"CO ENTRY DESCR:"),instr(description," SEC:")-instr(description,"CO ENTRY DESCR:")),substr(description,0,instr(description,"   "))),substr(description,0,instr(description,"   "))),description)),"""""""",""),'"','')) stored null /* 9 */
);


.headers off
.mode ascii
.sep \t \n
.import --skip 1 accounts.txt cash;

sqlite> .show
        echo: off
         eqp: off
     explain: auto
     headers: off
        mode: ascii
   nullvalue: ""
      output: stdout
colseparator: "\037"
rowseparator: "\036"
       stats: off
       width: 
    filename: jclub.db



select description, "desc" text as (replace(replace(iif(instr(description,"CHECK "),"CHECK",iif(instr(description,"   "),iif(instr(description,"CO ENTRY DESCR:"),iif(instr(description," SEC:"),substr(description,0,instr(description,"   "))||substr(description,instr(description,"CO ENTRY DESCR:"),instr(description," SEC:")-instr(description,"CO ENTRY DESCR:")),substr(description,0,instr(description,"   "))),substr(description,0,instr(description,"   "))),description)),"""""""",""),'"',''))


sqlite> create table acct(account text, type text, postdt text, description text, amount text, event text, balance text, chkslp_nbr text);
sqlite> .import acct2.txt acct
sqlite> .sch acct
CREATE TABLE acct(account text, type text, postdt text, description text, amount text, event text, balance text, chkslp_nbr text);

create table if not exists acct(
    "desc" text as (replace(replace(iif(instr(description,"CHECK "),"CHECK",iif(instr(description,"   "),iif(instr(description,"CO ENTRY DESCR:"),iif(instr(description," SEC:"),substr(description,0,instr(description,"   "))||substr(description,instr(description,"CO ENTRY DESCR:"),instr(description," SEC:")-instr(description,"CO ENTRY DESCR:")),substr(description,0,instr(description,"   "))),substr(description,0,instr(description,"   "))),description)),"""""""",""),'"','')) virtual
    ,account text null, type text null, postdt text null, description text null, amount text null, event text null, balance text null, chkslp_nbr text null
);

create table if not exists acct(
        account text null, type text null, postdt text null, description text null, amount text null, event text null, balance text null, chkslp_nbr text null
);

drop table cash;
create table cash as select
replace(replace(iif(instr(description,"CHECK "),"CHECK",iif(instr(description,"   "),iif(instr(description,"CO ENTRY DESCR:"),iif(instr(description," SEC:"),substr(description,0,instr(description,"   "))||substr(description,instr(description,"CO ENTRY DESCR:"),instr(description," SEC:")-instr(description,"CO ENTRY DESCR:")),substr(description,0,instr(description,"   "))),substr(description,0,instr(description,"   "))),description)),"""""""",""),'"','') as "dsc"
,account
,type
,postdt
,description
,amount
,event
,balance
,chkslp_nbr
from
acct;


select account,type,event,dsc,postdt, count(*) from cash group by 1,2,3,4,5;

select type, 


sqlite> select printf('%02d',substr(postdt,0,instr(postdt,'/'))) from cash;

select instr(postdt,'/') from cash;



sed remove header row from each csv file
sed add source column to each csv file
cat the csv files into single csv file
get data in excel 
convert date to 'YYYY-MM-DD'
add dt field as date(date) with format YYYYMMDD
add key names field to include intuit lines, costco, etc
save as tsv text file
drop and create import table

.headers off .mode ascii .sep \t \n 
.import exceltsv.txt importtable
drop and create cash table as select from importable


sqlite> select * from cash where postdt between '2023-09-01' and '2023-10-01' order by postdt;



drop table pl;
create table if not exists
pl (
    "type" text null /* 1 */
    ,"class" text null /* 2 */
    ,"dt" text null /* 3 */
    ,"date" text null /* 4 */
    ,"transaction" real null /* 5 */
    ,"id" text null /* 6 */
    ,"name" text null /* 7 */
    ,"memodesc" text null /* 8 */
    ,"split" text null /* 9 */
    ,"amt" text null /* 10 */
    ,"bal" text null /* 11 */
);
delete quotes and header, strip leading/trailing space from all fields
.import PL20222023.txt pl



select substr(dt,0,5)||'-'||substr(dt,5,2)||'-'||substr(dt,7,2) from pl;

select
substr(dt,0,5) as 'yr'
,substr(dt,5,2) as 'mo'
,substr(dt,7,5) as 'dy'

select


=IF(ISERR(SEARCH("CHECK ",D6)),D6,"CHECK")

=IF(ISERR(SEARCH("ORIG CO NAME:",D6)),D6,"CHECK")
"ORIG CO NAME:INTUIT 30045475        ORIG ID:9215986202 DESC DATE:231012 CO ENTRY DESCR:TRAN FEE  SEC:CCD    TRACE#:021000027940468 EED:231012   IND ID:524771999470493              IND NAME:JESTER CLUB INC TRN: 2857940468TC"
replace(replace(iif(instr(description,"CHECK "),"CHECK",iif(instr(description,"   "),iif(instr(description,"CO ENTRY DESCR:"),iif(instr(description," SEC:"),substr(description,0,instr(description,"   "))||substr(description,instr(description,"CO ENTRY DESCR:"),instr(description," SEC:")-instr(description,"CO ENTRY DESCR:")),substr(description,0,instr(description,"   "))),substr(description,0,instr(description,"   "))),description)),"""""""",""),'"','') as "dsc"

/Users/dad/Library/CloudStorage/OneDrive-Personal