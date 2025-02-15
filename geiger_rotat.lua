local bot = getBot()
local world = "LIADSIN"
local taruh = "LIAKEY52"
local inventory = bot:getInventory()
local geiger = bot.auto_geiger
local rotation = bot.rotation

function cekgeiger()
    print("Menjalankan cekgeiger")
    if inventory:getItemCount(2286) == 1 then
        print("Menonaktifkan geiger")
        geiger.enabled = false
        bot:leaveWorld()
        sleep(2000)
        bot:warp(taruh)
        sleep(2000)
        deleh()
    end
end

function pakai(id)
    if bot:isInWorld() == true then
        botsiji:wear(id)
    else
        print("Bot tidak di world")
        rotation.enabled = false
        bot:warp(taruh)
    end
end

function main()
    while true do
        cekmerah = inventory:getItem(2286)
        cekhijau = inventory:getItem(2204)
        if inventory:getItemCount(2204) == 1 and inventory:getItemCount(2286) ==
            0 and cekmerah.isActive == nil and cekhijau.isActive == true then
            print("geiger dipakai dan aktif")
            rotation.enabled = false
            geiger.enabled = true
        else
            if inventory:getItemCount(2204) == 1 and
                inventory:getItemCount(2286) == 0 and cekmerah.isActive == nil and
                cekhijau.isActive == false then
                print("geiger belum dipakai")
                rotation.enabled = false
                pakai(2204)
            end
        end
        if inventory:getItemCount(2204) == 0 and inventory:getItemCount(2286) ==
            1 and cekmerah.isActive == true and cekhijau.isActive == nil then
            print("geiger ngecas")
            geiger.enabled = false
            rotation.enabled = true
        else
            if inventory:getItemCount(2204) == 0 and
                inventory:getItemCount(2286) == 1 and cekmerah.isActive == false and
                cekhijau.isActive == nil then
                print("geiger ngecas tapi belum dipakai")
                geiger.enabled = false
                pakai(2286)
            end
        end
        print("loop")
        sleep(5000)
    end
end
main()