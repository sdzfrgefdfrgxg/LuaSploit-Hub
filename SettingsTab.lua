local function sendRequest(url, jsonData)
    print("[DEBUG] Attempting to send feedback to:", url)
    print("[DEBUG] Payload:", jsonData)
    
    local success, response = pcall(function()
        if syn and syn.request then
            print("[DEBUG] Using syn.request")
            return syn.request({
                Url = url, 
                Method = "POST", 
                Headers = {["Content-Type"] = "application/json"}, 
                Body = jsonData
            })
        elseif request then
            print("[DEBUG] Using request")
            return request({
                Url = url, 
                Method = "POST", 
                Headers = {["Content-Type"] = "application/json"}, 
                Body = jsonData
            })
        elseif http_request then
            print("[DEBUG] Using http_request")
            return http_request({
                Url = url, 
                Method = "POST", 
                Headers = {["Content-Type"] = "application/json"}, 
                Body = jsonData
            })
        else
            warn("Executor does not support HTTP requests!")
            return nil, "No HTTP request method available"
        end
    end)
    
    if success and response then
        print("[DEBUG] Request successful")
        print("[DEBUG] Status code:", response.StatusCode)
        print("[DEBUG] Response body:", response.Body)
        return true, response
    else
        local errorMsg = "Error sending feedback: " .. tostring(response or "Unknown error")
        warn(errorMsg)
        return false, errorMsg
    end
end

return function(Window, SaveManager, InterfaceManager, Rayfield)
    local SettingsTab = Window:CreateTab("Settings", 7734053495)
    local skibidi = "https://feedback.luasploitt.workers.dev/"
    local message = ""
    local lastMessageSentTime = {}

    -- UI Settings Section
    SettingsTab:CreateSection("UI Settings")

    -- Destroy GUI Button
    SettingsTab:CreateButton({
        Name = "Destroy GUI",
        Callback = function()
            Rayfield:Destroy()
        end,
    })

    -- Feedback Section
    SettingsTab:CreateSection("Feedback")
    SettingsTab:CreateInput({
        Name = "Message",
        CurrentValue = "",
        PlaceholderText = "Message Here",
        RemoveTextAfterFocusLost = false,
        Flag = "MessageInput",
        Callback = function(Text)
            message = Text
        end,
    })

    SettingsTab:CreateButton({
        Name = "Send Message",
        Callback = function()
            local playerName = game.Players.LocalPlayer.Name
            local currentTime = tick()

            if lastMessageSentTime[playerName] and currentTime - lastMessageSentTime[playerName] < 15 then
                local remainingTime = 15 - (currentTime - lastMessageSentTime[playerName])
                Rayfield:Notify({
                    Title = "Error",
                    Content = "You need to wait " .. math.ceil(remainingTime) .. " more seconds before sending another message.",
                    Duration = 5,
                    Image = 4483362458
                })
                return
            end
            
            if message == "" then
                Rayfield:Notify({
                    Title = "Error",
                    Content = "Please enter a message before sending. ❌",
                    Duration = 5,
                    Image = 4483362458
                })
                return
            end

            local success, gameInfo = pcall(function()
                return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
            end)
            local gameName = success and gameInfo.Name or "Unknown Game"
            
            local data = {
                content = "**📝 LuaSploit Feedback**\n" ..
                         "**👤 User:** " .. playerName .. "\n" ..
                         "**🎮 Game:** " .. gameName .. " (ID: " .. game.PlaceId .. ")\n" ..
                         "**📌 Join:** [Click to join game](roblox://placeId=" .. game.PlaceId .. "&gameInstanceId=" .. game.JobId .. ")\n\n" ..
                         "**📝 Feedback:**\n" .. message
            }
            
            local success, jsonData = pcall(function()
                return game:GetService("HttpService"):JSONEncode(data)
            end)

            if success then
                local sendSuccess, response = sendRequest(skibidi, jsonData)
                if sendSuccess then
                    lastMessageSentTime[playerName] = currentTime
                    Rayfield:Notify({
                        Title = "Success",
                        Content = "Your feedback has been sent! ✅",
                        Duration = 5,
                        Image = 4483362458
                    })
                else
                    Rayfield:Notify({
                        Title = "Error",
                        Content = "Failed to send feedback. Please try again later.",
                        Duration = 5,
                        Image = 4483362458
                    })
                end
            else
                Rayfield:Notify({
                    Title = "Error",
                    Content = "Failed to encode JSON data.",
                    Duration = 5,
                    Image = 4483362458
                })
            end
        end
    })
    
    return SettingsTab
end
