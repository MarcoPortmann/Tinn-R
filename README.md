# Tinn-R

This is a fork of the **Tinn-R Editor - GUI for R Language and Environment** maintained by José Cláudio Faria.

In particular, the project aims at migrating the source code of Tinn-R to Delphi 10 and includes a bunch of new features.
## Experimental features
- New ribbon UI (plreliminary, most tabs are WIP) 
- Autosave and recovery capabilities
- There is as column selection mode. Press “alt” and start to select.
-  Code navigator (located on the tools window/panel): Lines starting with #! are interpreted as headers. Tip: write “#! Main Title” and start another line with “#!2 Subtitle”. In case there is a digit placed after “#!” it will be interpreted as the hierarchical level. 
- Start typing the name of an object loaded in the explorer. The explorer should indicate matches, there is a shortcut to complete the name. Works only when the R term is running.
- Same for objects in the library: Besides typing the first few letters of an object name and complete it by shortcut you can also add text triggers to quickly insert longer object names and code snippets from the library into the editor.
- Add user defined code snippets to the library: Mark some text in the editor, open the context menu and click on “add code snippet”.
- Code folding for { }
- Click on the name of an object in the editor to see further details. Works only when the R term is running.
- Type "[" or “$” after an object such as a data.frame to get a popup to select column names (very preliminary implementation). Works only when the R term is running.
- Press "(" after a function name and all parameters are shown.
- Select several lines with different indentation and align them with the first line.
- Select several lines which have  “=” equal signs to align them.
- Quote all words within the current text selection.
- Remove all line breaks within the current text selection.
- Tools window/panel > file management > file list of the current folder, right-click context menu: copy-file list inserts the name of all files into the editor (very preliminary, there is no option to select files).
- Alt+down key in the R term opens a popup menu with recently used commands (very preliminary).
- **Bugs, bugs, bugs, and missing features:** There is no category or package filter for the library at the moment. Printing, LaTeX, Sweave, Knit, etc. etc. doesn’t work at the moment. Only the R highlighter works at the moment, the style descriptions in the highlighter menu are probably wrong or weird.  

## Installation
Version 3.1.0.0 of the app is **available [here](https://github.com/MarcoPortmann/Tinn-R/blob/Delphi-XE/Tinn_R/install_setup/bin/Tinn-R_3.1.0.0_setup.exe?raw=true)**

### First run
Start Tinn-R and click on “R control: term start/close” in the toolbar. If required, Tinn-R asks for the path of the R executable, starts to download all required packages. Make sure that you are connected to the internet and no popup windows are hidden behind the main window and are waiting for your input (e.g. specifying a download server). Once all packages Tinn-R requires in order to communicate with R are installed and loaded Tinn-R will continuously check which packages are loaded and import parts of their help files into its library. Tinn-R comes with an empty libarry. Note that it can take up to 15 minutes until all base packages are imported. 



LANGUAGE: **Object Pascal**, IDE: **DELPHI 10**.
