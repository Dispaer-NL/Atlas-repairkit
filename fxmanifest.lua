fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author "Atlas scripts"
description "atlas-repairkit | repair kit script for fivem"

shared_scripts {
    "@ox_lib/init.lua",
    "src/config/config.lua"
}

client_scripts {
    "src/client/client.lua"
}

server_scripts {
    "src/server/server.lua"
}