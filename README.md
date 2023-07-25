## Miyoo OSS Project

WARNING: *THERE IS NO RETURN TO STOCK UNLESS YOU CAN MANUALLY FLASH. BE AWARE THAT THIS PROJECT IS VERY MUCH INCOMPLETE. NO GAMES RUN. NOTHING WILL DISPLAY ON YOUR SCREEN. YOU WILL BE HERE FOR A WHILE.*

### Building

1) Open in vscode and use the devcontainer provided
2) Run ./build
3) cd project
4) ./make_sd_upgrade_sigmastar.sh

### Running


1) Copy `project/image/output/images/SigmastarUpgradeSD.bin` to your sdcard
2) If you're on stock firmware, rename to your typical stock firmware filename
3) Enter uboot shell
4) type `sdstar`
4) user is root

## Todo

- Wifi
- Screen
- Audio
- Keyboard (steward-fu is working on this already)
- Will likely want to try to upgrade to a newer kernel, buildroot, uboot, ect

## Discussions

We are in the #firmware thread in the miyoo-mini channel on discord here - https://discord.gg/retro-game-handhelds-529983248114122762