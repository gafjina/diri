bot = getBot()
local rotation = bot.rotation

function letter()
    local chars = "abcdefghijklmnopqrstuvwxyz"
    local length = math.random(3, 4)
    local randomString = ""
    for i = 1, length do
        local index = math.random(1, #chars)
        randomString = randomString .. chars:sub(index, index)
    end
    return randomString
end

while true do
    playtime = bot:getPlaytime()
    if playtime > 700 then
        --rotation.enabled = false
        print("trigger playtime")
        bot:warp(letter())
    else
        --rotation.enabled = true
        print("kembali...")
    end
    sleep(15000)
end