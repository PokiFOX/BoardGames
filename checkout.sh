#!/usr/bin/env bash
TARGET="$1"
EXTRA="$2"
DIRS=(
	"config"
	"server"
	"unity3d"
)

for dir in "${DIRS[@]}"; do
	echo "submodule $dir"
	cd "$dir" || exit 1
	git checkout "$TARGET"
	if [ "$EXTRA" = "pull" ]; then
		git pull || exit 1
	fi
	cd - > /dev/null
done
