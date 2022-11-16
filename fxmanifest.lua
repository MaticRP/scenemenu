-- Resource Metadata
fx_version 'cerulean'
games { 'gta5' }

author 'TheSystems forked from KJ Studios'
description 'Classic Scene Menu Script for traffic management.'
version '3.1.0'

client_scripts {
    'client/warmenu.lua',
    'config.lua',
    'client/client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua'
}

dependencies {
    'es_extended',
    'oxmysql'
}