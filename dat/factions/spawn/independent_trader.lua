include("dat/factions/spawn/common.lua")


-- @brief Spawns a small patrol fleet.
function spawn_patrol ()
  local pilots = {}
  local r = rnd.rnd()

  if r < 0.5 then
    scom.addPilot( pilots, "Independent Trader Endeavour", 10 );
 elseif r < 0.8 then
   scom.addPilot( pilots, "Independent Trader Endeavour", 10 );
   scom.addPilot( pilots, "Independent Trader Scarab", 10 );
 else
   scom.addPilot( pilots, "Independent Trader Endeavour", 10 );
   scom.addPilot( pilots, "Independent Trader Scarab", 10 );
   scom.addPilot( pilots, "Independent Trader Fish Bone", 20 );
 end

 return pilots
end


-- @brief Spawns a medium sized squadron.
function spawn_squad ()
  local pilots = {}
  local r = rnd.rnd()

  if r < 0.5 then
   scom.addPilot( pilots, "Independent Trader Endeavour", 10 );
   scom.addPilot( pilots, "Independent Trader Scarab", 10 );
   scom.addPilot( pilots, "Independent Trader Scarab", 10 );
   scom.addPilot( pilots, "Independent Trader Fish Bone", 20 );
 elseif r < 0.8 then
   scom.addPilot( pilots, "Independent Trader Scarab", 10 );
   scom.addPilot( pilots, "Independent Trader Fish Bone", 20 );
   scom.addPilot( pilots, "Independent Trader Voyager Cargo", 30 );
   scom.addPilot( pilots, "Independent Trader Hauler", 40 );
   scom.addPilot( pilots, "Independent Trader Scarab", 10 );
 else
   scom.addPilot( pilots, "Independent Trader Fish Bone", 20 );
   scom.addPilot( pilots, "Independent Trader Voyager Cargo", 30 );
   scom.addPilot( pilots, "Independent Trader Hauler", 50 );
   scom.addPilot( pilots, "Independent Trader Whale", 80 );
   scom.addPilot( pilots, "Independent Trader Rhino", 120 );

 end

 return pilots
end


-- @brief Creation hook.
function create ( max )
  local weights = {}

    -- Create weights for spawn table
    weights[ spawn_patrol  ] = 100
    weights[ spawn_squad   ] = math.max(1, -100 + 1.00 * max)

    -- Create spawn table base on weights
    spawn_table = scom.createSpawnTable( weights )

    -- Calculate spawn data
    spawn_data = scom.choose( spawn_table )

    return scom.calcNextSpawn( 0, scom.presence(spawn_data), max )
  end


-- @brief Spawning hook
function spawn ( presence, max )
  local pilots

    -- Over limit
    if presence > max then
     return 5
   end

    -- Actually spawn the pilots
    pilots = scom.spawn( spawn_data )

    -- Calculate spawn data
    spawn_data = scom.choose( spawn_table )

    return scom.calcNextSpawn( presence, scom.presence(spawn_data), max ), pilots
  end