# Makefile for compiling Metroid: Zero Mission Redux
SHELL := /bin/bash
#-------------------------------------
.PHONY: all redux unknown verify-name prepare verify-sha apply-patch clean help
#-------------------------------------
# Variables used for the script
TIME = $(shell date +'%T %a %d/%b/%Y')
FILE_BASE = MZM Redux
OUT_FOLDER = out
PATCHES_FOLDER = patches
BASE_ROM = rom/Metroid - Zero Mission (USA).gba
CLEAN_ROM = rom/MZM.gba
MOD_ROM = $(OUT_FOLDER)/PZM.gba
PATCHED_ROM = $(OUT_FOLDER)/$(FILE_BASE).gba
ASM_FILE = code/main.asm
ARMIPS = bin/armips
FLIPS = bin/flips
CHECKSUM = 5de8536afe1f0078ee6fe1089f890e8c7aa0a6e8
#-------------------------------------
# Help section
help:
	@echo "Compile 'Metroid: Zero Mission Redux' with one of the following targets:"
	@echo
	@echo "Targets:"
	@echo "  make redux     - Compiles default Zero Mission Redux"
	@echo "  make unknown   - Compiles Redux with Unknown Items activated upon obtaining them"
	@echo "  make help      - Prints this menu"
#-------------------------------------
redux: ITEMS = Redux
redux: all
#-------------------------------------
unknown: ITEMS = UnkItems
unknown: all
#-------------------------------------
all: verify-name prepare verify-sha apply-patch
#-------------------------------------
# Check base ROM name
verify-name:
	@if [ -e "$(BASE_ROM)" ]; then \
		echo "ROM detected. Verifying name..."; \
	else \
		echo "ERROR: Incorrect ROM name."; \
		echo "Please rename the ROM to 'Metroid - Zero Mission (USA).gba' to begin the patching process."; \
		exit 1; \
	fi
#-------------------------------------------------------------
# Copy base ROM into the /out/ folder
prepare:
	@cd rom && cp "Metroid - Zero Mission (USA).gba" MZM.gba && cd ..
	@mkdir -p "$(OUT_FOLDER)"
	@if [ -f "$(PATCHED_ROM)" ]; then rm "$(PATCHED_ROM)"; fi
#-------------------------------------------------------------
# SHA-1 sum verification
verify-sha:
	@if [ -f "$(CLEAN_ROM)" ]; then \
		echo; echo "Base ROM detected with proper name."; \
		echo "Verifying SHA-1 checksum hash..."; \
	else \
		echo "ERROR: Base ROM not found."; \
		echo "Place the 'Metroid - Zero Mission (USA).gba' ROM inside the 'rom' folder."; \
		exit 1; \
	fi
#-------------------------------------
# SHA-1 sum verified, begin patching...
	@sha1=$$(sha1sum "$(CLEAN_ROM)" | awk '{print $$1}'); \
	if [ "$$sha1" = "$(CHECKSUM)" ]; then \
		echo; echo "Base ROM SHA-1 checksum verified."; \
		echo "Starting patching process..."; echo; \
	else \
		echo "ERROR: Base ROM checksum is incorrect."; \
		echo "Use a 'Metroid: Zero Mission' ROM with the proper SHA-1 checksum for patching."; \
		exit 1; \
	fi
#-------------------------------------
# Patch Project ZM Mod IPS for initialization
apply-patch:
	@cp "$(CLEAN_ROM)" "$(MOD_ROM)"
	@echo "Patching 'Project ZM Mod' hack..."
	@"$(FLIPS)" -a "code/ProjectZM/PZM-Mod.ips" "$(MOD_ROM)"; echo
#-------------------------------------------------------------
# Patch Color Improvement hack by Piggy Chan
	@echo "Patching 'Color Improvement' hack by 'Piggy Chan!'..."
	@"$(FLIPS)" -a "code/ColorImprovement/Color Improvement v2.ips" "$(MOD_ROM)"; echo
#-------------------------------------------------------------
# Check if UnkItems was selected
	@echo "Beginning main assembly code compilation with Armips..."
	@if [ "$(ITEMS)" = "Redux" ]; then \
		echo "Compiling Redux with vanilla Unknown Items..."; echo; \
		sed -i 's|;unkItemsasm:|unkItemsasm:|g' $(ASM_FILE); \
		sed -i 's|knownItemsasm:|;knownItemsasm:|g' $(ASM_FILE); \
	else \
		echo "Compiling Redux with Unknown Items enabled..."; echo; \
		sed -i 's|unkItemsasm:|;unkItemsasm:|g' $(ASM_FILE); \
		sed -i 's|;knownItemsasm:|knownItemsasm:|g' $(ASM_FILE); \
	fi
#-------------------------------------------------------------
# Remove any leftover or duplicated ';' comment symbols
	@sed -i 's|;;|;|g' $(ASM_FILE)
#-------------------------------------------------------------
# Compile the main assembly file with the proper option
	@"$(ARMIPS)" "$(ASM_FILE)"
	@echo "Main assembly code compilation succeeded!"; echo
#-------------------------------------------------------------
# Create BPS patch
	@echo "Creating '$(FILE_BASE).bps' patch..."
	@"$(FLIPS)" -c -b "$(CLEAN_ROM)" "$(OUT_FOLDER)/Metroid Zero Mission Redux.gba" "$(PATCHES_FOLDER)/$(FILE_BASE).bps"
	@if [ "$(ITEMS)" = "UnkItems" ]; then \
		cp "$(PATCHES_FOLDER)/$(FILE_BASE).bps" "$(PATCHES_FOLDER)/Metroid Zero Mission Redux (Known Items).bps"; \
		rm "$(PATCHES_FOLDER)/$(FILE_BASE).bps"; \
	else \
		cp "$(PATCHES_FOLDER)/$(FILE_BASE).bps" "$(PATCHES_FOLDER)/Metroid Zero Mission Redux.bps"; \
		rm "$(PATCHES_FOLDER)/$(FILE_BASE).bps"; \
	fi
#-------------------------------------------------------------
# Finish script and jump to the "End" function
	@echo "Redux compilation finished at $(TIME)!"
#-------------------------------------
# Finish script
clean:
	@rm -f "$(CLEAN_ROM)" "$(MOD_ROM)" "$(PATCHED_ROM)"
	@rm -f "$(PATCHES_FOLDER)/$(FILE_BASE).ips"
	@echo "Cleaned patches and compiled ROMs."
#-------------------------------------

