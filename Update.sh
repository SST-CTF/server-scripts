#!/bin/bash

wall UPDATING

# Check for updates
sudo apt-get update && echo 'y' | sudo apt-get upgrade

wall Update DONE
