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
    draw.SimpleTextOutlined("Techniques Raiton", "NPCFont", 0, -20, Color(255, 255, 255), TEXT_ALIGN_CENTER, 0, 1.5, Color(0, 0, 0, 255))
    draw.SimpleTextOutlined("Apprentissage", "NPCFont2", 0, 25, Color(clr.r, clr.g, clr.b, 220), TEXT_ALIGN_CENTER, 0, 1, Color(0, 0, 0, 255))
    surface.SetDrawColor(255, 255, 255)
    surface.SetMaterial(Material("icon16/color_wheel.png"))
    surface.DrawTexturedRect(-10, -60, 32, 32)
    cam.End3D2D()
end



local function drawTechniques ()

    local ply = LocalPlayer()

    local frame = vgui.Create("DFrame")
    frame:SetSize(700, 300)
    frame:SetTitle("Techniques Raiton - SL Community")
    frame:Center()
    frame:MakePopup()

    function frame:Paint(w, h)
        draw.RoundedBox(0, 0, 0, w, h, Color(0, 125, 255, 150))
    end

    local button1 = vgui.Create("DButton", frame)
    button1:SetText("C - Balle Eclair")
    button1:SetSize(150, 30)
    button1:SetPos(50, 50)
    button1.DoClick = function()
        ply:ConCommand("say /advert *NA* Apprends Balle Eclair (10 Minutes)")
        frame:Close()
    end

    local button2 = vgui.Create("DButton", frame)
    button2:SetText("B - Quatres Piliers Electrique")
    button2:SetSize(150, 30)
    button2:SetPos(275, 50)
    button2.DoClick = function()
        ply:ConCommand("say /advert *NA* Quatres Piliers Electrique (25 Minutes)")
        frame:Close()
    end

    local button3 = vgui.Create("DButton", frame)
    button3:SetText("B - Pression Foudroyante")
    button3:SetSize(150, 30)
    button3:SetPos(500, 50)
    button3.DoClick = function()
        ply:ConCommand("say /advert *NA* Pression Foudroyante (25 Minutes)")
        frame:Close()
    end

    local button4 = vgui.Create("DButton", frame)
    button4:SetText("B - Division Condensé")
    button4:SetSize(150, 30)
    button4:SetPos(50, 100)
    button4.DoClick = function()
        ply:ConCommand("say /advert *NA* Division Condensé (25 Minutes)")
        frame:Close()
    end

    local button5 = vgui.Create("DButton", frame)
    button5:SetText("A - Onde Detective")
    button5:SetSize(150, 30)
    button5:SetPos(275, 100)
    button5.DoClick = function()
        ply:ConCommand("say /advert *NA* Onde Detective (40 Minutes)")
        frame:Close()
    end

    local button6 = vgui.Create("DButton", frame)
    button6:SetText("A - Boule de Foudre")
    button6:SetSize(150, 30)
    button6:SetPos(500, 100)
    button6.DoClick = function()
        ply:ConCommand("say /advert *NA* Boule de Foudre (40 Minutes)")
        frame:Close()
    end

    local button7 = vgui.Create("DButton", frame)
    button7:SetText("A - Rayon Eclair")
    button7:SetSize(150, 30)
    button7:SetPos(50, 150)
    button7.DoClick = function()
        ply:ConCommand("say /advert *NA* Rayon Eclair (40 Minutes)")
        frame:Close()
    end

    local button8 = vgui.Create("DButton", frame)
    button8:SetText("A - Explosion Tourbillonante")
    button8:SetSize(150, 30)
    button8:SetPos(275, 150)
    button8.DoClick = function()
        ply:ConCommand("say /advert *NA* Explosion Tourbillonante (40 Minutes)")
        frame:Close()
    end

    local button9 = vgui.Create("DButton", frame)
    button9:SetText("S - Teleportation de la foudre")
    button9:SetSize(150, 30)
    button9:SetPos(500, 150)
    button9.DoClick = function()
        ply:ConCommand("say /advert *NA* Fait son entrainement pour obtenir la technique Teleportation de la Foudre")
        ply:ChatPrint("Vous devez faire un Passif de 3 Jours sur discord ainsi que de mettre ce message sur le serveur chaque jours de votre passif")
        frame:Close()
    end

    local button10 = vgui.Create("DButton", frame)
    button10:SetText("S - Kirin")
    button10:SetSize(150, 30)
    button10:SetPos(50, 200)
    button10.DoClick = function()
       ply:ConCommand("say /advert *NA* Fait son entrainement pour obtenir la technique Kirin")
        ply:ChatPrint("Vous devez faire un Passif de 3 Jours sur discord ainsi que de mettre ce message sur le serveur chaque jours de votre passif")
        frame:Close()
    end

    local button11 = vgui.Create("DButton", frame)
    button11:SetText("S - Mode chakra Raiton")
    button11:SetSize(150, 30)
    button11:SetPos(275, 200)
    button11.DoClick = function()
        ply:ConCommand("say /advert *NA* Fait son entrainement pour obtenir la technique Mode Chakra Raiton")
        ply:ChatPrint("Vous devez faire un Passif de 3 Jours sur discord ainsi que de mettre ce message sur le serveur chaque jours de votre passif")
        frame:Close()
    end
end

net.Receive( "APPRAITON", function()
    drawTechniques ()
end)