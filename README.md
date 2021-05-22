# d-carwash
- If u use esx inventory or disc whatever xPlayer.getQuantity u need to change this code .
preview : https://streamable.com/mh655r
CarWash Script for FiveM
requirements mythic_progbar
             np-target 
             
NP-Target Setup
np-target/client.lua

            AddCircleZone("carwash", vector3(42.7640, -1400.2, 29.3496), 3.0, {
                name="carwash",
                debugPoly=false,
                useZ=true,
                }, {
                    options = {
                        {
                            event = "carwash31:31",
                            icon = "fas fa-coins",
                            label = "Yıkama Bileti Al",
                        },
                        {
                            event = "itemver:kurulama",
                            icon = "fas fa-coins",
                            label = "Kurulama Bileti Al",
                        },
                    },
                    distance = 1.5
                })   
