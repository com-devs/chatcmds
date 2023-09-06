fx_version 'cerulean'
game 'gta5'

author 'vmpdev'
description 'ESX Darkweb and 911 Script'
version '1.0'

client_scripts {
    'client.lua',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua', -- Ensure you have the MySQL-Async library installed
    'server.lua',
}

dependencies {
    'es_extended',
}
