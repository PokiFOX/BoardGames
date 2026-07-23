#!/bin/bash

# Cursor ships anysphere.cpptools; VS Code uses ms-vscode.cpptools
LLDB_MI=$(ls -d \
	/Users/weiwei/.cursor/extensions/anysphere.cpptools-*-darwin-arm64/debugAdapters/lldb-mi/bin/lldb-mi \
	/Users/weiwei/.cursor/extensions/ms-vscode.cpptools-*-darwin-arm64/debugAdapters/lldb-mi/bin/lldb-mi \
	/Users/weiwei/.vscode/extensions/ms-vscode.cpptools-*-darwin-arm64/debugAdapters/lldb-mi/bin/lldb-mi \
	2>/dev/null | tail -n 1)

if [[ -z "$LLDB_MI" ]]; then
	echo "Error: lldb-mi not found! Install the C/C++ extension (cpptools)."
	exit 1
fi

exec "$LLDB_MI" "$@"
