ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterServerEvent('itemver:1')
AddEventHandler('itemver:1', function()
    local tokenitem = "yikamatoken"
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if  xPlayer.getQuantity(tokenitem) > 1  then
    elseif xPlayer.getQuantity(tokenitem) < 1   then
        TriggerClientEvent('esx:showNotification', src, '1 Adet Yıkama Bileti Aldın')
        xPlayer.addInventoryItem(tokenitem  , '1')
    else
        TriggerClientEvent('esx:showNotification', src, 'En fazla 1 adet Bilet Alabilirsin.')

    end
end)

RegisterServerEvent('itemver:3')
AddEventHandler('itemver:3', function()
    local kurulama = "kurulatoken"
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if  xPlayer.getQuantity(kurulama) > 1  then
    elseif xPlayer.getQuantity(kurulama) < 1   then
        TriggerClientEvent('esx:showNotification', src, '1 Adet Kurulama Bileti Aldın')
        xPlayer.addInventoryItem(kurulama  , '1')
    else
        TriggerClientEvent('esx:showNotification', src, 'En fazla 1 adet Bilet Alabilirsin.')

    end
end)





RegisterServerEvent('check:item')
AddEventHandler('check:item', function()
    local tokenitem = "yikamatoken"
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
   if xPlayer.getQuantity(tokenitem) > 0  then
    xPlayer.removeInventoryItem(tokenitem, 1) 
    TriggerClientEvent('arac:yika', source )

   else print("test")
    TriggerClientEvent('esx:showNotification', src, 'Bilete Sahip değilsin')

   end
end)


RegisterServerEvent('check:item2')
AddEventHandler('check:item2', function()
    local kurulaitem = "kurulatoken"
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
   if xPlayer.getQuantity(kurulaitem) > 0  then
    xPlayer.removeInventoryItem(kurulaitem, 1) 
    TriggerClientEvent('arac:kurula', source )

   else print("test")
    TriggerClientEvent('esx:showNotification', src, 'Bilete Sahip değilsin')

   end
end)

