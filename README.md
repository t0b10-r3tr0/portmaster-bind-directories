# PortMaster Releases

## Bind Mount Fix for exFAT FS (Knulli, Batocera)

In order to support the exFAT file system on [Knulli](https://knulli.org/) and [Batocera](https://batocera.org/), a new core function was added to PortMaster (`bind_directories`) to replace the previous method of using symbolic links. This resulted in many ports getting updated which now need to be tested. For status and progress, check our [**Discord Testing Thread**](https://discord.com/channels/1122861252088172575/1315085237788868608)

### Installation Instructions:

The instructions will apply to **all** of the ports tested in this post:
1. If you have the port already, uninstall it through PortMaster GUI: Manage Games > Game Info > Uninstall. 
2. Copy the `.zip` file to the `autoinstall` directory within the [PortMaster directory for your device](https://portmaster.games/installation.html#via-zip).
  * Option 1: Use SMB, SSH, or any other method provided by your CFW
  * Option 2: If your device supports it, remove micro-sd from device and copy files with computer
4. Start PortMaster and allow the auto-installation to continue.
5. Quit PortMaster and restart EmulationStation or your device.
6. Launch the port from the Ports section of ES.

#### Important

You must enable alpha builds in PortMaster to accurately test this functionality. See the Discord for more details.

### Testing

The port must be tested on the following fimwares to be considered as a passed test:
- Knulli
- Any other PM-supported CFW (ArkOS, ROCKNIX, AnberELEC, etc.)

In order consider the test passed for your device / CFW combo the following conditions must be satisfied:

1. The port loads without issue, even after rebooting the device.
2. The saves/settings persist, even after rebooting the device.
3. If port was installed previously, the existing saves/settings were preserved when testing the new version.

#### Samples of Excellent Submissions from Our Community

Here are some really great submissions we were getting from various supports:

|                                       |                                       |                                 
|:-------------------------------------:|:-------------------------------------:|
| arcade-classic-hotpink.jpg            | arcade-classic-red.jpg                |
| ![Test Results 1](https://github.com/t0b10-r3tr0/PortMaster-Releases/blob/main/test-result-1.png?raw=true) | ![Test Results 2](https://github.com/t0b10-r3tr0/PortMaster-Releases/blob/main/test-result-2.png?raw=true)             |                                       |
|                                       |                                       |

### Affected Ports

This repository contains all of the ports that have been affected as a result of these changes. The symbolic linking logic has has been replaced with PM's `bind_directory`, which require testing. This is a complete listing of the affected ports needing testing. To download the whole collection, [**click this link**](https://github.com/t0b10-r3tr0/PortMaster-Releases/archive/refs/heads/main.zip). To downoad an individual port, navigate to the appropriate directory, then the corresponding `.zip` file, and click the button titled *Download raw file*.

#### Ready to Run
```
+-----------------------------------------+----------+------------+----------------------------+
| Port Name                               |  Knulli  |  Other CFW |          Notes             |
+-----------------------------------------+----------+------------+----------------------------+
| Blake Stone - Aliens of Gold            |          |            |                            |
| Blake Stone - Planet Strike             |          |  Verified  |                            |
| Tails Adventure Remake                  |          |            |                            |
| Trogdor Reburninated                    |          |            |                            |
+-----------------------------------------+----------+------------+----------------------------+
```

#### Game Files Required:
```
+-----------------------------------------+----------+------------+----------------------------+
| Port Name                               |  Knulli  |  Other CFW |          Notes             |
+-----------------------------------------+----------+------------+----------------------------+
| Alien vs Predator                       |          |  Verified  |                            |
| Angband                                 |          |            |                            |
| Anodyne                                 |          |            |                            |
| Bleed                                   |          |            |                            |
| Bleed2                                  | Verified |            |                            |
| Blossom Tales II                        | Verified |            |                            |
| Clannad Tomoyo After                    |          |            |                            |
| Fheroes2                                |          |            |                            |
| Freesynd                                |          |            |                            |
| Hurrican                                |          |            | * also needs libcrypto.1.1 |
| Mystik Belle                            |          |            |                            |
| PanzerPaladin                           | Verified |            |                            |
| Quake 3                                 |          |            |                            |
| Return to Castle Wolfenstein            |          |            |                            |
| RigelEngine                             |          |            |                            |
| Rise of the Triad - Dark War            |          |            |                            |
| Shipwreck                               |          |            |                            |
| Sonic 3 AIR                             | Verified |            |                            |
| SteelAssault                            | Verified |            |                            |
| Timespinner                             | Verified |            |                            |
| Tomb Raider 1                           |          |            |                            |
| TowerFall Ascension                     |          |            |                            |
| Air                                     |          |          * | Need Cebion's updated      |
| Clannad                                 |          |          * | libGL/libEGL to be added   |
| Kanon                                   |  Crash   |          * | L                          |
| Little Busters!                         |          |          * | to the rlvm runtime        |
| Planetarian                             |          |          * |                            |
| Blood                                   | Verified |  Verified  | PR in progress             |
| Celeste                                 | Verified |  Verified  | PR in progress             |
| Exhumed                                 | Verified |            | PR in progress             |
| Hexen 2 - Portal of Praevus             | Verified |  Verified  | PR in progress             |
| Hexen 2                                 | Verified |  Verified  | PR in progress             |
| NAM                                     | Verified |  Verified  | PR in progress             |
| Redneck Rampage Rides Again             | Verified |  Verified  | PR in progress             |
| Redneck Rampage                         | Verified |  Verified  | PR in progress             |
| World War II GI                         | Verified |  Verified  | PR in progress             |
| Daikatana                               | Verified |  Verified  | Fixed in github            |
| Descent 3                               | Verified |            | Fixed in github            |
| Duke3D - Alien World Order              |          |            | Fixed in github            |
| If On A Winter's Night, Four Travelers  | Verified |  Verified  | Fixed in github            |
| Star Wars Jedi Knight - Jedi Academy    | Verified |  Verified  | Fixed in github            |
| Star Wars Jedi Knight II - Jedi Outcast | Verified |  Verified  | Fixed in github            |
| Need For Speed II SE                    | Verified |  Verified  | Fixed in github            |
| World of Goo                            | Verified |            | Fixed in github            |
+-----------------------------------------+----------+------------+----------------------------+
```

### Contributing

You can download the ports to your device and join us in the [Discord testing thread](https://discord.com/channels/1122861252088172575/1315085237788868608) to check the current status of the testing progress. 
