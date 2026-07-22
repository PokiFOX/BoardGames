#!/bin/bash

LLDB_MI=$(ls -d /Users/weiwei/.vscode/extensions/ms-vscode.cpptools-*-darwin-arm64/debugAdapters/lldb-mi/bin/lldb-mi 2>/dev/null | tail -n 1)
if [[ -z "$LLDB_MI" ]]; then
	LLDB_MI=$(ls -d /Users/weiwei/.cursor/extensions/ms-vscode.cpptools-*-darwin-arm64/debugAdapters/lldb-mi/bin/lldb-mi 2>/dev/null | tail -n 1)
fi

if [[ -z "$LLDB_MI" ]]; then
	echo "Error: lldb-mi not found! Install the C/C++ extension (ms-vscode.cpptools)."
	exit 1
fi

exec "$LLDB_MI" "$@"
