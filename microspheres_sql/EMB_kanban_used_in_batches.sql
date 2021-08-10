-- given kanban, pulls all batches where kanban was issued to.

declare @kanban_container_name as varchar(30)

set @kanban_container_name = '1EMB-FDG-0009-SCI0015'

select tci.TXNDATE,
    tcs.MATERIALDESC,
	tcs.CONTAINERNAME,
	tci.TASKLISTDESC,
	tci.KANBANCONTAINERNAME,
	tcs.KANBANNAME,
	tcs.KANBANCURRENTSTATUS,
	tcs.ACTIVEKANBAN,
	tcs.EXPIRATIONDATE,
	tci.QTYISSUED,
	tci.ISSUEDPRODDESC,
	tci.ISSUEDPROD,
	tci.ISSUEDPRODBATCH

from MESMonthly_MAP.MES.tblComponentIssue as tci
	inner join MESMonthly_MAP.MES.tblContainerStatus as tcs
	on tci.CONTAINERNAME = tcs.CONTAINERNAME

where tci.KANBANCONTAINERNAME = @kanban_container_name

order by tci.TXNDATE asc;