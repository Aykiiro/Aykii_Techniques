include("shared.lua")

surface.CreateFont("NPCFont2", {
    font = "Roboto",
    size = 20,
    weight = 1000,
    antialias = true
})

surface.CreateFont("NPCFont", {
    font = "Coolvetica",
    size = 50,
    weight = 1000,
    antialias = true
})


function ENT:Draw()
    self:DrawModel()
    local eye = LocalPlayer():EyeAngles()
    local Pos = self:LocalToWorld(self:OBBCenter()) + Vector(0, 0, 10)
    local Ang = Angle(0, eye.y - 90, 90)
    local clr = HSVToColor(((CurTime() * 10) % 360), 0.5, 0.5)
    if self:GetPos():Distance(LocalPlayer():GetPos()) > 190 then return end
    cam.Start3D2D(Pos + Vector(0, 0, math.sin(CurTime()) * 2), Ang, 0.2)
    draw.SimpleTextOutlined("Techniques Suiton", "NPCFont", 0, -20, Color(255, 255, 255), TEXT_ALIGN_CENTER, 0, 1.5, Color(0, 0, 0, 255))
    draw.SimpleTextOutlined("Apprentissage", "NPCFont2", 0, 25, Color(clr.r, clr.g, clr.b, 220), TEXT_ALIGN_CENTER, 0, 1, Color(0, 0, 0, 255))
    surface.SetDrawColor(255, 255, 255)
    surface.SetMaterial(Material("icon16/color_wheel.png"))
    surface.DrawTexturedRect(-10, -60, 32, 32)
    cam.End3D2D()
end



local function drawTechniques ()

    local ply = LocalPlayer()

    local frame = vgui.Create("DFrame")
    frame:SetSize(700, 250)
    frame:SetTitle("Techniques Suiton - SL Community")
    frame:Center()
    frame:MakePopup()

    function frame:Paint(w, h)
        draw.RoundedBox(0, 0, 0, w, h, Color(0, 125, 255, 150))
    end

    local button1 = vgui.Create("DButton", frame)
    button1:SetText("C - Pistolet a Eau")
    button1:SetSize(150, 30)
    button1:SetPos(50, 50)
    button1.DoClick = function()
        ply:ConCommand("say /advert *NA* Apprends Pistolet a Eau (10 Minutes)")
        frame:Close()
    end

    local button2 = vgui.Create("DButton", frame)
    button2:SetText("C - Vague de Bulles")
    button2:SetSize(150, 30)
    button2:SetPos(275, 50)
    button2.DoClick = function()
        ply:ConCommand("say /advert *NA* Vague de Bulles (10 Minutes)")
        frame:Close()
    end

    local button3 = vgui.Create("DButton", frame)
    button3:SetText("B - Bombe Aqueuse")
    button3:SetSize(150, 30)
    button3:SetPos(500, 50)
    button3.DoClick = function()
        ply:ConCommand("say /advert *NA* Bombe Aqueuse (25 Minutes)")
        frame:Close()
    end

    local button4 = vgui.Create("DButton", frame)
    button4:SetText("B - Canon Aqueu")
    button4:SetSize(150, 30)
    button4:SetPos(50, 100)
    button4.DoClick = function()
        ply:ConCommand("say /advert *NA* Canon Aqueu (25 Minutes)")
        frame:Close()
    end

    local button5 = vgui.Create("DButton", frame)
    button5:SetText("B - Mur de Suiton")
    button5:SetSize(150, 30)
    button5:SetPos(275, 100)
    button5.DoClick = function()
        ply:ConCommand("say /advert *NA* Mur de Suiton (25 Minutes)")
        frame:Close()
    end

    local button6 = vgui.Create("DButton", frame)
    button6:SetText("B - Pluie Torentielle")
    button6:SetSize(150, 30)
    button6:SetPos(500, 100)
    button6.DoClick = function()
        ply:ConCommand("say /advert *NA* Pluie Torentielle (25 Minutes)")
        frame:Close()
    end

    local button7 = vgui.Create("DButton", frame)
    button7:SetText("A - Vague Aqueuse")
    button7:SetSize(150, 30)
    button7:SetPos(50, 150)
    button7.DoClick = function()
        ply:ConCommand("say /advert *NA* Vague Aqueuse (40 Minutes)")
        frame:Close()
    end

    local button8 = vgui.Create("DButton", frame)
    button8:SetText("A - Prison Aqueuse")
    button8:SetSize(150, 30)
    button8:SetPos(275, 150)
    button8.DoClick = function()
        ply:ConCommand("say /advert *NA* Prison Aqueuse (40 Minutes)")
        frame:Close()
    end

    local button9 = vgui.Create("DButton", frame)
    button9:SetText("Mini Dragon Aqueux")
    button9:SetSize(150, 30)
    button9:SetPos(500, 150)
    button9.DoClick = function()
        ply:ConCommand("say /advert *NA* Vague Aqueuse (40 Minutes)")
        frame:Close()
    end
end

net.Receive( "APPSUITON", function()
    drawTechniques ()
end)