# Exile-Vehicle-Crash-Loot
Arma 3 Exile Mod AddOn - Loot your crashed vehicle


Installation

1. Unpack your mission pbo file

2. Copy/Merge the "Custom" folder to your mission folder

3. Copy/Merge code from config.cpp file to your config file

4. Edit config.cpp again and add:
   // Loot destroyed vehicle
	 class Loot: ExileAbstractAction
         {
             title = "Loot Vehicle";
             condition = "(!(alive (ExileClientInteractionObject)))";
             action = "_this spawn ExileClient_object_container_pack";
         }; 
         
   to each vehicle class you wanna make lootable (class Car, class Air, and class Boat).
   -------
   Example: 
              class Car 
	          {
		           targetType = 2;
		           target = "Car";

		           class Actions 
		           {
			            class ScanLock: ExileAbstractAction
			            {
				             title = "Scan Lock";
				             condition = "('Exile_Item_ThermalScannerPro' in (magazines player)) && !ExilePlayerInSafezone && ((locked ExileClientInteractionObject) != 1)";
				             action = "_this call ExileClient_object_lock_scan";
			            };

			            // Locks a vehicle
			            class Lock: ExileAbstractAction
			            {
				             title = "Lock";
				             condition = "((locked ExileClientInteractionObject) isEqualTo 0) && ((locked ExileClientInteractionObject) != 1)";
				             action = "true spawn ExileClient_object_lock_toggle";
			            };

			            // Unlocks a vehicle
			            class Unlock: ExileAbstractAction
			            {
				             title = "Unlock";
				             condition = "((locked ExileClientInteractionObject) isEqualTo 2) && ((locked ExileClientInteractionObject) != 1)";
				             action = "false spawn ExileClient_object_lock_toggle";
			            };
			      	
                  // Repairs a vehicle to 100%. Requires Duckttape
			            class Repair: ExileAbstractAction
			            {
                     title = "Repair";
				             condition = "true";
				             action = "['RepairVehicle', _this select 0] call ExileClient_action_execute";
			            };

			            // Hot-wires a vehicle
			            class Hotwire: ExileAbstractAction
			            {
				             title = "Hotwire";
				             condition = "((locked ExileClientInteractionObject) isEqualTo 2) && ((locked ExileClientInteractionObject) != 1)";
				             action = "['HotwireVehicle', _this select 0] call ExileClient_action_execute";
			            };

			            // Loot destroyed vehicle
			            class Loot: ExileAbstractAction
                  {
                     title = "Loot Vehicle";
                     condition = "(!(alive (ExileClientInteractionObject)))";
                     action = "_this spawn ExileClient_object_container_pack";
                  };
              };
          };

   -------
