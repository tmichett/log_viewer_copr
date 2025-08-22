#!/bin/bash
# LogViewer Startup Script
# This script launches the LogViewer application with proper environment setup

# Set the application directory
APP_DIR="/opt/LogViewer"

# Change to the application directory
cd "$APP_DIR"

# Set up Python path if needed
export PYTHONPATH="$APP_DIR:$PYTHONPATH"

# Check if Python 3 is available
if command -v python3 &> /dev/null; then
    PYTHON_CMD="python3"
elif command -v python &> /dev/null; then
    PYTHON_CMD="python"
else
    echo "Error: Python 3 is required to run LogViewer"
    exit 1
fi

# Check for required Python modules
$PYTHON_CMD -c "import yaml" 2>/dev/null
if [ $? -ne 0 ]; then
    echo "Error: PyYAML is required. Please install it with: pip3 install pyyaml"
    exit 1
fi

# Check for PyQt
$PYTHON_CMD -c "import PyQt5" 2>/dev/null || $PYTHON_CMD -c "import PyQt6" 2>/dev/null
if [ $? -ne 0 ]; then
    echo "Error: PyQt5 or PyQt6 is required. Please install it with: pip3 install PyQt5 or pip3 install PyQt6"
    exit 1
fi

# Launch the application
exec "$PYTHON_CMD" "$APP_DIR/log_viewer" "$@"
