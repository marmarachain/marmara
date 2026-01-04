#!/bin/bash

set -e

echo "...Checking fetch-params"
$HOME/fetch-params.sh
echo "Initialization completed successfully"
echo

exec  "$@"