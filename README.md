# FiveM ESX Darkweb and 911 Script


## Description

This script is designed for FiveM roleplaying servers using the ESX framework. It includes functionality for accessing the Darkweb and making 911 calls in-game. Darkweb access requires a specific item, and 911 calls are directed to players with the police and ambulance jobs.

## Features

- Access the Darkweb with an item.
- Make 911 calls.
- Dark-themed chat notifications.
- Discord webhook integration for Darkweb messages (configurable).

## Installation

1. Ensure you have a working ESX server set up and configured.
2. Download or clone this repository to your FiveM server resources folder.
3. Import the SQL file to add the Darkweb item to your ESX database.
4. Configure the Discord webhook URL in `server.lua` for Darkweb integration.
5. Start the script in your `server.cfg` by adding `start esx_darkweb911`.

## Usage

### Darkweb Access

- Players need the "darkweb_item" item to access the Darkweb.
- Use `/darkweb` to access the Darkweb if you have the item.

### 911 Calls

- Use `/911 [message]` to make a 911 call.
- 911 calls are visible to players with the police and ambulance jobs.

## Configuration

You can customize the script by modifying the `server.lua` and `client.lua` files. You may also want to adjust the CSS styling in `client.lua` to match your preferred theme.

## Credits

- vmpdev

