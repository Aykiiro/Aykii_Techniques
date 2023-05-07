AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include('shared.lua')

function ENT:Initialize()
	self:SetModel("models/naruto modelpack/models/nuns4 - traps/trap iv/trap iv.mdl") 
	self:SetHullType(HULL_HUMAN) 
	self:SetHullSizeNormal() 
	self:SetNPCState(NPC_STATE_SCRIPT) 
	self:SetSolid(SOLID_BBOX) 
	self:CapabilitiesAdd(CAP_ANIMATEDFACE) 
	self:SetUseType(SIMPLE_USE) 
	self:DropToFloor() 
	self:SetMaxYawSpeed(90) 
end

function ENT:OnTakeDamage()


	return false
end

util.AddNetworkString( "APPKATON" ) 

function ENT:AcceptInput( name, activator, caller )
  if name == "Use" and caller:IsPlayer() then 
    net.Start("APPKATON") 
    net.Send(caller) 
  end
end