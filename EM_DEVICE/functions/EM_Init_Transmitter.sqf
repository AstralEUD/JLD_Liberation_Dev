{
	if ("EM_Marker" in _x)	then {
		_x setMarkerAlpha 0;
		_markerText = ((markerText _x) splitString "\");
		_markerName = _markerText#0;
		_markerFreq = parseNumber(_markerText#1);
		_markerPower = parseNumber(_markerText#2);
		_towers = nearestTerrainObjects[getMarkerPos _x, ["TRANSMITTER"], 50];
		if (count _towers > 0) then {
			_tower = _towers #0;
			_towerLoc  = unitAimPositionVisual _tower;
			_location = createLocation [ "ViewPoint" , AGLToASL unitAimPositionVisual _tower, 5000, 5000];
			_location setText _markerName;		
			_location setVariable ["EM_Values", [_markerFreq, _markerPower]];
		EM_Radios pushBack [_location,_tower];
		} else {
			systemChat format["[%1]마커 주변에는 통신탑이 없습니다.", _x];
		};
	};
}forEach allMapMarkers;
