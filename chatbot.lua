-- chatbot.lua
return function(Window, Rayfield)
    local EnesAITab = Window:CreateTab("Enes AI", 129651773273582) -- Title, Image

    local function SmartReply(msg)
        msg = string.lower(msg)

        local function Has(words)
            for _, w in ipairs(words) do
                if msg:find(w) then return true end
            end
            return false
        end

        if Has({"money","dollar","rich","cash"}) then
            return " The economy might be down but you're still the KING!"
        elseif Has({"hi","hello","hey","sup"}) then
            return " Hey king! You came in shining bright."
        elseif Has({"fuck","shit","damn","bitch"}) then
            return " Are you talking to ME?! Just kidding, chill out "
        elseif Has({"roblox","game"}) then
            return " I'm the master of Roblox, what do you want to play?"
        elseif Has({"script","exploit","executor"}) then
            return " Scripting is my thing! What are we running?"
        elseif Has({"youtube","video","enes"}) then
            return " Camera's on! Got 10 minutes of content ready "
        elseif Has({"girl","love","girlfriend"}) then
            return " I'm your love coach, tell me everything!"
        elseif Has({"how are you"}) then
            return " I'm doing amazing! Your presence just lit up the place."
        elseif msg:find("?") then
            return " Good question. Here's my advice: Believe in yourself!"
        elseif #msg > 50 then
            return " That's a long message but I read it all, you make good points."
        else
            return " Got your message! Keep it up, king."
        end
    end

    -- Chat Section
    local ChatSection = EnesAITab:CreateSection("Chat with Enes AI")

    EnesAITab:CreateInput({
        Name = "AI Chat",
        PlaceholderText = "Type a message, I'll respond automatically...",
        RemoveTextAfterFocusLost = false,
        Callback = function(msg)
            if msg and msg ~= "" then
                Rayfield:Notify({
                    Title = "Enes AI",
                    Content = SmartReply(msg),
                    Duration = 5,
                    Image = 4483362458
                })
            end
        end
    })

    -- Commands Section
    local CommandsSection = EnesAITab:CreateSection("Quick Commands")

    EnesAITab:CreateParagraph({
        Title = "Try these keywords:",
        Content = [[
money, dollar, rich, cash  
swear words  
roblox, game  
script, exploit  
youtube, video  
girl, love  
how are you  
]]
    })
end


--// Credits
-- By _alxdy
-- Translation by gpt
-- Structured by LuaSploit
