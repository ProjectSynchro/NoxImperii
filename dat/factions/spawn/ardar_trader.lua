include("dat/factions/spawn/common.lua")

declare_fleet("Ardar Traders Endeavour",10,{presence={nil,nil,50,nil}})
declare_fleet("Ardar Traders Fish Bone",10,{presence={nil,nil,50,nil}})

-- medium trade:
declare_fleet("Ardar Traders Meryoch",10)
-- bulk trade:
declare_fleet("Ardar Traders Rioloch",10,{presence={nil,50,400,nil},enemies={nil,nil,10,20}})
-- armed trade:
declare_fleet("Ardar Traders Geldoch",10,{enemies={10,20,nil,nil}})

declare_fleet(function() return spawn_variableFleet({"Ardar Traders Fish Bone",2,4}) end,10,{presence={nil,50,400,nil}})
declare_fleet(function() return spawn_variableFleet({"Ardar Traders Meryoch",2,3}) end,10,{presence={nil,100,800,nil}})

declare_fleet(function() return spawn_variableFleet({"Ardar Traders Geldoch",2,4}) end,10,{presence={nil,50,400,nil},enemies={10,20,nil,nil}})

declare_fleet(function() return spawn_variableFleet({"Ardar Traders Meryoch",3,6}) end,10,{presence={nil,300,600,nil}})
declare_fleet(function() return spawn_variableFleet({"Ardar Traders Rioloch",3,6}) end,10,{presence={nil,500,1000,nil},enemies={nil,nil,10,20}})