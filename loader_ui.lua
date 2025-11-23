local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

return function()
    -- Create ScreenGui
    local LoaderGui = Instance.new("ScreenGui")
    LoaderGui.Name = "LSHLoader"
    LoaderGui.ResetOnSpawn = false
    LoaderGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    LoaderGui.Parent = player:WaitForChild("PlayerGui")

    -- Background Frame (Transparent with blur effect)
    local Background = Instance.new("Frame")
    Background.Size = UDim2.new(1, 0, 1, 0)
    Background.Position = UDim2.new(0, 0, 0, 0)
    Background.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    Background.BackgroundTransparency = 0.3
    Background.BorderSizePixel = 0
    Background.Parent = LoaderGui

    -- Optional: Add blur effect for a more premium look
    local BlurEffect = Instance.new("BlurEffect")
    BlurEffect.Size = 10
    BlurEffect.Parent = game:GetService("Lighting")

    -- Main Container
    local Container = Instance.new("Frame")
    Container.Size = UDim2.new(0, 450, 0, 350)
    Container.Position = UDim2.new(0.5, -225, 0.5, -175)
    Container.BackgroundTransparency = 1
    Container.Parent = Background

    -- LSH Logo Text
    local Logo = Instance.new("TextLabel")
    Logo.Size = UDim2.new(1, 0, 0, 120)
    Logo.Position = UDim2.new(0, 0, 0, 20)
    Logo.BackgroundTransparency = 1
    Logo.Text = "LSH"
    Logo.Font = Enum.Font.GothamBold
    Logo.TextSize = 100
    Logo.TextTransparency = 0
    Logo.TextStrokeTransparency = 0.5
    Logo.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    Logo.Parent = Container

    -- Gradient for Logo
    local LogoGradient = Instance.new("UIGradient")
    LogoGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 150, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(150, 100, 220)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 50, 180))
    }
    LogoGradient.Rotation = 45
    LogoGradient.Parent = Logo

    -- Subtitle
    local Subtitle = Instance.new("TextLabel")
    Subtitle.Size = UDim2.new(1, 0, 0, 30)
    Subtitle.Position = UDim2.new(0, 0, 0, 140)
    Subtitle.BackgroundTransparency = 1
    Subtitle.Text = "The ONLY script hub you'll need!"
    Subtitle.Font = Enum.Font.Gotham
    Subtitle.TextSize = 18
    Subtitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    Subtitle.TextTransparency = 0
    Subtitle.TextStrokeTransparency = 0.7
    Subtitle.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    Subtitle.Parent = Container

    -- Discord Message
    local DiscordMessage = Instance.new("TextLabel")
    DiscordMessage.Size = UDim2.new(1, 0, 0, 25)
    DiscordMessage.Position = UDim2.new(0, 0, 0, 180)
    DiscordMessage.BackgroundTransparency = 1
    DiscordMessage.Text = "While you wait, join our Discord server!"
    DiscordMessage.Font = Enum.Font.GothamSemibold
    DiscordMessage.TextSize = 15
    DiscordMessage.TextColor3 = Color3.fromRGB(150, 200, 255)
    DiscordMessage.TextTransparency = 0
    DiscordMessage.TextStrokeTransparency = 0.7
    DiscordMessage.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    DiscordMessage.Parent = Container

    -- Discord Link
    local DiscordLink = Instance.new("TextLabel")
    DiscordLink.Size = UDim2.new(1, 0, 0, 25)
    DiscordLink.Position = UDim2.new(0, 0, 0, 205)
    DiscordLink.BackgroundTransparency = 1
    DiscordLink.Text = "discord.gg/QwuqqSP9xM"
    DiscordLink.Font = Enum.Font.GothamBold
    DiscordLink.TextSize = 16
    DiscordLink.TextColor3 = Color3.fromRGB(88, 101, 242)
    DiscordLink.TextTransparency = 0
    DiscordLink.TextStrokeTransparency = 0.7
    DiscordLink.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    DiscordLink.Parent = Container

    -- Copy Discord Link Button
    local CopyButton = Instance.new("TextButton")
    CopyButton.Size = UDim2.new(0, 180, 0, 30)
    CopyButton.Position = UDim2.new(0.5, -90, 0, 235)
    CopyButton.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
    CopyButton.BackgroundTransparency = 0.2
    CopyButton.Text = "📋 Copy Discord Link"
    CopyButton.Font = Enum.Font.GothamBold
    CopyButton.TextSize = 14
    CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CopyButton.BorderSizePixel = 0
    CopyButton.Parent = Container

    local CopyButtonCorner = Instance.new("UICorner")
    CopyButtonCorner.CornerRadius = UDim.new(0, 8)
    CopyButtonCorner.Parent = CopyButton

    -- Button click effect
    CopyButton.MouseButton1Click:Connect(function()
        setclipboard("discord.gg/QwuqqSP9xM")
        CopyButton.Text = "✓ Copied!"
        wait(1.5)
        CopyButton.Text = "📋 Copy Discord Link"
    end)

    -- Hover effect for button
    CopyButton.MouseEnter:Connect(function()
        TweenService:Create(CopyButton, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
    end)

    CopyButton.MouseLeave:Connect(function()
        TweenService:Create(CopyButton, TweenInfo.new(0.2), {BackgroundTransparency = 0.2}):Play()
    end)

    -- Loading Status
    local StatusLabel = Instance.new("TextLabel")
    StatusLabel.Size = UDim2.new(1, 0, 0, 25)
    StatusLabel.Position = UDim2.new(0, 0, 0, 280)
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.Text = "Initializing..."
    StatusLabel.Font = Enum.Font.Gotham
    StatusLabel.TextSize = 14
    StatusLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
    StatusLabel.TextTransparency = 0
    StatusLabel.TextStrokeTransparency = 0.7
    StatusLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    StatusLabel.Parent = Container

    -- Progress Bar Background
    local ProgressBarBg = Instance.new("Frame")
    ProgressBarBg.Size = UDim2.new(0.85, 0, 0, 6)
    ProgressBarBg.Position = UDim2.new(0.075, 0, 0, 315)
    ProgressBarBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    ProgressBarBg.BackgroundTransparency = 0.3
    ProgressBarBg.BorderSizePixel = 0
    ProgressBarBg.Parent = Container

    local ProgressBarBgCorner = Instance.new("UICorner")
    ProgressBarBgCorner.CornerRadius = UDim.new(1, 0)
    ProgressBarBgCorner.Parent = ProgressBarBg

    -- Progress Bar Fill
    local ProgressBar = Instance.new("Frame")
    ProgressBar.Size = UDim2.new(0, 0, 1, 0)
    ProgressBar.BackgroundColor3 = Color3.fromRGB(150, 100, 220)
    ProgressBar.BorderSizePixel = 0
    ProgressBar.Parent = ProgressBarBg

    local ProgressBarCorner = Instance.new("UICorner")
    ProgressBarCorner.CornerRadius = UDim.new(1, 0)
    ProgressBarCorner.Parent = ProgressBar

    -- Progress Bar Gradient
    local ProgressGradient = Instance.new("UIGradient")
    ProgressGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 150, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 50, 180))
    }
    ProgressGradient.Parent = ProgressBar

    -- Fade in animation
    Logo.TextTransparency = 1
    Subtitle.TextTransparency = 1
    DiscordMessage.TextTransparency = 1
    DiscordLink.TextTransparency = 1
    CopyButton.BackgroundTransparency = 1
    CopyButton.TextTransparency = 1
    StatusLabel.TextTransparency = 1

    local fadeInLogo = TweenService:Create(Logo, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0})
    local fadeInSubtitle = TweenService:Create(Subtitle, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0})
    local fadeInDiscord = TweenService:Create(DiscordMessage, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0})
    local fadeInLink = TweenService:Create(DiscordLink, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0})
    local fadeInButton = TweenService:Create(CopyButton, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.2, TextTransparency = 0})
    local fadeInStatus = TweenService:Create(StatusLabel, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0})

    fadeInLogo:Play()
    wait(0.3)
    fadeInSubtitle:Play()
    wait(0.3)
    fadeInDiscord:Play()
    wait(0.2)
    fadeInLink:Play()
    wait(0.2)
    fadeInButton:Play()
    wait(0.3)
    fadeInStatus:Play()

    -- Return the loader components for external control
    return {
        Gui = LoaderGui,
        StatusLabel = StatusLabel,
        ProgressBar = ProgressBar,
        Destroy = function()
            LoaderGui:Destroy()
            BlurEffect:Destroy()
        end
    }
end
