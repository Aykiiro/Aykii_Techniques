ENT.Base	    			= "base_ai"
ENT.Type	    			= "ai"
ENT.PrintName				= "Techniques Katon"
ENT.Author					= "Aykiiro"
ENT.Category				= "Apprentissage Aykiiro"
ENT.Instructions			= " "
ENT.Spawnable				= true
ENT.AdminSpawnable			= true
ENT.AutomaticFrameAdvance	= true

function ENT:SetAutomaticFrameAdvance(byUsingAnim)
	self.AutomaticFrameAdvance = byUsingAnim
end