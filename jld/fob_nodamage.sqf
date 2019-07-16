_nodamage = []; 
{_nodamage pushBack (_x select 0);}forEach buildings;

waitUntil{!isNil "GRLIB_all_fobs"};

while{true}do{
	{ 
		{if((typeOf _x in _nodamage) && (isDamageAllowed _x))then{_x allowDamage false};}forEach (_x nearObjects ["All",GRLIB_fob_range]); 
		{deleteVehicle _x} forEach nearestObjects [_x, ["WeaponHolder","GroundWeaponHolder"], GRLIB_fob_range];		
	}forEach GRLIB_all_fobs; 
	sleep 30;
};
