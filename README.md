
# RGBPi-Extra

**RGBpi-Extra**

RGBpi-Extra is a UI that allows you to apply a collection of unofficial scripts for [RGBPiOS](https://www.rgb-pi.com/#os), enabling you to quickly and easily install emulators, ports, and libretrocores that haven't been included in RGBPi for various reasons. Additionally, it provides the capability to enable RetroArch features that are disabled by default. These scripts are experimental in nature and may not be fully stable. The concept for creating this repository was inspired by [RetroPie-Extra](https://github.com/Exarkuniv/RetroPie-Extra) and represents a collaborative effort across multiple parties within the RGBPi community.


**THIS WILL ONLY WORK ON THE LATEST OS4 V27**
**THIS IS NOT SUPPORTED BY RGBPI OS DEVS SO DONT ASK THEM ABOUT ANY ISSUES IF YOU HAVE INSTALLED THIS**

I have found new scripts made by other people and added them to this Repo. I dont take credit for any of them, other then the ones I made. RGBPi OS uses a custom kernel driver and custom compiled version of retroarch. Pre-Compiled Cores from libretro, Retropie, batocera, lakka will not work (mostly). I have found that compiling cores on the RGBpi OS itself works best, but can still take some adjustments in the cmake flags.

**Notes**

- RGBPi OS runs on Bullseye
- It uses a custom kernel driver for the GPIO output
- It uses a custom retroarch build with dynares, dynares takes a sample of the rom fps and resolution and then adjusts the kernel driver framebuffer to match.
- It does not have xorg out of the box so any emulators that require it wont work
- applications that use egl/kms can work, but may be limited to 240p




I have changed the list below to show what has been tested to at least to install. I dont have all the games so I cant test them all 

Pull requests and issue reports are accepted and encouraged as well as requests. Feel free to use the issue tracker to send me any personal requests for new scripts that you may have.

## Installation

1. Download [Install RGBPi-Extra.sh](https://github.com/sd2cv/rgbpi-addons/blob/master/Install%20RGBPi-Extra.sh)
2. Place it in /roms/ports 
3. Scan for games in the rgbpi ui
4. Go to ports in rgbpi ui and select Install RGBPi-Extra. The screen will turn blank while downloading
5. The RGBPi-Extra UI will appear allowing you to apply the patch and restart 

## Usage

After installing **RGBPi-Extra** you will now have a RGBPi-Extra folder within ports and within that the RGBPi-Extra launcher

USAGE readme still in the works
#### Retroarch Settings 
This allows you to add retroarch features that are disabled by default by RGBPi-OS. Currently only boolean shows up in the UI, but you can add any global configs that you would like to /application/data/tweaks/gobal_configs.ini
#### Update Cores
Still in progress do not use this area
#### Tweaks
A collection of scripts to modify RGBPi OS settings, Bullseye settings or just general improvements
#### Settings
Currently just for removal of RGBPi-Extra, As of now to update RGBPi-Extra you will need to run the removal prior to updating.

IF YOU ARE REIMAGING YOUR SD CARD YOU MUST REMOVE RGBPI-EXTRA BEFORE DOING SO.


## Updating

in progress


## Remove

To remove the patch open RGBPi-Extra ui, go to settings and select remove.

# Systems

If there is a [X] that means it Installs and Plays. 
I'll have a note at the end with some Info about it. if there is NO note or  [ ] **PLEASE LET ME KNOW** if it works for you 

Since we are using CRTs not all cores/emulators will look good. This all depends on the native resolution and fps of the gamnes

#### Emulators 

- [ ] - `box86` -"Box86 emulator"
- [ ] - `openbor` - Beat 'em Up Game Engine (newest version) -
- [X] - `pico8` - Fantasy Game Emulator - **Included in ports from RGBPi OS official**
- [ ] - `supermodel-mechafatnick` - Sega Model 3 Arcade emulator
- [ ] - `supermodel-svn` - Sega Model 3 Arcade emulator
- [X] - `Hypseus-singe` - LaserDisc emulator - **Included in ports from RGBPi OS official**

#### Libretrocores

- [ ] - `lr-2048.sh` - 2048 engine - 2048 port for libretro
- [ ] - `lr-applewin` - Apple2e emulator - AppleWin (current) port for libretro 
- [ ] - `lr-arduous_lcd` - ArduBoy emulator - arduous port for libretro
- [ ] - `lr-beetle-pce.sh` - PCEngine emu - Mednafen PCE port for libretro
- [ ] - `lr-bk.sh` -  Elektronika БК-0010/0011/Terak 8510a emulator - BK port for libretro
- [ ] - `lr-blastem.sh` - Sega Genesis emu - BlastEm port for libretro
- [ ] - `lr-boom3.sh` -  Doom 3 port for libretro
- [ ] - `lr-bsnes-hd.sh` - "Super Nintendo Emulator - bsnes-HD port for libretro (BETA)"
- [ ] - `lr-canary.sh` - Citra Canary for libretro
- [ ] - `lr-cannonball.sh` - An Enhanced OutRun engine for libretro
- [ ] - `lr-chailove.sh` - 2D Game Framework with ChaiScript roughly inspired by the LÖVE API to libretro
- [ ] - `lr-citra.sh` - Citra port for libretro
- [ ] - `lr-crocods.sh` - CrocoDS port for libretro 
- [ ] - `lr-daphne.sh` - Daphne port to libretro - laserdisk arcade games.
- [ ] - `lr-duckstation.sh` -"PlayStation emulator - Duckstation for libretro"
- [ ] - `lr-fceumm-mod.sh` - Modified fceumm core to specifically support the Super Mario Bros 1/3 hack
- [ ] - `lr-freej2me.sh` - A J2ME implementation for old JAVA phone games.
- [ ] - `lr-gearboy.sh` - Game Boy (Color) emulator - Gearboy port for libretro. 
- [ ] - `lr-gearcoleco.sh` - ColecoVision emulator - GearColeco port for libretro.
- [ ] - `lr-lutro.sh` - Lua engine - lua game framework (WIP) for libretro following the LÖVE API 
- [ ] - `lr-mame2003_midway.sh` - MAME 0.78 core with Midway games optimizations. 
- [X] - `lr-melondsds` - NDS emu - MelonDS port for libretro **runs great, included in current patch**
- [X] - `lr-mesen-s.sh` - Super Nintendo emu - Mesen-S port for libretro 
- [ ] - `lr-mess-jaguar.sh` - atari jaguar system emu
- [ ] - `lr-mu.sh` - Palm OS emu - Mu port for libretro 
- [ ] - `lr-oberon.sh` - Oberon RISC emulator for libretro
- [ ] - `lr-openlara.sh` - Tomb Raider engine - OpenLara port for libretro
- [ ] - `lr-play.sh` - PlayStation 2 emulator - Play port for libretro
- [ ] - `lr-potator.sh` -  Watara Supervision emulator based on Normmatt version - Potator port for libretro
- [X] - `lr-ppsspp.sh` - PlayStation Portable emu - PPSSPP port for libretro - **runs great, included in current patch**
- [ ] - `lr-prboom-system.sh` - For setting up DOOM as an emulated system, not a port.  - 
- [ ] - `lr-race.sh` - Neo Geo Pocket (Color) emulator - RACE! port for libretro. 
- [ ] - `lr-reminiscence.sh` - Flashback engine - Gregory Montoir’s Flashback emulator port for libretro
- [ ] - `lr-sameboy.sh` - Game Boy and Game Boy Color, emulator - SameBoy Port for libretro
- [ ] - `lr-samecdi` - Philips CDI - same_cdi port for libretro
- [ ] - `lr-simcoupe.sh` - SAM Coupe emulator - SimCoupe port for libretro
- [ ] - `lr-swanstation.sh` - Playstation emulator - Duckstation fork for libretro
- [X] - `lr-TIC-80.sh` - Fantasy Game Emulator  **runs great, not included yet**
- [ ] - `lr-thepowdertoy.sh` - Sandbox physics game for libretro - 
- [ ] - `lr-uzem.sh` - Uzebox engine - Uzem port for libretro
- [ ] - `lr-vemulator.sh` - SEGA VMU emulator - 
- [X] - `lr-yabasanshiro.sh` - Saturn & ST-V emulator - **runs great, included in current patch**

#### Ports
- [ ] - `0ad.sh` - Battle of Survival - is a futuristic real-time strategy game 
- [ ] - `abuse.sh` - Classic action game 
- [ ] - `adom.sh` - Ancient Domains of Mystery - a free roguelike by Thomas Biskup -  
- [ ] - `augustus.sh` - Enhanced Caesar III source port - 
- [ ] - `avp.sh` - AVP - Aliens versus Predator port - 
- [ ] - `barrage.sh` - Shooting Gallery action game -
- [ ] - `bermudasyndrome.sh` - Bermuda Syndrome engine 
- [ ] - `berusky.sh` - Advanced sokoban clone with nice graphics - 
- [ ] - `bloboats.sh` - Fun physics game -
- [ ] - `boswars.sh` - Battle of Survival - is a futuristic real-time strategy game - 
- [ ] - `breaker.sh` - Arkanoid clone - 
- [ ] - `bstone.sh` - BStone A source port of Blake Stone: Aliens of Gold and Blake Stone: Planet Strike 
- [ ] - `burgerspace.sh` - BurgerTime clone - 
- [ ] - `captains.sh`- Captain 'S' The Remake - 
- [ ] - `chocolate-doom.sh`- DOOM source port - 
- [ ] - `chocolate-doom-system.sh`- For setting up DOOM as an emulated system, not port. - 
- [ ] - `chopper258.sh` - Chopper Commando Revisited - A modern port of Chopper Commando (DOS, 1990) -
- [ ] - `corsixth.sh` - CorsixTH - Theme Hospital Engine - 
- [ ] - `crack-attack.sh` - Tetris Attack clone - 
- [ ] - `crispy-doom.sh` - DOOM source port - 
- [ ] - `crispy-doom-system.sh` - For setting up DOOM as an emulated system, not port. - 
- [ ] - `cytadela.sh` - Cytadela project - a conversion of an Amiga first person shooter. - 
- [ ] - `devilutionx.sh` - Diablo source port -
- [ ] - `dhewm3.sh` - Doom 3 port - 
- [ ] - `diablo2.sh` - Diablo 2 - Lord of Destruction port - 
- [ ] - `dosbox-x.sh` - DOSbox-X - Testing of a new DOSbox system - 
- [ ] - `dunelegacy.sh` - Dune 2 Building of a Dynasty port - 
- [ ] - `easyrpgplayer.sh` - RPG Maker 2000/2003 interpreter - 
- [ ] - `ecwolf.sh` - ECWolf is an advanced source port for Wolfenstein 3D - 
- [ ] - `eternity.sh` - Enhanced port of the official DOOM source - 
- [ ] - `extremetuxracer.sh` -  Linux verion of Mario cart - 
- [ ] - `fallout1.sh` -  Fallout2-ce - Fallout 2 Community Edition - 
- [ ] - `fallout2.sh` -  Fallout2-ce - Fallout 2 Community Edition - 
- [ ] - `freeciv.sh` - Civilization online clone - 
- [ ] - `freedink.sh` - Dink Smallwood engine - 
- [ ] - `freesynd.sh` - Syndicate clone - 
- [ ] - `fruity.sh` - inspired by the Kaiko classic Gem'X - 
- [ ] - `fs2open.sh` - FreeSpace 2 Open - Origin Repository for FreeSpace 2 - 
- [ ] - `galius.sh` - - Maze of Galius - 
- [ ] - `gmloader.sh` - GMLoader - play GameMaker Studio games for Android on non-Android operating systems - 
- [ ] - `gnukem.sh` - Dave Gnukem - Duke Nukem 1 look-a-like - 
- [ ] - `gtkboard.sh` - Board games system - 
- [ ] - `hcl.sh` - Hydra Castle Labrinth - 
- [ ] - `heboris.sh` - Tetris The Grand Master clone - 
- [ ] - `hero2.sh` - FHeroes2 - Heroes of Might and Magic II port - 
- [ ] - `hexen2.sh` - Hexen II - Hammer of Thyrion source port Non-OpenGL - 
- [ ] - `hexen2gl.sh` - Hexen II - Hammer of Thyrion source port using OpenGL - 
- [ ] - `hheretic.sh` - Heretic GL port - 
- [ ] - `hhexen.sh` - Hexen GL portt - 
- [ ] - `hurrican.sh` - Turrican clone. - 
- [ ] - `ikemen-go.sh` - I.K.E.M.E.N GO - Clone of M.U.G.E.N. - 
- [ ] - `ja2.sh` - Stracciatella - Jagged Alliance 2 engine - 
- [ ] - `jfsw.sh` - Shadow warrior port - 
- [ ] - `julius.sh` - Caesar III source port - 
- [ ] - `kraptor.sh` - Shoot em up scroller game - 
- [ ] - `lbreakout2.sh` - Open Source Breakout game - 
- [ ] - `lgeneral.sh` - Open Source strategy game - 
- [ ] - `lmarbles.sh` - Open Source Atomix game - 
- [ ] - `ltris.sh` - Open Source Tetris game - 
- [ ] - `manaplus.sh` - manaplus - 2D MMORPG Client - 
- [ ] - `meritous.sh` - Port of an action-adventure dungeon crawl game - 
- [ ] - `nblood.sh` - Blood source port - 
- [ ] - `nkaruga.sh` - Ikaruga demake. - 
- [ ] - `nxengine-evo.sh` - The standalone version of the open-source clone/rewrite of Cave Story - 
- [ ] - `openclaw.sh` - Reimplementation of Captain Claw - 
- [ ] - `opendune.sh` - Dune 2 source port -
- [ ] - `openjazz.sh` - An enhanced Jazz Jackrabbit source port - 
- [ ] - `openjk_ja.sh` - OpenJK: JediAcademy (SP + MP) - 
- [ ] - `openjk_jo.sh` - OpenJK: Jedi Outcast (SP) - 
- [ ] - `openmw.sh` - Morrowind source port - 
- [ ] - `openra.sh` - Real Time Strategy game engine supporting early Westwood classics - 
- [ ] - `openrct2.sh` - RollerCoaster Tycoon 2 port - 
- [ ] - `pcexhumed.sh` - PCExhumed - Powerslave source port - 
- [ ] - `piegalaxy.sh` - Pie Galaxy - Download and install GOG.com games in RetroPie - 
- [ ] - `pingus.sh` - Lemmings clone - 
- [ ] - `pokerth.sh` - open source online poker  - 
- [ ] - `prboom-plus.sh` - Enhanced DOOM source port - 
- [ ] - `prototype.sh` - Free R-Type remake by Ron Bunce - Gamepad support incomplete. 
- [ ] - `pydance.sh` - Open Source Dancing Game  - 
- [ ] - `quakespasm.sh` - Another enhanced engine for quake  - 
- [ ] - `rawgl.sh` - Another World Engine  - 
- [ ] - `rednukem.sh` -  Rednukem - Redneck Rampage source port - 
- [ ] - `relive.sh` - Oddworld engine for Abe's Oddysee and Abe's Exoddus 
- [ ] - `reminiscence.sh` - Flashback engine clone - 
- [ ] - `revolt.sh` - REvolt - a radio control car racing themed video game - 
- [ ] - `rickyd.sh` - Rick Dangerous clone - 
- [ ] - `rigelengine.sh` - RigelEngine - Duke Nukem 2 source port - 
- [ ] - `rocksndiamonds.sh` - Rocks'n'Diamonds - Emerald Mine Clone - 
- [ ] - `rott-darkwar.sh` - Rise of the Triad source port with joystick support - 
- [ ] - `rott-huntbgin.sh` - Rise of the Triad (shareware version) source port with joystick support. - 
- [ ] - `rtcw.sh`- IORTCW source port of Return to Castle Wolfenstein. - 
- [ ] - `samtfe`- Serious Sam Classic The First Encounter. - 
- [ ] - `samtse`- Serious Sam Classic The Second Encounter. - 
- [ ] - `sdl-bomber.sh` - Simple Bomberman clone - 
- [ ] - `seahorse.sh` - a side scrolling platform game 
- [ ] - `septerra.sh` - Septerra Core: Legacy of the Creator port  
- [ ] - `shiromino.sh` - Tetris The Grand Master Clone  
- [ ] - `shockolate.sh` - Source port of System Shock  
- [ ] - `simutrans.sh` - freeware and open-source transportation simulator  
- [ ] - `sm64ex.sh` - Super Mario 64 PC Port for Pi4 - Works extremely well on Pi 4. 
- [ ] - `sorr.sh` - Streets of Rage Remake port - 
- [ ] - `sorrv2.sh` - Streets of Rage Remake port - 
- [ ] - `sqrxz2.sh` - Sqrxz 2 - Two seconds until death - 
- [ ] - `sqrxz3.sh` - Sqrxz 3 - Adventure For Love - 
- [ ] - `sqrxz4.sh` - Sqrxz 4 - Cold Cash - 
- [ ] - `starcraft.sh` - Starcraft - 
- [ ] - `supaplex.sh` - Reverse engineering Supaplex - 
- [ ] - `vanillacc.sh` - Vanilla-Command and Conquer - 
- [ ] - `vcmi.sh` - Open-source engine for Heroes of Might and Magic III - 
- [ ] - `supertuxkart.sh` - a free kart-racing game - 
- [ ] - `temptations.sh` - Enhanced version of the MXS game - 
- [ ] - `warmux.sh` - Worms Clone - 
- [ ] - `wesnoth.sh` - Turn-based strategy game - 
- [ ] - `wine.sh` - WINEHQ - Wine Is Not an Emulator - 
- [ ] - `xash3d-fwgs.sh` - Half-Life engine source port. - 
- [ ] - `xump.sh` - The Final Run - 
- [ ] - `zeldansq.sh` - Zelda: Navi's Quest fangame - 

#### Supplementary
- [ ] - `audacity.sh` - Audacity open-source digital audio editor - 
- [ ] - `chromium.sh` - Open Source Web Browser - **Installs, Work well, requires sandbox mode. Firefox is recommended**
- [ ] - `epiphany.sh` - epiphany lightweight web browser - 
- [X] - `LXQT Desktop` - Linux Desktop Environment, optimized for 720x480 - **Installs Runs fine**
- [X] - `firefox-esr.sh` - FireFox-ESR - Formally known as IceWeasel, the Rebranded Firefox Web Browser - **Installs Runs fine**
- [X] - `videolan.sh` - VLC media player - **Installs Runs fine, but cant figure out how to get it out of default 240p**

### Removed broken scripts


## Hall of Fame - Ports added that made it to the official OS release

- [X] - Kodi - Media Player
