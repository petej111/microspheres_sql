-- queries container details

use MESMonthly_MAP

select tcs.CONTAINERNAME,
	   tcs.MATERIALDESC,
	   tcs.BATCH,
	   tcs.RELEASEDATE,
	   tcs.LASTACTIVITYDATE,
	   tcs.STARTQTY,
	   tcs.CURRENTQTY,
	   tcs.EXPIRATIONDATE
from MESMonthly_MAP.MES.tblContainerStatus as tcs
where tcs.CONTAINERNAME in ('1EMB-ACD-0011-SCI0007',
							'1EMB-FDG-0013-SCI0014',
							'1EMB-FDG-0012-SCI0013',
							'1EMB-ACD-0014-SCI0007',
							'1EMB-FDG-0010-SCI0019',
							'1EMB-FDG-0009-SCI0015',
							'1EMB-FDG-0013-SCI0016'
							);

