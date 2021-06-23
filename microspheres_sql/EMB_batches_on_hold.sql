-- Returns acive batches in Microspheres currently on hold.

select distinct tcs.CONTAINERNAME, tcs.MATERIALDESC, tcs.HOLDSTATUS
from MESMonthly_MAP.MES.tblContainerStatus as tcs
where tcs.WORKFLOW in (
	'92203290', -- WF Dye Activation
	'92204942', -- WF Dye Release Testing
	'92134454', -- WF 40s Part Conversion
	'92105667', -- PzF Stock Solution
	'92088490', -- WF Microspheres Master Batch Beads
	'92383343', -- WF Microspheres Master Batch Beads
	'92041683', -- WF Embozene Sieved Beads Standard
	'92041686', -- WF Embozene Sieved Beads Membrane
	'92041689'  -- WF Embozene Dried Beads
	)
	and tcs.HOLDSTATUS = 'OnHold'