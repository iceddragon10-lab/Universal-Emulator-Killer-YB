# Universal-Emulator-Killer-YB
# 🎮 Universal Emulator Killer

### One controller shortcut. Close your emulator. Get back to gaming.

**Universal Emulator Killer** is a lightweight Windows utility built with AutoHotkey v2 that allows you to instantly close running game emulators using nothing but your Xbox controller.

No keyboard shortcuts to remember. No need to Alt+Tab. No searching through Task Manager. Just press your configured controller combination, and the emulator closes silently in the background.

Designed for gamers who use multiple emulators and want a quick, convenient way to exit their games.

---

## ✨ Features

- 🎮 **Xbox Controller Support** – Uses XInput to detect controller inputs.
- ⚡ **Instant Closing** – Terminates matching emulator processes.
- 🤫 **Completely Silent** – No popups, notifications, or confirmation dialogs.
- 🌍 **Extensive Emulator Database** – Includes process names for Nintendo, PlayStation, Xbox, Sega, Atari, Android, arcade, and retro-computing emulators.
- 🔧 **Customizable** – Easily add your own emulator process names.
- 🪶 **Lightweight** – Runs quietly in the Windows background.
- 🔄 **Cooldown Protection** – Prevents repeated activation from one held combination.

## 🎮 Default Controller Shortcut

Hold all three inputs simultaneously:

| Controller input | Action |
|---|---|
| Left Trigger (LT) | Hold |
| B button | Hold |
| D-Pad Down | Hold |

**Result:** All matching running emulator processes are closed.

The shortcut can be customized directly in the `.ahk` script.

---

## 📥 Installation

### 1. Install AutoHotkey v2

This project requires **AutoHotkey v2.0 or newer** to run.

Download it from the official website:

👉 https://www.autohotkey.com/

Make sure you install version 2, not AutoHotkey v1. The script uses AutoHotkey v2 syntax and is not compatible with v1.

### 2. Download Universal Emulator Killer

1. Open this GitHub repository.
2. Click the green **Code** button.
3. Select **Download ZIP**.
4. Extract the downloaded ZIP file somewhere convenient.

### 3. Run the script

1. Locate `UniversalEmulatorKiller.ahk`.
2. Double-click the file.
3. The script will start running in the background.
4. Connect your Xbox-compatible controller.

That's it! You can now use the controller shortcut to close supported emulators.

---

## 🕹️ Supported Emulators

The included process database covers a wide range of emulator families:

- **Nintendo:** Eden, Lichii, Ryujinx, Yuzu, Citra, Azahar, Lime3DS, Dolphin, Cemu, and more.
- **PlayStation:** DuckStation, PCSX2, RPCS3, ShadPS4, Vita3K, PPSSPP, and more.
- **Xbox:** Xenia, Xemu, Cxbx-Reloaded, and more.
- **Sega:** Flycast, Redream, Kega Fusion, BlastEm, and more.
- **Atari:** Stella, Hatari, Altirra, and more.
- **Arcade:** MAME, FinalBurn Neo, and Supermodel.
- **Android:** BlueStacks, LDPlayer, NoxPlayer, MEmu, MuMu, and Genymotion.
- **Retro Computing:** DOSBox, 86Box, PCem, WinUAE, and more.
- **Multi-System:** RetroArch, Ares, BizHawk, Mesen, and Mednafen.

*Note: This is a curated process-name database, not a guarantee of compatibility with every emulator. Actual executable names can vary between versions and distributions.*

---

## 🔧 Adding Your Own Emulators

Can't find your emulator in the list?

You can easily add it yourself.

1. Open `UniversalEmulatorKiller.ahk` using Notepad or your preferred code editor.
2. Find the `emulators := [` section.
3. Add your emulator's process name without `.exe`.

Example:

```autohotkey
"my-emulator",
"another-emulator",
```

4. Save the file.
5. Restart the script.

To find the correct process name, open Windows Task Manager → Details while your emulator is running.

---

## ⚙️ Requirements

- Windows 10 or Windows 11.
- AutoHotkey v2.0 or newer.
- An Xbox or XInput-compatible controller.
- A supported emulator process.

**Important:** The current implementation monitors XInput controller slot 0.

---

## ⚠️ Important Information

- The script forcefully terminates matching processes.
- Unsaved game progress may be lost.
- It does not automatically detect every emulator in existence.
- Some emulators use additional background processes that may remain running.
- If an emulator runs with administrator privileges, the script may need equivalent privileges.
- Be careful when adding generic process names because they may belong to unrelated applications.

---

## 📜 License & Credits

### AutoHotkey

This project is powered by [AutoHotkey](https://www.autohotkey.com/), a free and open-source Windows automation and scripting utility.

AutoHotkey is distributed under the **GNU General Public License v2.0 (GPL-2.0)**.

- [AutoHotkey Official GitHub Repository](https://github.com/AutoHotkey/AutoHotkey)
- [AutoHotkey GPL-2.0 License](https://github.com/AutoHotkey/AutoHotkey/blob/alpha/license.txt)
- [GNU GPL v2 Full License](https://www.gnu.org/licenses/old-licenses/gpl-2.0.html)

Universal Emulator Killer does not bundle the AutoHotkey runtime.

**Important:** The AutoHotkey runtime's license is separate from the license of this project's own script. See the repository's `LICENSE` file for the terms governing this project.

### Credits

- [AutoHotkey](https://www.autohotkey.com/) – Scripting language and runtime.
- Microsoft XInput – Xbox controller input interface.

---

## ❤️ Contributing

Have an emulator that isn't supported?

Contributions are welcome!

You can help by:
- Adding verified emulator process names.
- Improving controller compatibility.
- Reporting bugs.
- Suggesting new features.
- Improving documentation.

Every contribution helps make Universal Emulator Killer better for everyone.

**If you find this project useful, consider giving the repository a ⭐ Star!**

---

*Made for gamers, by gamers.*
