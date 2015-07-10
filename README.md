# Tinn-R

This is a fork of the **Tinn-R Editor - GUI for R Language and Environment** maintained by José Cláudio Faria.

In particular, the project aims at migrating the source code of Tinn-R to Delphi XE6 and includes a bunch of new features.
## Experimental features
- Autosave and recovery capabilities
- There is as column selection mode. Press “alt” and start to select.
-  Code navigator (found on the tools window/panel): Lines starting with #! are interpreted as headers. Tip: write “#! Main Title” and start another line with “#!2 Subtitle”. In case there is a digit placed after “#!” it will be interpreted as the hierarchical level. 
- Start typing the name of an object loaded in the explorer. The explorer should indicate matches, there is a shortcut to complete the name. Works only when the R term is running.
- Same for objects in the library: Besides typing the first few letters of an object name and complete it by shortcut you can also add text triggers to quickly insert longer object names and code snippets from the library into the editor.
- Add user defined code snippets to the library: Mark some text in the editor, open the context menu and click on “add code snippet”.
- Code folding for { }
- Click on the name of an object in the editor to see further details (very preliminary). Works only when the R term is running.
- Type the “$”-sign after an object such as a data.frame to get a popup to select column names (very preliminary implementation). Works only when the R term is running and for objects with simple names.
- Select several lines with different indentation and align them with the first line (right-click context menu).
- Select several lines which have  “=” equal signs to align them (right-click context menu).
- Quote all words within the current text selection (found under “edit” in the main menu).
- Remove all line breaks within the current text selection (found under “edit” in the main menu).
- Tools window/panel > file management > file list of the current folder, right-click context menu: copy-file list inserts the name of all files into the editor (very preliminary, there is no option to select files).
- Alt+down error key in the R term opens a popup menu with recently used commands (very preliminary).
- **Bugs, bugs, bugs, and missing features:** Don’t click on “auto hide” or “reformat”! There is no category or package filter for the library at the moment. “Printing”, “search in multiple files”, “apply filter” in the toolbar, invert case, LaTeX support etc. etc. doesn’t work at the moment. Only the R highlighter works at the moment, the style descriptions in the highlighter menu are probably wrong or weird.  

## Installation
The app is **available [here](https://github.com/MarcoPortmann/Tinn-R/blob/Delphi-XE/Tinn_R/install_setup/bin/Tinn-R_3.0.3.6_setup.exe?raw=true)**

### First run
Start Tinn-R and click on “R control: term start/close” in the toolbar. Tinn-R asks for the path of the R executable, starts to download all required packages and imports the R help files into the library. First, make sure that you are connected to the internet and no popup windows are hidden behind the main window and are waiting for your input (e.g. specifying a download server). Second, it can take up to 15 minutes until the help files of all packages are imported (depending on the number of installed and loaded packages). Whenever the user loads a package that has never been loaded before Tinn-R will import it. However, it will stay in the library afterwards. There is no progress indication at the moment! Therefore, just be patient when you connect to R for the first time.









LANGUAGE: **Object Pascal**, IDE: **DELPHI XE6**.
