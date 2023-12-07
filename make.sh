#! /bin/bash -e

#-------------------------------------------------------------
# Variables used for the script
export	time=$(date +'%T %a %d/%b/%Y')
export	armips=bin/armips
export	flips=bin/flips
export	file_base=Metroid-Zero-Mission-Redux
export  out_folder=out
export	patches_folder=patches
export  clean_rom=rom/MZM.gba
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
   #echo "	-o, --original	Original GFX menu (requires -r, -t, -g, -s or -c as additional argument)."
   #echo "	-t, --retrans	Retranslation scrit (requires -r, -o, -g, -s or -c as additional argument)."
   echo "	-r, --redux	Compiles default Redux (New GFX)."
   #echo "	-g, --green	Compiles Redux with Green Agahnim GFX."
   #echo "	-s, --subtitle	Compiles Redux with 'Triforce of the Gods' subtitle."
   #echo "	-c, --combine	Compiles Redux with the combined Green Agahnim and Subtitle."
   #echo
   #echo	"* To compile normal Redux (New GFX) with one of the graphical patches, use only one of the standalone syntaxes."
   #echo	"	Normal Redux:	Redux+Green Agahnim:	Redux+Subtitle:	Redux+Green Agahnim+Subtitle
	#./make.sh -r	./make.sh -g		./make.sh -s		./make.sh -c"
   #echo "* For Original GFX with one of the graphical patches, use the '-o' argument before the graphics you want"
   #echo	"	Original GFX Redux:	OG GFX Redux+Green Agahnim:	OG GFX Redux+Subtitle:	OG GFX Redux+Green Agahnim+Subtitle:
	#./make.sh -o -r		./make.sh -o -g			./make.sh -o -s			./make.sh -o -c"
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
	cp "$clean_rom" "$patched_rom"

#-------------------------------------------------------------
# Compile the main assembly code

	# Patch Project ZM Mod IPS for initialization
	echo "Patching 'Project ZM Mod' hack...";
	$flips -a "code/patch/PZM-Mod.ips" "$clean_rom"

	echo "Beginning main assembly code compilation with Armips..."; echo
	$armips $asm_file	# Main code

	echo "Main assembly code compilation succeded!"; echo

	# Create IPS
	echo "Creating $file_base.ips patch...";
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

	cp "patches/$file_base.ips" "patches/Metroid Zero Mission Redux.ips"
	rm "patches/$file_base.ips"

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

	# Force default settings at startup
	#sed -i 's/!newgfx = 0/!newgfx = 1/g' $asm_file
	#sed -i 's/!subtitle = 1/!subtitle = 0/g' $asm_file
	#sed -i 's/!retranslation = 1/!retranslation = 0/g' $asm_file

	while [ ! -z "$1" ]; do

		# Check if Redux is used alongside Green, Subtitle or Combined
		if [[ ( "$@" == *[r]* ) && ( "$@" == *[g]* || "$@" == *[s]* || "$@" == *[c]* ) ]]; then
			export error="Don't combine -r with -g/-s/-c!"
			Error;
			echo "Use -g, -s or -c by themselves, and/or with either -o or -t instead."; echo
			End;
		fi

		# Check if Green or Subtitle is used alongside Combined
		if [[ (( "$@" == *[g]* || "$@" == *[s]* ) && ( "$@" == *[c]* )) || ("$@" == *[g]* && "$@" == *[s]*)]]; then
			export error="Don't combine -g/-s with themselves, nor with -c!"
			Error;
			echo "If you want Green Agahnim + Subtitle, use -c alone instead."; echo
			End;
		fi

		# Check each argument do determine action
		case "$1" in
		--help|-h) # Display Help
			Help
			exit;;
		--retrans|-t) # Retranslation Redux script
			export script='Retranslation'
			sed -i 's/!retranslation = 0/!retranslation = 1/g' $asm_file ;;
		--original|-o) # Default Redux with Original GFX
			export org='original/Original-'	
			sed -i 's/!newgfx = 1/!newgfx = 0/g' $asm_file ;;
		--redux|-r) # Default Redux with New GFX
			shift
			export graphics='Redux'
			Start;;
		--green|-g) # Redux with Green Agahnim
			shift
			export graphics='GreenAgahnim'
			Start;;
		--subtitle|-s) # Redux with Triforce of the Gods subtitle
			shift
			export graphics='Subtitle'
			sed -i 's/!subtitle = 0/!subtitle = 1/g' $asm_file
			Start;;
		--combine|-c) # Redux with Green Agahnim and Subtitle
			shift
			export graphics='AgahnimSubtitle'
			sed -i 's/!subtitle = 0/!subtitle = 1/g' $asm_file
			Start;;
		#\?) # Invalid option
		*) # Invalid option
			echo "Error: Invalid option '$1'"
			Help
			exit;;
		esac
	shift
	done

	#shift $(($OPTIND - 1))
	#echo "$@"
fi


