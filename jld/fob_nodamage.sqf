_nodamage = []; 
{_nodamage pushBack (_x select 0);}forEach buildings;

waitUntil{!isNil "GRLIB_all_fobs"};

while{true}do{
	{ 
		_pos = _x; 
		{ 
			if(typeOf _x in _nodamage)then{_x allowDamage false;}; 
		}forEach (_pos nearObjects ["All",125]); 
	}forEach GRLIB_all_fobs; 
	sleep 10;
};
