# Universal Emulator Killer

A lightweight AutoHotkey v2 script that silently closes selected emulator processes with an Xbox/XInput controller shortcut.

## Default shortcut

**Hold Left Trigger + B + D-pad Down**

The script polls XInput controller slot 0 every 30 ms. When the shortcut is detected, it checks the configured process-name list and closes matching processes. It has a one-second cooldown and shows no success/failure notifications.

## Requirements

- Windows
- [AutoHotkey v2](https://www.autohotkey.com/)
- An XInput-compatible controller (for example, an Xbox controller)

## Install and run

1. Install AutoHotkey v2.
2. Download `UniversalEmulatorKiller.ahk` from this repository.
3. Double-click the `.ahk` file to run it.
4. Hold **LT + B + D-pad Down** to close matching emulator processes.

To stop the script, find its green AutoHotkey tray icon, right-click it, and choose **Exit**.

## Customize the emulator list

Edit the `emulators` array near the top of the script. Add process names **without** `.exe`.

For example, if Task Manager shows `example-emu.exe`, add:

```autohotkey
"example-emu",
```

The process name must match the actual executable name. Emulator launchers and frontends may use a different process name from the emulator itself.

## Current coverage

The included list contains process-name candidates for emulators across:

- Nintendo consoles and handhelds
- PlayStation
- Xbox
- Sega
- Atari
- Arcade systems
- Commodore and Amiga
- DOS and retro PC systems
- Android emulators
- Multi-system emulators

This is a curated list, **not a guarantee that every emulator on earth is supported**. Emulator names and process names vary by version, fork, and distribution. Some listed names may not exist on your PC.

## Important behavior and safety

- The script uses `ProcessClose()` and therefore force-terminates matching processes. Unsaved emulator state or game progress may be lost.
- It checks only XInput controller slot **0**. Other controller slots are not currently monitored.
- It closes only processes whose executable names match entries in the list. It does not discover every emulator automatically.
- Generic process names can belong to unrelated software. Review the list before adding broad names such as `player`, `emulator`, or `qemu-system-x86_64`.
- If an emulator is running with higher privileges, AutoHotkey may need to be run with matching or higher privileges.
- The script does not intentionally close Windows, Steam, or other general-purpose processes unless their names are added to the list.

## Troubleshooting

1. Confirm the emulator's exact process name in **Task Manager → Details**.
2. Add that name to the `emulators` array without `.exe`.
3. Confirm the controller is recognized as an XInput controller and is assigned to slot 0.
4. If closing fails, try running the script with the same Windows privilege level as the emulator.

## Contributing

Pull requests adding verified emulator executable names, improving controller compatibility, or fixing bugs are welcome. Please include the emulator name and the exact process name observed on Windows.

## License

No license has been specified yet. Until a license is added, assume the usual default copyright applies; do not assume others have permission to redistribute or modify this project.
