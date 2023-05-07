AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include('shared.lua')

function ENT:Initialize()
	self:SetModel("models/naruto modelpack/models/nuns4 - traps/trap iii/trap iii.mdl") 
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

util.AddNetworkString( "APPRAITON" ) 

function ENT:AcceptInput( name, activator, caller )
  if name == "Use" and caller:IsPlayer() then 
    net.Start("APPRAITON") 
    net.Send(caller) 
  end
end