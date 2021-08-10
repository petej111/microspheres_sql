-- query all batches where a specific kanban was used in a specified tasklist

use MESMonthly_MAP

select *
from MESMonthly_MAP.MES.tblComponentIssue tci
where TASKLISTNAME in ('92240371', -- PMMA Polymerization Standard
					   '92240372'  -- PMMA Polymerization Membrane
					   'DRYING-WS-EMB'
					   )
	and tci.KANBANCONTAINERNAME in ('1EMB-ACD-0011-SCI0007',
									'1EMB-ACD-0014-SCI0007'
									)