-- Returns   

select tbl.TXNDATE, tbl.MATERIALNAME, tbl.SCRAPQTY, tbl.SCRAPREASONDESC
from MESMonthly_MAP.MES.tblScraps tbl
where tbl.WORKSTATIONNAME = 'MASTER BATCH RELEASE-WS-PCM' 
	and tbl.TXNDATE >= '2019-01-01' 
	and tbl.TXNDATE <= '2020-12-31'