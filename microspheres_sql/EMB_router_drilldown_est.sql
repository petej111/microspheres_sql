-- Returns the est->sieving router mapping given product size and type.

declare @product_size as varchar(30)
declare @product_type as varchar(30)

set @product_size = '700'
set @product_type = '(CA)'

select distinct 
	replace(convert(varchar(30), tci.CONTAINERNAME), '-001', '') as 'Esterified Router',
	tci.ISSUEDPRODBATCH as 'Sieving Router' 
from MESMonthly_MAP.MES.tblComponentIssue as tci
where tci.WORKSTATIONNAME = 'HYDROLYSIS-WS-EMB' 
	and tci.ISSUEDPRODDESC like 'SIEVED PMMA BEADS ' + @product_size + ' %' + @product_type
order by 'Esterified Router' asc