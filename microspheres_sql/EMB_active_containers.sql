-- Returns table of active batches in Microspheres.

select 	tcs.MATERIALDESC,
		tcs.BATCH,
		tcs.MATERIALNAME,
		tcs.RELEASEDATE,
		tcs.LASTACTIVITYDATE,
		tcs.STARTQTY,
		tcs.CURRENTQTY,
		tcs.HOLDSTATUS,
		tcs.EXPIRATIONDATE,
		tcs.FINISHDATE,
		tcs.CONTAINERSTATUS
from MESMonthly_MAP.MES.tblContainerStatus as tcs
where WORKFLOW in (
	'92203290', -- WF Dye Activation
	'92204942', -- WF Dye Release Testing
	'92134454', -- WF 40s Part Conversion
	'92105667', -- PzF Stock Solution
	'92088490', -- WF Microspheres Master Batch Beads
	'92383343', -- WF Microspheres Master Batch Beads
	'92041683', -- WF Embozene Sieved Beads Standard
	'92041686', -- WF Wmbozene Sieved Beads Membrane
	'92041689'  -- WF Embozene Dried Beads
	)
	and CONTAINERSTATUS = 'Active'
order by MATERIALDESC desc
