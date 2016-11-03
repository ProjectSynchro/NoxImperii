include("dat/factions/spawn/common.lua")

declare_fleet("Imperial Traders Endeavour",10,{presence={nil,nil,50,nil}})
declare_fleet("Imperial Traders Schroedinger",10,{})
declare_fleet("Imperial Traders Fish Bone",10,{presence={nil,nil,100,nil}})
declare_fleet("Imperial Traders Quicksilver",5,{presence={nil,50,nil,nil}})
declare_fleet("Imperial Traders Zheng He",5,{presence={nil,50,nil,nil}})
declare_fleet("Imperial Traders Argosy",10,{enemies={nil,20,nil,nil}})
declare_fleet("Imperial Traders Sunflower",5,{presence={nil,50,nil,nil},enemies={nil,nil,10,20}})

declare_fleet(function() return spawn_variableFleet({"Imperial Traders Fish Bone",2,5}) end,10,{enemies={nil,nil,10,20}})
declare_fleet(function() return spawn_variableFleet({"Imperial Traders Zheng He",2,4}) end,10,{enemies={nil,nil,10,20}})
declare_fleet(function() return spawn_variableFleet({"Imperial Traders Zheng He",1,2},{"Imperial Traders Fish Bone",1,2}) end,10,{enemies={nil,nil,10,20}})
declare_fleet(function() return spawn_variableFleet({"Imperial Traders Argosy",1,3}) end,10,{enemies={nil,20,nil,nil}})

declare_fleet(function() return spawn_variableFleet({"Imperial Traders Sunflower",2,4}) end,10,{enemies={nil,nil,10,20},presence={50,200,nil,nil}})
declare_fleet(function() return spawn_variableFleet({"Imperial Traders Sunflower",1,2},{"Imperial Traders Zheng He",1,2}) end,10,{enemies={nil,nil,10,20},presence={50,200,nil,nil}})

declare_fleet(function() return spawn_variableFleet({"Imperial Traders Sunflower",1,2},{"Imperial Traders Zheng He",1,2}) end,10,{enemies={nil,nil,10,20},presence={200,500,nil,nil}})