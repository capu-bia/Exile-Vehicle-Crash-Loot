/**
 * ExileServer_object_container_packContainer
 *
 * Exile Mod
 * exile.majormittens.co.uk
 * © 2015 Exile Mod Team
 * modified by Peresvet
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_object", "_objectpos", "_objectpos2", "_items", "_magazines", "_weapons", "_containers", "_popTabs", "_typeof", "_groundHolder", "_popTabsObject", "_filter", "_kitMagazine"];
_object = _this;
_objectpos = getPosATL _object;
_objectpos2 = _objectpos vectorAdd [0,0,0.1];
_items = _object call ExileServer_util_getItemCargo;
_magazines = magazinesAmmoCargo _object;
_weapons = weaponsItemsCargo _object;
_containers =_object call ExileServer_util_getObjectContainerCargo;
_popTabs = _object getVariable ["ExileMoney",0];
_typeof = typeOf _object;
deleteVehicle _object;
_object call ExileServer_object_container_database_delete;
_groundHolder = createVehicle ["Box_IND_Wps_F",_objectpos2, [], 0, "CAN_COLLIDE"];

clearWeaponCargoGlobal 		_groundHolder;
clearItemCargoGlobal 		_groundHolder;
clearMagazineCargoGlobal 	_groundHolder;
clearBackpackCargoGlobal 	_groundHolder;

_groundHolder setPosATL _objectpos2;
if (_popTabs > 0 ) then
{
   // _popTabsObject = createVehicle ["Exile_PopTabs", _objectpos2, [], 0, "CAN_COLLIDE"];    
    _groundHolder setVariable ["ExileMoney", _popTabs, true];
};
_filter  = ("getText(_x >> 'staticObject') == _typeof" configClasses(configFile >> "CfgConstruction")) select 0;
_kitMagazine = getText(_filter >> "kitMagazine");
_groundHolder addItemCargoGlobal [_kitMagazine,1];
[_groundHolder,_items] call ExileServer_util_fill_fillItems;
[_groundHolder,_magazines] call ExileServer_util_fill_fillMagazines;
[_groundHolder,_weapons] call ExileServer_util_fill_fillWeapons;
[_groundHolder,_containers] call ExileServer_util_fill_fillContainers;
true
