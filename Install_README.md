# LogViewer Installation and Usage Guide

## Overview

LogViewer is a GUI application for viewing and searching through log files with ANSI color support and configurable highlighting. It provides a user-friendly interface for analyzing log files with features like text search, font customization, and configurable term highlighting.

## Installation

LogViewer has been installed to `/opt/LogViewer/`. The application can be launched from:
- Applications menu (under System/Utilities)
- Command line: `/opt/LogViewer/log_viewer_start.sh`
- Desktop file: `/usr/share/applications/LogViewer.desktop`

## Requirements

- Python 3.6 or later
- PyQt5 or PyQt6
- PyYAML

### Installing Dependencies

If dependencies are missing, install them using:

```bash
# For Fedora/RHEL/CentOS
sudo dnf install python3-qt5 python3-pyyaml

# Or using pip
pip3 install PyQt5 pyyaml
```

## Usage

### Basic Usage

1. **Launch the application:**
   ```bash
   /opt/LogViewer/log_viewer_start.sh
   ```

2. **Open a log file:**
   - Use File → Open menu
   - Or pass filename as argument: `log_viewer_start.sh /path/to/logfile.log`

3. **Search within the file:**
   - Use Ctrl+F to open search
   - Enter search terms and press Enter or click Find
   - Use F3 for Find Next, Shift+F3 for Find Previous

### Command Line Options

```bash
# Open with specific log file
/opt/LogViewer/log_viewer_start.sh /var/log/messages

# Use custom configuration file
/opt/LogViewer/log_viewer_start.sh --config /path/to/config.yml /var/log/syslog
```

### Configuration

LogViewer uses a YAML configuration file located at `/opt/LogViewer/config.yml`. You can customize:

- **Display settings:** Font family, size, colors
- **Highlighting:** Custom patterns and colors for log levels
- **Search behavior:** Case sensitivity, regex support
- **UI preferences:** Window size, line numbers, text wrapping

#### Sample Configuration

```yaml
display:
  font_family: "Consolas"
  font_size: 12
  background_color: "#ffffff"
  text_color: "#000000"

highlighting:
  enabled: true
  terms:
    - pattern: "ERROR"
      color: "#ff0000"
      background: "#ffdddd"
    - pattern: "WARNING"
      color: "#ff8800"
      background: "#fff3dd"
```

### Features

- **ANSI Color Support:** Properly displays ANSI color codes in log files
- **Configurable Highlighting:** Custom highlighting for error levels and patterns
- **Fast Search:** Quick text search with case-sensitive/insensitive options
- **Large File Support:** Efficient handling of large log files
- **Keyboard Shortcuts:**
  - Ctrl+O: Open file
  - Ctrl+F: Find/Search
  - F3: Find next
  - Shift+F3: Find previous
  - Ctrl+Q: Quit
  - F1: Help

### Troubleshooting

1. **Application won't start:**
   - Check Python 3 installation: `python3 --version`
   - Verify PyQt installation: `python3 -c "import PyQt5"`
   - Check dependencies: `python3 -c "import yaml"`

2. **Configuration issues:**
   - Verify config file syntax: `/opt/LogViewer/config.yml`
   - Reset to defaults by removing/renaming config file

3. **Performance issues with large files:**
   - Adjust `max_file_size_mb` in configuration
   - Disable automatic highlighting for very large files

### File Locations

- **Application:** `/opt/LogViewer/`
- **Configuration:** `/opt/LogViewer/config.yml`
- **Desktop file:** `/usr/share/applications/LogViewer.desktop`
- **Documentation:** `/usr/share/doc/LogViewer/README.md`

## Support

For issues or questions about LogViewer, please check:
1. This documentation
2. Configuration file settings
3. System requirements and dependencies

## Version Information

- **Version:** 3.7.1
- **License:** Proprietary
- **Build Date:** 2024

---

© 2024 Log Viewer Build - All rights reserved
