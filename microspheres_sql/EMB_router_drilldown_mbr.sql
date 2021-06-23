-- Returns mbr->est->sieving router mapping given product size and type.

declare @product_size as varchar(30)
declare @product_type as varchar(30)

set @product_size = '40'
set @product_type = '(OTCA)'

select distinct 
	replace(convert(varchar(30), mbr_tci.CONTAINERNAME), '-001', '') as 'MBR Router', 
	mbr_tci.ISSUEDPRODBATCH as 'Esterified Router', 
	est_tci.ISSUEDPRODBATCH as 'Sieving Router'
from MESMonthly_MAP.MES.tblComponentIssue mbr_tci, MESMonthly_MAP.MES.tblComponentIssue est_tci
where mbr_tci.WORKSTATIONNAME = 'FLUID BED COATING-WS-PCM' 
	and mbr_tci.ISSUEDPRODDESC like 'ESTERFIED PMABA BEADS%'+ @product_size + '%' + @product_type
	and est_tci.CONTAINERNAME like CONCAT (mbr_tci.ISSUEDPRODBATCH, '%')
	and est_tci.ISSUEDPRODDESC like 'SIEVED PMMA BEADS%'+ @product_size + '%' + @product_type
	and mbr_tci.CONTAINERNAME in (select distinct CONTAINERNAME
						from MESMonthly_MAP.MES.tblComponentIssue
						where WORKSTATIONNAME = 'FLUID BED COATING-WS-PCM'
						)
order by 'MBR Router' asc