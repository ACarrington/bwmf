// F3 - Buddy Team Colours
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
// MAKE SURE THE PLAYER INITIALIZES PROPERLY
if (!isDedicated && (isNull player)) then
{
	waitUntil {sleep 0.1; !isNull player};
};
// ====================================================================================
// DECLARE PRIVATE VARIABLES
private ["_unit","_isFireteam","_white","_red","_blue","_yellow","_green"];
// ====================================================================================

// SET CUSTOM VARIABLES
// These variables govern the behaviour of the script

// Colors will be set for groups of leaders with these suffixes
_leaders = ["_FTL"];

// ====================================================================================

sleep 10;	// WAIT UNTIL 10 SECONDS AFTER INITIALIZING

_unit = player;
_isFireteam = false;
// ====================================================================================
// CHECK GROUP SIZE
// If the group isn't a full fireteam, leave teams as default.
{
	if ([_x, format["%1",(leader (group _unit))]] call BIS_fnc_inString) exitWith {_isFireteam = true;}
} forEach _leaders;

if(!_isFireteam) exitWith {};

// Set suffixes for each color
_white = ["_FTL","_AT"];
_red = [];
_blue = [];
_yellow = [];
_green = [];

//Pabst: set ft color based on ftl number

{
	if ([_x, (vehicleVarName _unit)] call BIS_fnc_inString) exitWith {
		_red = ["_AR","_AAR"];
	};
} forEach ["_A1_", "_B1_", "_C1_"];

{
	if ([_x, (vehicleVarName _unit)] call BIS_fnc_inString) exitWith {
		_blue = ["_AR","_AAR"];
	};
} forEach ["_A2_", "_B2_", "_C2_"];

{
	if ([_x, (vehicleVarName _unit)] call BIS_fnc_inString) exitWith {
		_green = ["_AR","_AAR"];
	};
} forEach ["_A3_", "_B3_", "_C3_"];

// SET TEAM COLOURS
{
	private ["_unit"];
	_unit = _x;

	{
		if ([_x, format ["%1",_unit]] call BIS_fnc_inString) then {
			_unit assignTeam "RED";
		};
	} forEach _red;

	{
		if ([_x, format ["%1",_unit]] call BIS_fnc_inString) then {
			_unit assignTeam "blue";
		};
	} forEach _blue;

	{
		if ([_x, format ["%1",_unit]] call BIS_fnc_inString) then {
			_unit assignTeam "yellow";
		};
	} forEach _yellow;

	{
		if ([_x, format ["%1",_unit]] call BIS_fnc_inString) then {
			_unit assignTeam "green";
		};
	} forEach _green;

	{
		if ([_x, format ["%1",_unit]] call BIS_fnc_inString) then {
			_unit assignTeam "white";
		};
	} forEach _white;

} foreach units (group _unit);