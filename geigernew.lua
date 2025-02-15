local bot = getBot()
local world = "LIADSIN"
local taruh = "LIAKEY52"
local inventory = bot:getInventory()
local geiger = bot.auto_geiger

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

function pakaihijau(id)
    if bot:isInWorld(world) == true then
        bot:wear(id)
        geiger.enabled = true
    else
        print("Bot tidak di world")
        while true do
            bot:warp(world)
            sleep(10000)
            bot:wear(id)
            local cek = inventory:getItem(id)
            if cek.isActive == true then break end
        end
    end
end

function pakaimerah(id)
    if bot:isInWorld(taruh) == true then
        bot:wear(id)
    else
        print("Bot tidak di world")
        while true do
            bot:warp(taruh)
            sleep(10000)
            bot:wear(id)
            local cek = inventory:getItem(id)
            if cek.isActive == true then
                bot:findPath(math.random(42, 46), 18)
                break
            end
        end
    end
end

function mulai()
    if bot:isInWorld(world) == true then
        geiger.enabled = true
    else
        print("Bot tidak di world")
        bot:unwear(2204)
        sleep(1000)
        bot:warp(world)
    end
end

function coba()
    if bot:isInWorld(taruh) == true then
        bot:findPath(46, 18)
        sleep(1000)
        bot:drop(2286, 1)
    else
        print("Bot tidak di world")
        while true do
            bot:warp(taruh)
            sleep(10000)
            bot:findPath(46, 18)
            bot:drop(2286, 1)
            local cek = inventory:getItem(2286)
            if cek.isActive == true then
                bot:unwear(2286)
            else
                if cek.isActive == nil then break end
            end
        end
    end
end

function keluarbentar()
    if bot:isInWorld() == true then
        bot:leaveWorld()
        bot:disconnect()
        sleep(math.random(110000, 120000))
        bot:connect()
    else
        bot:disconnect()
        sleep(math.random(110000, 120000))
        bot:connect()
    end
end

function ambil()
    if bot:isInWorld(taruh) == true then
        bot:findPath(46, 18)
        sleep(1000)
        bot:collectByID(2286)
    else
        print("Bot tidak di world")
        bot:warp(taruh)
    end
end

function gantiposisi()
    while true do
        if bot:isInWorld(taruh) == true then
            if inventory:getItemCount(2286) == 0 then
                print("Menghentikan gantiposisi")
                break
            end
            local newX = math.random(42, 46)
            bot:findPath(newX, 18)
            print("Bot pindah ke posisi baru: ", newX, 18)
            sleep(math.random(60000, 180000))
        else
            print("Bot tidak di world taruh")
            bot:warp(taruh)
            sleep(10000)
        end
    end
end

function main()
    while true do
        cekmerah = inventory:getItem(2286)
        cekhijau = inventory:getItem(2204)
        if inventory:getItemCount(2204) == 0 and inventory:getItemCount(2286) ==
            0 and cekmerah.isActive == nil and cekhijau.isActive == nil and
            geiger.enabled == false then
            ambil()
        else
            if inventory:getItemCount(2204) == 0 and
                inventory:getItemCount(2286) == 0 and cekmerah.isActive == nil and
                cekhijau.isActive == nil and geiger.enabled == true then
                geiger.enabled = false
            end
        end
        if inventory:getItemCount(2204) == 1 and inventory:getItemCount(2286) ==
            0 and cekmerah.isActive == nil and cekhijau.isActive == true and
            geiger.enabled == false then
            print("geiger dipakai dan aktif")
            mulai()
        else
            if inventory:getItemCount(2204) == 1 and
                inventory:getItemCount(2286) == 0 and cekmerah.isActive == nil and
                cekhijau.isActive == false and geiger.enabled == false then
                print("geiger belum dipakai")
                keluarbentar()
                pakaihijau(2204)
            end
        end
        if inventory:getItemCount(2204) == 0 and inventory:getItemCount(2286) ==
            1 and cekmerah.isActive == true and cekhijau.isActive == nil and
            geiger.enabled == true then
            print("geiger ngecas")
            geiger.enabled = false
            coba()
            keluarbentar()
        else
            if inventory:getItemCount(2204) == 0 and
                inventory:getItemCount(2286) == 1 and cekmerah.isActive == true and
                cekhijau.isActive == nil and geiger.enabled == false then
                print("geiger ngecas")
                gantiposisi()
            else
                if inventory:getItemCount(2204) == 0 and
                    inventory:getItemCount(2286) == 1 and cekmerah.isActive ==
                    false and cekhijau.isActive == nil and geiger.enabled ==
                    false then
                    print("geiger ngecas tapi belum dipakai")
                    pakaimerah(2286)
                end
            end
        end
        print("loop")
        sleep(5000)
    end
end
main()
