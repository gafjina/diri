local bot = getBot()
local botsiji = getBots()[2]
local world = "MELIGUE60"
local taruh = "MELIGUE60|RUHA67"
local worldsiji = "SISENDU"
local inventory = bot:getInventory()
local inventorysiji = botsiji:getInventory()
local geiger = bot.auto_geiger

function deleh()
    print("Menjalankan deleh")
    if bot:isInWorld(taruh) then
        print("Bot di world taruh")
        bot:drop(2286, 1)
        sleep(1000)
        bot:leaveWorld()
        bot.auto_reconnect = false
        sleep(1000)
        bot:disconnect()
        botsiji:connect()
    else
        print("Bot tidak di world taruh")
        sleep(2000)
        bot:warp(taruh)
    end
end

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

function pakaisiji()
    print("Menjalankan pakaisiji")
    if botsiji:isInWorld(worldsiji) then
        print("Bot siji di worldsiji")
        botsiji:wear(2286)
        botsiji:findPath(43, 18)
        botsiji.auto_reconnect = true
    else
        print("Bot siji tidak di worldsiji")
        sleep(2000)
        botsiji:warp(worldsiji)
    end
end

function delehsiji()
    print("Menjalankan delehsiji")
    if botsiji:isInWorld(taruh) then
        print("Botsiji di world taruh")
        botsiji:drop(2204, 1)
        botsiji:leaveWorld()
        sleep(1000)
        botsiji.auto_reconnect = false
        botsiji:disconnect()
    else
        print("Botsiji tidak di world taruh")
        sleep(2000)
        botsiji:warp(taruh)
    end
end

function main()
    while true do
        -- Perbarui status bot dan botsiji di setiap iterasi loop
        bot = getBot()
        botsiji = getBots()[2]
        inventory = bot:getInventory()
        inventorysiji = botsiji:getInventory()

        print("Status bot:", bot.status, "Status botsiji:", botsiji.status)

        if botsiji.status == 0 and bot.status == 0 then
            print("Koneksi bot")
            bot:connect()
            bot.auto_reconnect = true
            sleep(3000)
        else
            -- Pindahkan pengecekan botsiji.status == 1 and bot.status == 0 ke posisi lebih awal
            if botsiji.status == 1 and bot.status == 0 then
                print("bot cas hidup")
                if inventorysiji:getItemCount(2204) == 0 and
                    inventorysiji:getItemCount(2286) == 0 then
                    botsiji:warp(taruh)
                    sleep(1000)
                    botsiji:collectByID(2286)
                    sleep(1000)
                    botsiji:warp(worldsiji)
                    sleep(1000)
                else
                    cekgersiji = inventorysiji:getItem(2286)
                    cekgehsiji = inventorysiji:getItem(2204)
                    -- print("Status cekgersiji:", cekgersiji.isActive, "Status cekgehsiji:", cekgehsiji.isActive)
                    -- print("Inventorysiji 2204 count:", inventorysiji:getItemCount(2204), "Inventorysiji 2286 count:", inventorysiji:getItemCount(2286))
                    if inventorysiji:getItemCount(2204) == 1 and
                        inventorysiji:getItemCount(2286) == 0 and
                        cekgersiji.isActive == nil and cekgehsiji.isActive ==
                        true then
                        print("otw deleh siji")
                        botsiji:unwear(2204)
                        delehsiji()
                    else
                        cekgersiji = inventorysiji:getItem(2286)
                        cekgehsiji = inventorysiji:getItem(2204)
                        -- print("Status cekgersiji:", cekgersiji.isActive, "Status cekgehsiji:", cekgehsiji.isActive)
                        -- print("Inventorysiji 2204 count:", inventorysiji:getItemCount(2204), "Inventorysiji 2286 count:", inventorysiji:getItemCount(2286))
                        if inventorysiji:getItemCount(2204) == 1 and
                            inventorysiji:getItemCount(2286) == 0 and
                            cekgersiji.isActive == nil and cekgehsiji.isActive ==
                            false then
                            delehsiji()
                        else
                            cekgersiji = inventorysiji:getItem(2286)
                            cekgehsiji = inventorysiji:getItem(2204)
                            -- print("Status cekgersiji:", cekgersiji.isActive, "Status cekgehsiji:", cekgehsiji.isActive)
                            -- print("Inventorysiji 2204 count:", inventorysiji:getItemCount(2204), "Inventorysiji 2286 count:", inventorysiji:getItemCount(2286))
                            if inventorysiji:getItemCount(2204) == 0 and
                                inventorysiji:getItemCount(2286) == 1 and
                                cekgersiji.isActive == true and
                                cekgehsiji.isActive == nil then
                                print("menunggu")
                            else
                                cekgersiji = inventorysiji:getItem(2286)
                                cekgehsiji = inventorysiji:getItem(2204)
                                if inventorysiji:getItemCount(2204) == 0 and
                                    inventorysiji:getItemCount(2286) == 1 and
                                    cekgersiji.isActive == false and
                                    cekgehsiji.isActive == nil then
                                    pakaisiji()
                                end
                            end
                        end
                    end
                end
            else
                -- Bagian utama pengecekan bot
                if botsiji.status == 0 and bot.status == 1 then
                    print("Memeriksa inventory bot")
                    if inventory:getItemCount(2204) == 0 and
                        inventory:getItemCount(2286) == 0 then
                        bot:warp(taruh)
                        sleep(1000)
                        bot:collectByID(2204)
                        sleep(1000)
                        bot:wear(2204)
                        print("sudah pakai geiger")
                    else
                        cekge = inventory:getItem(2204)
                        if inventory:getItemCount(2204) == 1 and cekge.isActive ==
                            true and geiger.enabled == false then
                            geiger.enabled = true
                            print("geiger aktif")
                        else
                            if inventory:getItemCount(2204) == 1 and
                                cekge.isActive == false and geiger.enabled ==
                                false then
                                bot:wear(2204)
                                geiger.enabled = true
                                print("geiger aktif")
                            else
                                if inventory:getItemCount(2286) == 1 then
                                    geiger.enabled = false
                                    cekgeiger()
                                end
                            end
                        end
                    end
                end
            end
        end
        print("loop")
        sleep(5000)
    end
end

main()
