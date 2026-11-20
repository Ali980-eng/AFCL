#!/usr/bin/env bash

set -euo pipefail

usage() {
	cat <<'EOF'
Usage:
  ./tool.sh -p <path> [-f text|markdown] -o
  ./tool.sh -p <path> [-f text|markdown] -c
  ./tool.sh -p <path> [-f text|markdown] -a
  ./tool.sh -p <path> [-f text|markdown] -r

Options:
  -p, --path       Destination directory.
  -f, --format     License format: text or markdown. Default: markdown.
  -o, --open       Open Source license.
  -c, --closed     Closed Source license.
  -a, --available  Available Source license.
  -r, --root       Main AFCL license.
  -h, --help       Show this help message.
EOF
}

destination_directory=''
format='markdown'
license_type=''

while [[ $# -gt 0 ]]; do
	case "$1" in
		-p|--path)
			[[ $# -ge 2 ]] || { echo 'Error: --path requires a directory.' >&2; usage >&2; exit 2; }
			destination_directory=$2
			shift 2
			;;
		-f|--format)
			[[ $# -ge 2 ]] || { echo 'Error: --format requires text or markdown.' >&2; usage >&2; exit 2; }
			format=$2
			shift 2
			;;
		-o|--open)
			[[ -z "$license_type" ]] || { echo 'Error: choose only one license type.' >&2; exit 2; }
			license_type='open'
			shift
			;;
		-c|--closed)
			[[ -z "$license_type" ]] || { echo 'Error: choose only one license type.' >&2; exit 2; }
			license_type='closed'
			shift
			;;
		-a|--available)
			[[ -z "$license_type" ]] || { echo 'Error: choose only one license type.' >&2; exit 2; }
			license_type='available'
			shift
			;;
		-r|--root)
			[[ -z "$license_type" ]] || { echo 'Error: choose only one license type.' >&2; exit 2; }
			license_type='root'
			shift
			;;
		-h|--help)
			usage
			exit 0
			;;
		*)
			echo "Error: unknown option: $1" >&2
			usage >&2
			exit 2
			;;
	esac
done

if [[ -z "$destination_directory" ]]; then
	echo 'Error: destination directory is required. Use --path <directory>.' >&2
	usage >&2
	exit 2
fi

case "$format" in
	markdown) extension='.md' ;;
	text) extension='.txt' ;;
	*)
		echo "Error: invalid format '$format'. Choose text or markdown." >&2
		exit 2
		;;
esac

case "$license_type" in
	open) source_directory='subLicenses'; license_name='AFCLv1-O' ;;
	closed) source_directory='subLicenses'; license_name='AFCLv1-C' ;;
	available) source_directory='subLicenses'; license_name='AFCLv1-A' ;;
	root) source_directory='mainLicense'; license_name='AFCLv1' ;;
	*)
		echo 'Error: select one license type: -o, -c, -a, or -r.' >&2
		usage >&2
		exit 2
		;;
esac

script_directory=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
source_path="$script_directory/$source_directory/$license_name$extension"

if [[ ! -f "$source_path" ]]; then
	echo "Error: license file was not found: $source_path" >&2
	exit 1
fi

mkdir -p -- "$destination_directory"
destination_path="$destination_directory/LICENSE"

if [[ -e "$destination_path" ]]; then
	echo "Error: a license already exists in this directory: $destination_path" >&2
	exit 1
fi

cp -- "$source_path" "$destination_path"
echo "License copied to: $destination_path"
