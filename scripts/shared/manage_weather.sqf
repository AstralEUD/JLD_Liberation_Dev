//shared weather
waitUntil { !isNil "chosen_weather" };
waitUntil { !isNil "chosen_fog" };

10 setOvercast chosen_weather;
10 setWaves (0.66*chosen_rain+0.8*chosen_weather);
if(isServer)then{
	10 setRain chosen_rain;
	10 setFog [chosen_fog#0,chosen_fog#1,chosen_fog#2];
	forceWeatherChange;
};

while { true } do {
	(2000 * timeMultiplier) setOvercast chosen_weather;
	(2000 * timeMultiplier) setWaves (0.66*chosen_rain+0.8*chosen_weather);
	if(isServer)then{
		5 setRain chosen_rain;
		(2000 * timeMultiplier) setFog [chosen_fog#0,chosen_fog#1,chosen_fog#2];
	};
	/*
	if ( overcast < 0.75 ) then { 2 setRain 0 };
	if ( overcast >= 0.75 && overcast < 0.95 ) then { 2 setRain 0.1 };
	if ( overcast >= 0.95 ) then { 2 setRain 0.2 }; // Removed heavy rain due to severe fps issues*/
	sleep 10;
	//systemChat "shd weather";
};