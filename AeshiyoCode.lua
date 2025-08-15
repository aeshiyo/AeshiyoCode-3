-- Aeshiyo MARDER MYSTORY II by aeshiyoCode<3
CHEAT_NAME = "Aeshiyo MARDER MYSTORY II"
CHEAT_AUTHOR = "aeshiyoCode<3"
CHEAT_VERSION = "1.0"

function print_banner()
    print([[
   _____ __  __ _____ _   _ _______ 
  / ____|  \/  |_   _| \ | |__   __|
 | (___ | \  / | | | |  \| |  | |   
  \___ \| |\/| | | | | . ` |  | |   
  ____) | |  | |_| |_| |\  |  | |   
 |_____/|_|  |_|_____|_| \_|  |_|   
                                    
  ]] .. CHEAT_NAME .. " by " .. CHEAT_AUTHOR)
end

function get_mm2_script()
    return [[
        loadstring(game:HttpGet("https://raw.githubusercontent.com/OnyxHub-New/OnyxHub/main/mm2"))()
        
        local Player = game:GetService("Players").LocalPlayer
        local Mouse = Player:GetMouse()
        
        Mouse.KeyDown:Connect(function(key)
            if key == "q" then
                game.Players:Chat("kill " .. Player.Name)
            end
        end)
        
        print("Aeshiyo MM2 loaded! Press Q to suicide")
    ]]
end

function main()
    print_banner()
    print("[1] Inject MM2 Script")
    print("[2] Exit")
    local choice = io.read()

    if choice == "1" then
        local script = get_mm2_script()
        print("Script loaded! Copy to executor:")
        print("========================================")
        print(script)
        print("========================================")
    elseif choice == "2" then
        return
    else
        print("Invalid choice!")
    end
end

main()
