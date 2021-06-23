use MESMonthly_MAP

-- query 

select TXNDATE, CONTAINERNAME, TASKLISTNAME, TASKLISTDESC, ISSUEDPROD, ISSUEDPRODDESC, ISSUEDPRODBATCH,
	   KANBANCONTAINERNAME, QTYISSUED
from MESMonthly_MAP.MES.tblComponentIssue as tci
where tci.TASKLISTNAME in ('92041698', -- Hydrolysis
						   '92240373', -- Dry Sieving
						   '92240371', -- PMMA Polymerization Standard
						   '92240367', -- MMA Distillation
						   '92240370', -- PBS Solution Preparation
						   '92240369'  -- PVA Solution Preparation
						   )
	and tci.CONTAINERNAME in ('26505478-001', -- 700 CA; ds router
							  '27010679-001', -- 700 CA; ds router
							  '26851735-001', -- 500 CA; ds router
							  '26476068-001', -- 250 CA; ds router
							  '26730973-001', -- 700 CA; est router
							  '26932424-001', -- 700 CA; est router
							  '27084249-001', -- 500 CA; est router
							  '27256864-001'  -- 250 CA; est router
);