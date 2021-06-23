-- Query returns table of materials issued for all batches through polymerization
-- for a given time interval.

select distinct tbl_comp_issue.TXNDATE, tbl_task_comps.MATERIALDESC, tbl_comp_issue.CONTAINERNAME,
	tbl_comp_issue.ISSUEDPROD, tbl_comp_issue.ISSUEDPRODBATCH, tbl_comp_issue.ISSUEDPRODDESC,
	tbl_comp_issue.KANBANCONTAINERNAME
from MESMonthly_MAP.MES.tblComponentIssue tbl_comp_issue

inner join MESMonthly_MAP.MES.tblTaskCompletions tbl_task_comps on tbl_comp_issue.CONTAINERNAME = tbl_task_comps.CONTAINERNAME

where tbl_comp_issue.WORKSTATIONNAME = 'PMMA POLYMER MEMBRANE-WS-ESB' 
	or tbl_comp_issue.WORKSTATIONNAME = 'PMMA POLYMER STANDARD-WS-ESB'
	and tbl_comp_issue.TXNDATE >= '2020-03-11'
	and tbl_comp_issue.TXNDATE <= '2021-02-11'

order by tbl_comp_issue.TXNDATE desc

--select *
--from MESMonthly_MAP.MES.tblTaskCompletions t_task_comps
--where t_task_comps.WORKSTATIONNAME = 'PMMA POLYMER MEMBRANE-WS-ESB' 
--	or t_task_comps.WORKSTATIONNAME = 'PMMA POLYMER STANDARD-WS-ESB'
--	and t_task_comps.TXNDATE >= '2020-03-11'
--	and t_task_comps.TXNDATE <= '2021-02-11'