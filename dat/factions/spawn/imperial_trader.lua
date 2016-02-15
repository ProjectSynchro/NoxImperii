include("dat/factions/spawn/common.lua")


-- @brief Spawns a small trade fleet.
function spawn_patrol ()
    local pilots = {}
    local r = rnd.rnd()

    if r < 0.5 then
       scom.addPilot( pilots, "Imperial Trader Schroedinger", 20 );
    elseif r < 0.8 then
       scom.addPilot( pilots, "Imperial Trader Schroedinger", 20 );
       scom.addPilot( pilots, "Imperial Trader Fish Bone", 40 );
    else
       scom.addPilot( pilots, "Imperial Trader Quicksilver", 20 );
       scom.addPilot( pilots, "Imperial Trader Fish Bone", 40 );
    end

    return pilots
end


-- @brief Spawns a larger trade fleet.
function spawn_squad ()
    local pilots = {}
    local r = rnd.rnd()

    if r < 0.5 then
       scom.addPilot( pilots, "Imperial Trader Quicksilver", 20 );
       scom.addPilot( pilots, "Imperial Trader Schroedinger", 20 );
       scom.addPilot( pilots, "Imperial Trader Fish Bone", 40 );
    elseif r < 0.8 then
       scom.addPilot( pilots, "Imperial Trader Schroedinger", 20 );
       scom.addPilot( pilots, "Imperial Trader Fish Bone", 20 );
       scom.addPilot( pilots, "Imperial Trader Fish Bone", 20 );
       scom.addPilot( pilots, "Imperial Trader Zheng He", 100 );
    else
       scom.addPilot( pilots, "Imperial Trader Fish Bone", 20 );
       scom.addPilot( pilots, "Imperial Trader Argosy", 100 );
       scom.addPilot( pilots, "Imperial Trader Fish Bone", 20 );
       scom.addPilot( pilots, "Imperial Trader Sunflower", 100 );
       scom.addPilot( pilots, "Imperial Trader Zheng He", 100 );
    end

    return pilots
end


-- @brief Creation hook.
function create ( max )
    local weights = {}

    -- Create weights for spawn table
    weights[ spawn_patrol  ] = 100
    weights[ spawn_squad   ] = math.max(1, -80 + 0.80 * max) 
   
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
