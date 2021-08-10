-- queries container information for specified container name   

use MESMonthly_MAP

select distinct ttc.CONTAINERNAME, ttc.MATERIALDESC
from MESMonthly_MAP.MES.tblTaskCompletions as ttc
where ttc.CONTAINERNAME in ('25982719-001',
							'26328432-001',
							'26371536-001',
							'26476068-001',
							'26505478-001',
							'26586129-001',
							'26613680-001',
							'26732779-001',
							'26772011-001',
							'26810373-001',
							'26851735-001',
							'26931815-001',
							'26970988-001',
							'27010662-001',
							'27010663-001',
							'27010665-001',
							'27010676-001',
							'27010679-001'
							)