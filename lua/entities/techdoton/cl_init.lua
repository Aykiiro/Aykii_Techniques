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
    draw.SimpleTextOutlined("Techniques Doton", "NPCFont", 0, -20, Color(255, 255, 255), TEXT_ALIGN_CENTER, 0, 1.5, Color(0, 0, 0, 255))
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
    frame:SetTitle("Techniques Doton - SL Community")
    frame:Center()
    frame:MakePopup()

    function frame:Paint(w, h)
        draw.RoundedBox(0, 0, 0, w, h, Color(0, 125, 255, 150))
    end

    local button1 = vgui.Create("DButton", frame)
    button1:SetText("C - Jet de Pierres")
    button1:SetSize(150, 30)
    button1:SetPos(50, 50)
    button1.DoClick = function()
        ply:ConCommand("say /advert *NA* Jet de Pierres (10 Minutes)")
        frame:Close()
    end

    local button2 = vgui.Create("DButton", frame)
    button2:SetText("C - Mur de Boue")
    button2:SetSize(150, 30)
    button2:SetPos(275, 50)
    button2.DoClick = function()
        ply:ConCommand("say /advert *NA* Mur de boue (10 Minutes)")
        frame:Close()
    end

    local button3 = vgui.Create("DButton", frame)
    button3:SetText("C - Silex Perforants")
    button3:SetSize(150, 30)
    button3:SetPos(500, 50)
    button3.DoClick = function()
        ply:ConCommand("say /advert *NA* Silex Perforants (10 Minutes)")
        frame:Close()
    end

    local button4 = vgui.Create("DButton", frame)
    button4:SetText("B - Boule de Roche")
    button4:SetSize(150, 30)
    button4:SetPos(50, 100)
    button4.DoClick = function()
        ply:ConCommand("say /advert *NA* Boule de Roche (25 Minutes)")
        frame:Close()
    end

    local button5 = vgui.Create("DButton", frame)
    button5:SetText("B - Pieux de Roches")
    button5:SetSize(150, 30)
    button5:SetPos(275, 100)
    button5.DoClick = function()
        ply:ConCommand("say /advert *NA* Pieux de roches (25 Minutes)")
        frame:Close()
    end

    local button6 = vgui.Create("DButton", frame)
    button6:SetText("A - Avalanche Tellurique")
    button6:SetSize(150, 30)
    button6:SetPos(500, 100)
    button6.DoClick = function()
        ply:ConCommand("say /advert *NA* Avalanche Tellurique (40 Minutes)")
        frame:Close()
    end

    local button7 = vgui.Create("DButton", frame)
    button7:SetText("A - Grand Mur de Boue")
    button7:SetSize(150, 30)
    button7:SetPos(50, 150)
    button7.DoClick = function()
        ply:ConCommand("say /advert *NA* Grand Mur de Boue (40 Minutes)")
        frame:Close()
    end

    local button8 = vgui.Create("DButton", frame)
    button8:SetText("A - Montagne")
    button8:SetSize(150, 30)
    button8:SetPos(275, 150)
    button8.DoClick = function()
        ply:ConCommand("say /advert *NA* Montagne (40 Minutes)")
        frame:Close()
    end

    local button9 = vgui.Create("DButton", frame)
    button9:SetText("A - Termitière de Boue")
    button9:SetSize(150, 30)
    button9:SetPos(500, 150)
    button9.DoClick = function()
        ply:ConCommand("say /advert *NA* Termitière de Boue (40 Minutes)")
        frame:Close()
    end

    local button10 = vgui.Create("DButton", frame)
    button10:SetText("S - Sol de Cadavres")
    button10:SetSize(150, 30)
    button10:SetPos(50, 200)
    button10.DoClick = function()
       ply:ConCommand("say /advert *NA* Fait son entrainement pour obtenir la technique Sol de Cadavres")
        ply:ChatPrint("Vous devez faire un Passif de 3 Jours sur discord ainsi que de mettre ce message sur le serveur chaque jours de votre passif")
        frame:Close()
    end

    local button11 = vgui.Create("DButton", frame)
    button11:SetText("S - Séisme")
    button11:SetSize(150, 30)
    button11:SetPos(275, 200)
    button11.DoClick = function()
        ply:ConCommand("say /advert *NA* Fait son entrainement pour obtenir la technique Séisme")
        ply:ChatPrint("Vous devez faire un Passif de 3 Jours sur discord ainsi que de mettre ce message sur le serveur chaque jours de votre passif")
        frame:Close()
    end
end

net.Receive( "APPDOTON", function()
    drawTechniques ()
end)