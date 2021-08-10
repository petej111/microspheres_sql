-- Returns mbr->est->sieving router mapping given product size and type.

select distinct
	replace(tcs.MATERIALDESC, 'ESTERFIED PMABA BEADS ', '') as 'Batch Description',
	mbr_tci.CONTAINERNAME as 'MBR Router', 
	concat(convert(varchar(30), mbr_tci.ISSUEDPRODBATCH), '-001') as 'Esterified Router', 
	concat(convert(varchar(30), est_tci.ISSUEDPRODBATCH), '-001') as 'Dry Sieving Router'
from MESMonthly_MAP.MES.tblComponentIssue as mbr_tci, MESMonthly_MAP.MES.tblComponentIssue as est_tci
	inner join MESMonthly_MAP.MES.tblContainerStatus as tcs
	on (est_tci.CONTAINERNAME = tcs.CONTAINERNAME)
where mbr_tci.WORKSTATIONNAME = 'FLUID BED COATING-WS-PCM' 
	and mbr_tci.ISSUEDPRODDESC like 'ESTERFIED PMABA BEADS%'
	and est_tci.CONTAINERNAME like concat(mbr_tci.ISSUEDPRODBATCH, '%')
	and est_tci.ISSUEDPRODDESC like 'SIEVED PMMA BEADS%'
	and mbr_tci.CONTAINERNAME in (select distinct CONTAINERNAME
								  from MESMonthly_MAP.MES.tblComponentIssue
								  where WORKSTATIONNAME = 'FLUID BED COATING-WS-PCM'
								  )
order by 'MBR Router' asc