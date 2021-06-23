select top 10 *
from MESMonthly_MAP.MES.tblComponentIssue as tci
where tci.WORKSTATIONNAME in ('FLUID BED COATING-WS-PCM')
	and tci.ISSUEDPRODDESC like '%500%'