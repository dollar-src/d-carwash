
    ESX = nil

	Citizen.CreateThread(function()
		while ESX == nil do
			TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
			Citizen.Wait(0)
		end
	end)
	

	
	local NPC = { x = 42.1762, y = -1399.96, z = 29.3499, rotation = 270.35, NetworkSync = true}
	Citizen.CreateThread(function()
	  modelHash = GetHashKey("s_m_m_autoshop_02")
	  RequestModel(modelHash)
	  while not HasModelLoaded(modelHash) do
		   Wait(1)
	  end
	  createNPC() 
	end)
	function createNPC()
		created_ped = CreatePed(0, modelHash , NPC.x,NPC.y,NPC.z - 1, NPC.rotation, NPC.NetworkSync)
		FreezeEntityPosition(created_ped, true)
		SetEntityInvincible(created_ped, true)
		SetBlockingOfNonTemporaryEvents(created_ped, true)
	end
	RegisterNetEvent('carwash31:31')
	AddEventHandler('carwash31:31', function ()
		TriggerServerEvent('itemver:1')
	end)
	

	RegisterNetEvent('itemver:kurulama')
	AddEventHandler('itemver:kurulama', function ()
		TriggerServerEvent('itemver:3')
	end)


	function WashVehicle()
			startWash()
			UseParticleFxAssetNextCall("core")
			particles  = StartParticleFxLoopedAtCoord("ent_amb_waterfall_splash_p", 37.27, -1392.52, 28.93, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
			UseParticleFxAssetNextCall("core")
			particles2  = StartParticleFxLoopedAtCoord("ent_amb_waterfall_splash_p", 37.27, -1392.52, 28.93, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
			timer = 15
			timer2 = true
			Citizen.Wait(12000)
			WashDecalsFromVehicle(car, 1.0)
			SetVehicleDirtLevel(car)
			FreezeEntityPosition(car, false)
			StopParticleFxLooped(particles, 0)
			StopParticleFxLooped(particles2, 0)
			local vehicle = GetVehiclePedIsIn(PlayerPedId())
			WashDecalsFromVehicle(vehicle, 1.0)
			SetVehicleDirtLevel(vehicle, 0.0)
	
	
		end

		function kurula()
				kurulabasla()
				UseParticleFxAssetNextCall("core")
				particles1  = StartParticleFxLoopedAtCoord("ent_sht_steam", 11.0932, -1393.7, 29.2879, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
				UseParticleFxAssetNextCall("core")
				particles3  = StartParticleFxLoopedAtCoord("ent_sht_steam", 11.0299, -1391.1, 29.3071, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
				timer = 15
				timer2 = true
				Citizen.Wait(12000)
				WashDecalsFromVehicle(car, 1.0)
				SetVehicleDirtLevel(car)
				FreezeEntityPosition(car, false)
				StopParticleFxLooped(particles1, 0)
				StopParticleFxLooped(particles3, 0)
				local vehicle = GetVehiclePedIsIn(PlayerPedId())
				WashDecalsFromVehicle(vehicle, 1.0)
				SetVehicleDirtLevel(vehicle, 0.0)
		
		
			end

	RegisterNetEvent('arac:yika')
	AddEventHandler('arac:yika', function ()
		WashVehicle()
	end)

	RegisterNetEvent('arac:kurula')
	AddEventHandler('arac:kurula', function ()
		kurula()
	end)




	
	
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)
			local coords, letSleep = GetEntityCoords(PlayerPedId()), true
	
			for k,v in pairs(Config.Zones) do
				if (Config.Type ~= -1 and GetDistanceBetweenCoords(coords, v, true) < 5 ) then
					letSleep = false
					if (Config.Type ~= -1 and GetDistanceBetweenCoords(coords, v, true) < 5 ) then
						ESX.ShowHelpNotification("Aracı Yıkamak için ~INPUT_CONTEXT~ tuşuna basınız.")
				   end
				   if IsControlJustReleased(1, 38) then
					TriggerServerEvent('check:item')
				   end
				end
			end
	
			if letSleep then
				Citizen.Wait(500)
			end
		end
	end)


	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)
			local coords, letSleep = GetEntityCoords(PlayerPedId()), true
	
			for k,v in pairs(Config.Kurula) do
				if (Config.Type ~= -1 and GetDistanceBetweenCoords(coords, v, true) < 5 ) then
					letSleep = false
					if (Config.Type ~= -1 and GetDistanceBetweenCoords(coords, v, true) < 5 ) then
						ESX.ShowHelpNotification("Aracı Kurulamak için ~INPUT_CONTEXT~ tuşuna basınız.")
				   end
				   if IsControlJustReleased(1, 38) then
					TriggerServerEvent('check:item2')
				   end
				end
			end
	
			if letSleep then
				Citizen.Wait(500)
			end
		end
	end)
	
	function startWash()
		exports['mythic_progbar']:Progress({
			name = "mining",
			duration = 12000,
			label = 'Araç Yıkanıyor',
			useWhileDead = false,
			canCancel = false,
			controlDisables = {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = true,
				disableCombat = true,
			},
		}, function(cancelled)
			
		end)
	end

	function kurulabasla()
		exports['mythic_progbar']:Progress({
			name = "mining",
			duration = 12000,
			label = 'Araç Kurulanıyor',
			useWhileDead = false,
			canCancel = false,
			controlDisables = {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = false,
				disableCombat = true,
			},
		}, function(cancelled)
			
		end)
	end
	RegisterNetEvent('startwash:31')
	AddEventHandler('startWash:31', function ()
		WashVehicle()
	end)

