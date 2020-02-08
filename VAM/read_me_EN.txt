Vehicle Appearance Manager (Communication menu version) by UNIT_normal
This allows you to change camouflage and component via communication menu.
VAM currently supports NATO, CSAT, AAF land and air vehicles. (except Quad Bike.)

Known issue
- Some components are linked each other. It's not VAM's limitation.
- Some components aren't compatible each other. It's not VAM's limitation.

Installation
1. Put VAM folder on your mission folder.
2. Put stringtable.xml or copy & paste contents to your stringtable.xml.
3. Add this to init.sqf.
[] execVM "VAM\vam_init.sqf";
4. Add this to description.ext.
#include "VAM\VAM_comm_menu.hpp"

Option
- In vam_init.sqf, you can enable Liberation FOB distance check system.

Changelog
1.0
Released
1.1
Memory leak fixed, Now support Stringtable.xml, Menu will be reopened after applying option.
1.2
"Close menu" added. Cheetah error fixed
1.3
Communication menu is now include by #include. Typo fixed
1.4
Typo fixed
1.5
Aircraft added, reallocate directory, Problem with Marid has been fixed, Component issue with Prowler and Quilin has been fixed
1.55
AAF camouflage has been added to Hummingbird, Pawnee, Orca
1.58
Command menu cancel logic added. (Close menu when player eject by pressing 'V' while using script.) Code run order redefined. Old Marids have been separated.

Special Thanks
DCinside ARMA minor Gallery for testing
DALIX server