#!/bin/bash
#variables
Citra_emuName="Citra"
Citra_emuType="FlatPak"
Citra_emuPath="org.citra_emu.citra"
Citra_releaseURL=""

#cleanupOlderThings
Citra.finalize(){
 #na
}

#Install
Citra.install(){
	installEmuFP "${Citra_emuName}" "${Citra_emuPath}"	
	flatpak override "${Citra_emuPath}" --filesystem=host --user	
}

#ApplyInitialSettings
Citra.init(){
	configEmuFP "${Citra_emuName}" "${Citra_emuPath}" "true"
	Citra.setupStorage
	Citra.setEmulationFolder
	Citra.setupSaves
}

#update
Citra.update(){
	configEmuFP "${Citra_emuName}" "${Citra_emuPath}"
	Citra.setupStorage
	Citra.setEmulationFolder
	Citra.setupSaves
}

#ConfigurePaths
Citra.setEmulationFolder(){
  	configFile="$HOME/.var/app/org.citra_emu.citra/config/citra-emu/qt-config.ini"
    gameDirOpt='Paths\gamedirs\3\path='
    newGameDirOpt='Paths\gamedirs\3\path='"${romsPath}3ds"
    sed -i "/${gameDirOpt}/c\\${newGameDirOpt}" "$configFile"
}

#SetupSaves
Citra.setupSaves(){
	linkToSaveFolder citra saves "$HOME/.var/app/org.citra_emu.citra/data/citra-emu/sdmc"
	linkToSaveFolder citra states "$HOME/.var/app/org.citra_emu.citra/data/citra-emu/states"
}


#SetupStorage
Citra.setupStorage(){
    #TBD
}


#WipeSettings
Citra.wipe(){
   rm -rf "$HOME/.var/app/$Citra_emuPath"
   # prob not cause roms are here
}


#Uninstall
Citra.uninstall(){
    flatpack uninstall "$Citra_emuPath" -y
}

#setABXYstyle
Citra.setABXYstyle(){
    
}

#Migrate
Citra.migrate(){
    
}

#WideScreenOn
Citra.wideScreenOn(){
#na
}

#WideScreenOff
Citra.wideScreenOff(){
#na
}

#BezelOn
Citra.bezelOn(){
#na
}

#BezelOff
Citra.bezelOff(){
#na
}

#finalExec - Extra stuff
Citra.finalize(){
	#na
}
