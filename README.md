# METROID ZERO MISSION REDUX

## **Index**

* [**Metroid Zero Mission Redux Info**](#metroid-zero-mission-redux-1)

* [**Changelog**](#changelog)

* [**Optional Patches**](#optional-patches)

* [**To-Do**](#to-do)

* [**Compilation**](#compilation)

* [**Patch & Use Instructions**](#instructions)

* [**Credits**](#credits)

* [**Project Licence**](#license)


-------------------

## Metroid Zero Mission Redux

“Metroid Zero Mission Redux” is a personal hack of "Metroid Zero Mission (U)" that has a few QoL features ported over from other QoL hacks available on the Metroid Construction website, more specifically, this is based on ["Project ZM" v0.83 by FelixWright/Ckosmic](https://forum.metroidconstruction.com/index.php/topic,4879.0.html), with some further modifications and improvements thrown in from other Zero Mission hacks.

Follow the GitHub repository for the full source code of the project:
https://github.com/ShadowOne333/Metroid-Zero-Mission-Redux


-------------------

## Changelog

* All of the changes listed in Project ZM are available from the start. For reference, visit the ["Project ZM" release thread on Metroid Construction](https://forum.metroidconstruction.com/index.php/topic,4879.0.html) for a full list of the initial features.
* Original title screen of Zero Mission has been restored.
* Some slight additional room and palette changes in some places (can't remember where precisely since I did those years ago).
* Samus now gets her Varia Suit shoulder pads (Full Suit) upon obtaining the Varia Suit, instead of just changing the colour of her Power Suit when obtaining Varia.
* Modify the Morph Ball so its rolling animation stops when Samus is static or not moving at all. The rolling animation only works as normal when moving left or right. **NOTE:** It's said that this one causes issues/crashes with the Chozo statues and with the "Charlie" boss (the one that gives Samus' her Full Suit / Gravity Suit), but on a full 100% playthrough on my own, I didn't get any crashes.
* A fix for the Sidehopper (Dessgeega) has been implemented.
* Doors now have a flashy/pulsating light to them.
* Kraid is now vulnerable to the Plasma Beam, since you can obtain it way earlier now with the UnkItems hack patched in.
* More accurate In-Game clock (a second each 60 frames instead of 64 frames)
* Bunch of new QoL stuff, courtesy of the "Fundamentals" hack, which puts together a lot of hacks gathered over the years for Zero Mission, some of which are:
	- Tractor Beam, to draw items towards Samus when charging the beam
	- Faster Item Grab
	- Allow items to be toggled on/off, including bombs and suits
	- 4th Map colour
	- More Map Station messages
	- Modified text messages when obtaining items (game doesn't force you into the Pause screen anymore)
	- Updated area texts
	- Weapon Missile toggle fix on Samus' death
	- Full Suit without Gravity (for Varia Suit+Shoulder Pads)
	- Activated Unknown Items right after obtaining them
	- Start With Items (Unused for Redux)
	- Transparent Map fix

* An option to select either the original behaviour for the Chozo Items, where grabbing them keeps them disabled until you get to Chozodia's boss, or a second option that enables the items as soon as you get them, so you can grab the Space Jump, Plasma Beam and Gravity Suit before even getting to Chozodia and obtaining/cleanup the maps from more items, or just wreck havoc if you can get them early on.

-------------------

## Optional patches

1. **Disable Low Health Alarm** - Self-explanatory. Disables the alarm that you get when Samus is on low health

-------------------

## To-Do

1. Reimplement the Introduction's closeup of Samus' face when starting the game (originally seen when starting in Brinstar. This was removed due to the starting location being changed to Crateria in Project ZM.
2. There might be other things that might be added, but it's still uncertain whether or not I'd want to do more, since that's the only thing missing in Zero Mission for me to make it perfect.
3. Include the "Hazard Damage Suit" and "Ledge Vault" codes from "addons" properly into Redux.
4. Possibly more optional patches.

-------------------

## Compilation

### Windows

For compilation on Windows, you need to download and install [CygWin](https://www.cygwin.com/).

When installing Cygwin, be sure to also install `git` from the list of packages available, or you won't be able to clone the repository from the source.

Once you have it installed, browse to the directory where you downloaded the source code, and start the same steps as the Linux compilation.

(I recompiled the scompress Windows EXE in Cygwin so it works properly with the Windows compilation)


### Linux

The source code was developed entirely on Linux (32bit), with armips being compiled from source to create the binary, same for FLIPS.

* Compiling the ROM:

1. Either download the source code as ZIP, or clone the repository by opening terminal and running `git clone https://github.com/ShadowOne333/Metroid-Zero-Mission-Redux`. Put the downloaded files anywhere in your PC.

2. Grab your Metroid Zero Mission (USA) ROM with the name "Metroid Zero Mission (USA).gba" inside the "/rom/" folder.

3. Open terminal in your Linux distribution, browse to the same folder as the "make.sh" file, and modify its permissions to be an executable script file by doing the following:
	`sudo chmod +x make.sh`

4. If you want specific optional patches to be applied in your complation, open the `optional.asm` file inside /code/ and uncomment the `.include "xxxx"` file of the optional patch you desire to include during compilation.

5. Enjoy the hack!


----

## Instructions

To play Metroid Zero Mission Redux, the following is required:

* mGBA 0.8.1 or above (any recent version of it should work)
* Metroid Zero Mission (USA) GBA ROM:

	Metroid Zero Mission (USA).gba
	No-Intro: Game Boy Advance (v. 20210227-023848)
	File/ROM SHA-1: 5D21C668BAA84DA4A5B745BE56809BB277F947A3
	File/ROM CRC32: 817A7E9E

* Lunar IPS
* "Metroid Zero Mission Redux.ips" patch

Grab the patches from inside the /patches/ folder from the GitHub page, or alternatively, download the .zip file from the Releases page (once a proper release is out) and apply the patch over your Metroid Zero Mission ROM with Lunar IPS.
If you want to apply any of the optional patches, you can use each Optional patch individually from inside the /patches/optional folder depending on your liking over your already patched Metroid Zero Mission Redux ROM, or you can either compile them manually from the source code, although this is not recommended if you are not familiar with compilations or ARMIPS assembly.


-------------------

## Credits

* **biospark** - For Unknown items, Starting room, Scale end percent, 4th map color.
* **FelixWright** - For his original "Project ZM" hack, which also served as inspiration for this hack, and for his help and support towards certain hacks and porting them.
* **CaptGlitch** - Faster item grab, tractor beam, start with items
* **Raygun** - Tractor beam, Unknown items, Transparent map fix
* **somerando(caauyjdp)** - More map messages, getting this to work
* **quote58** - Tractor beam
* **yohann** - Tractor beam, Unknown items, more map messages
* **kiliwily** - DessgeegaSidehopperFix, WeaponToggleOnDeath, HazardDamageSuit and LedgeVault hacks. Also credits for his Full Suit and UnkItems specific fixes for Normal Redux.
* **Metroid Construction** overall for all the great resources, forums and help towards this hack.

-------------------

## License

Metroid Zero Mission Redux is a project licensed under the terms of the GPLv3, which means that you are given legal permission to copy, distribute and/or modify this project, as long as:

1. The source for the available modified project is shared and also available to the public without exception.
2. The modified project subjects itself different naming convention, to differentiate it from the main and licensed Metroid Zero Mission Redux project.

You can find a copy of the license in the LICENSE file.

-------------------
