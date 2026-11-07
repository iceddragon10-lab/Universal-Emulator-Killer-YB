#Requires AutoHotkey v2.0
#SingleInstance Force

; ==========================================
; UNIVERSAL EMULATOR KILLER
; Shortcut: LT + B + D-PAD DOWN
; AutoHotkey v2
; ==========================================

; Emulator process names (without .exe)
emulators := [
    ; NINTENDO SWITCH
    "eden", "lichii", "ryujinx", "yuzu", "suyu", "torzu",
    "sudachi", "citron", "skyline", "strato", "pine",
    "selevet", "nspemu",

    ; NINTENDO 3DS / DS / GAME BOY
    "lime3ds", "citra", "citra-qt", "azahar", "mikage",
    "mandarine", "panda3ds", "desmume", "melonds", "no$gba",
    "mgba", "visualboyadvance", "visualboyadvance-m", "sameboy",
    "gambatte", "gearboy", "gearcoleco", "skyemu",

    ; NINTENDO WII / GAMECUBE / WII U
    "dolphin", "cemu", "decaf", "decaf-emu", "primehack", "triforce",

    ; PLAYSTATION 1 / 2
    "duckstation", "pcsx2", "pcsx2-qt", "xebra", "epsxe",
    "mednafen", "retroarch", "play!", "psexe",

    ; PLAYSTATION 3 / 4 / 5
    "rpcs3", "shadps4", "shadps5", "fpPS4", "orbital",
    "ps4emu", "spine",

    ; PSP / PS VITA
    "ppsspp", "vita3k", "jpcsp", "rpcsx",

    ; XBOX
    "xenia", "xenia-canary", "xemu", "cxbx", "cxbx-reloaded",
    "dxbx", "xqemu",

    ; SEGA
    "flycast", "redream", "demul", "nullDC", "gens", "gens-gs",
    "kega-fusion", "blastem", "bizhawk", "mednafen", "kega",
    "ssf", "kronos", "yabause", "picodrive",

    ; ATARI
    "stella", "hatari", "altirra", "atari800", "prosystem",
    "javatari", "steem", "winuae",

    ; ARCADE / MAME / FINALBURN
    "mame", "mame64", "mameui", "mameplus", "fbneo", "fba",
    "raine", "model2", "model3", "supermodel", "demul", "hbmame",

    ; COMMODORE / AMIGA / RETRO COMPUTERS
    "winuae", "fs-uae", "vice", "x64", "x128", "xvic",
    "xplus4", "xpet", "fellow", "puae", "dosbox", "dosbox-x",
    "dosbox-staging", "pcem", "86box", "varcem",

    ; MS-DOS / PC EMULATION
    "dosbox", "dosbox-x", "dosbox-staging", "pcem", "86box",

    ; ANDROID EMULATORS
    "HD-Player", "Bluestacks", "BlueStacksServices", "Nox",
    "NoxVMHandle", "NoxVMHandleFront", "dnplayer", "MEmu",
    "MEmuHeadless", "LdVBoxHeadless", "LdVBoxSVC",
    "Ld9BoxHeadless", "Ld9BoxSVC", "HD-Agent", "MuMuPlayer",
    "MuMuNxDevice", "MuMuVMMHeadless", "AndroidEmulator",
    "emulator", "qemu-system-x86_64", "Genymotion", "player",

    ; MULTI-SYSTEM EMULATORS
    "retroarch", "ares", "bizhawk", "mednafen", "higan",
    "bsnes", "mesen", "mesen-s", "openemu", "phoenix",
    "jgenesis", "emulationstation", "ares-emu",

    ; OTHER / SPECIALIZED EMULATORS
    "shadPS4", "RPCS3", "Cemu", "Dolphin", "Ryujinx",
    "PPSSPP", "Xenia", "Citra", "Yuzu", "melonDS",
    "DeSmuME", "RPCS4", "Azahar", "Mesen", "KegaFusion",
    "Redream", "Flycast", "ScummVM", "ResidualVM",
    "openmsx", "blueMSX", "fMSX", "openMSX", "WinVICE", "FS-UAE"
]

; Xbox controller buttons
XINPUT_GAMEPAD_B := 0x2000
XINPUT_GAMEPAD_DPAD_DOWN := 0x0002

; Left trigger threshold
TRIGGER_THRESHOLD := 100

; Prevent repeated activation
cooldown := false

; XInput state structure
stateBuffer := Buffer(16, 0)

; Load XInput
try {
    xinput := DllCall("LoadLibrary", "Str", "xinput1_4.dll", "Ptr")
} catch {
    MsgBox("Could not load XInput.")
    ExitApp()
}

if !xinput {
    MsgBox("XInput library unavailable.")
    ExitApp()
}

getState := DllCall(
    "GetProcAddress",
    "Ptr", xinput,
    "AStr", "XInputGetState",
    "Ptr"
)

if !getState {
    MsgBox("XInputGetState unavailable.")
    ExitApp()
}

; Check controller 0 every 30 ms
SetTimer(CheckController, 30)

CheckController() {
    global stateBuffer, getState
    global XINPUT_GAMEPAD_B, XINPUT_GAMEPAD_DPAD_DOWN
    global TRIGGER_THRESHOLD, cooldown

    result := DllCall(
        getState,
        "UInt", 0,
        "Ptr", stateBuffer,
        "UInt"
    )

    if result != 0
        return

    buttons := NumGet(stateBuffer, 4, "UShort")
    leftTrigger := NumGet(stateBuffer, 6, "UChar")

    ; LT + B + D-pad Down
    if (
        leftTrigger >= TRIGGER_THRESHOLD
        && (buttons & XINPUT_GAMEPAD_B)
        && (buttons & XINPUT_GAMEPAD_DPAD_DOWN)
    ) {
        if !cooldown {
            cooldown := true
            CloseEmulators()
            SetTimer(ResetCooldown, -1000)
        }
    }
}

ResetCooldown() {
    global cooldown
    cooldown := false
}

; Silently close matching emulator processes.
CloseEmulators() {
    global emulators

    for name in emulators {
        try {
            pid := ProcessExist(name ".exe")
            if pid
                ProcessClose(pid)
        }
    }
}
