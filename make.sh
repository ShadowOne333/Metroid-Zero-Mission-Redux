#! /bin/bash -e

#-------------------------------------------------------------
# Variables used for the script
export	time=$(date +'%T %a %d/%b/%Y')
export	armips=bin/armips
export	flips=bin/flips
export	file_base="Metroid Zero Mission Redux"
export  out_folder=out
export	patches_folder=patches
export  clean_rom=rom/MZM.gba
export	mod_rom=out/PZM.gba
export  patched_rom=$out_folder/$file_base.gba
export  asm_file=code/main.asm
export	checksum=5de8536afe1f0078ee6fe1089f890e8c7aa0a6e8

#-------------------------------------------------------------
# Help section
Help()
{
   # Display Help
   echo "Compile 'Metroid: Zero Mission Redux' with one of the following arguments:"
   echo
   echo "Syntax: make.sh [option]"
   echo "Options:"
   echo "	-h, --help	Prints this menu."
   echo "	-r, --redux	Compiles default Zero Mission Redux."
   echo "	-u, --unknown	Compiles Redux with Unknown Items activated upon obtaining them."
}

#-------------------------------------------------------------
# Begin compilation
Start()
{
# Check base ROM name
	if [ -e "rom/Metroid - Zero Mission (USA).gba" ]; then
		echo "ROM detected. Verifying name..."
	else
		export error="Incorrect ROM name."
		Error;	
		echo "Please, rename the ROM to 'Metroid - Zero Mission (USA).gba' to begin the patching process."
		End;
	fi

#-------------------------------------------------------------
# Copy base ROM into the /out/ folder
	cd rom/ && cp "Metroid - Zero Mission (USA).gba" MZM.gba && cd ..
	test ! -d "$out_folder" && mkdir "$out_folder"
	test -f "$patched_rom" && rm "$patched_rom"

#-------------------------------------------------------------
# SHA-1 sum verification
	if [ -f "$clean_rom" ]; then
		echo; echo "Base ROM detected with proper name."
		echo "Verifying SHA-1 checksum hash..."
	else
		export error="Base ROM not found."
		Error;
		echo "Place the 'Metroid - Zero Mission (USA).gba' ROM inside the 'rom' folder."
		End;
	fi

	export	sha1=$(sha1sum "$clean_rom" | awk '{ print $1 }')

#-------------------------------------------------------------
# SHA-1 sum verified, begin patching...
	if [ "$sha1" == "$checksum" ]; then
		echo; echo "Base ROM SHA-1 checksum verified."
		echo "Starting patching process..."; echo
	else
		export error="Base ROM checksum is incorrect."
		Error;
		echo "Use a 'Metroid: Zero Mission' ROM with the proper SHA-1 checksum for patching."
		End;
	fi

#-------------------------------------------------------------
# Copy clean ROM into a base used for patching to keep clean ROM intact
	cp "$clean_rom" "$mod_rom"

#-------------------------------------------------------------
# Compile the main assembly code

	# Patch Project ZM Mod IPS for initialization
	echo "Patching 'Project ZM Mod' hack...";
	$flips -a "code/ProjectZM/PZM-Mod.ips" "$mod_rom";
	#$flips -a "code/ProjectZM/ProjZM083.ips" "$mod_rom";
	#$flips -a "code/ProjectZM/ProjZM083-UnkEnabled.ips" "$mod_rom";
	echo

	echo "Beginning main assembly code compilation with Armips..."; echo

	# Check if UnkItems was selected
	if [ "$items" == "Redux" ]; then

		sed -i 's|;.include "code/asm/UnkItems.asm"|.include "code/asm/UnkItems.asm"|g' $asm_file
		sed -i 's|.include "code/asm/KnownItems.asm"|;.include "code/asm/KnownItems.asm"|g' $asm_file

	else [ "$items" == "UnkItems" ]

		sed -i 's|.include "code/asm/UnkItems.asm"|;.include "code/asm/UnkItems.asm"|g' $asm_file
		sed -i 's|;.include "code/asm/KnownItems.asm"|.include "code/asm/KnownItems.asm"|g' $asm_file

	fi

	# Remove any leftover or duplicated ';' comment symbols
	sed -i 's|;;|;|g' $asm_file

	# Compile the main assembly file with the proper option
	$armips $asm_file	# Main code
	echo "Main assembly code compilation succeded!"; echo

	# Create IPS
	echo "Creating '$file_base.ips' patch...";
	$flips -c -i "$clean_rom" "$patched_rom" "$patches_folder/$file_base.ips"


#-------------------------------------------------------------
# Finish script and jump to the "End" function
	echo "Redux compilation finished at $time!"
	End
}

#-------------------------------------------------------------
# Error message
Error()
{
	echo; echo "Redux compilation exited with errors!"
	echo "ERROR: $error"
}

#-------------------------------------------------------------
# Finish script
End()
{
	if [ -f "$clean_rom" ]; then
		rm $clean_rom
	fi

	if [ -f "$mod_rom" ]; then
		rm $mod_rom
	fi

	#cp "patches/$file_base.ips" "patches/Metroid Zero Mission Redux.ips"
	#rm "patches/$file_base.ips"

	sleep 1
	exit
}

#-------------------------------------------------------------
# Get the options
if [[ "$1" == "" ]];then
    Help;
    exit;
else
	#while getopts "horgsc" option; do
	#case $option in

	while [ ! -z "$1" ]; do
	# Check each argument do determine action
		case "$1" in
		--help|-h)	# Display Help
			Help
			exit;;
		--redux|-r)	# Default Zero Mission Redux
			shift
			export items='Redux'
			Start;;
		--unknown|-u)	# Redux with Unknown Items
			shift
			export items='UnkItems'
			Start;;
		#\?)	# Invalid option
		*)	# Invalid option
			echo "Error: Invalid option '$1'"
			Help
			exit;;
		esac
	shift
	done

	#shift $(($OPTIND - 1))
	#echo "$@"
fi


