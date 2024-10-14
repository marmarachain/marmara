#!/bin/bash
set -e

echo "****************************************************"
echo "Running: marmarad $@"
echo "****************************************************"

# Run marmarad with arguments
exec marmarad "$@"