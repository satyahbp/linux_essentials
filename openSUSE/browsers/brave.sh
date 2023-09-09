#!/bin/sh

# the following commands have been directly copied from brave download page:
# https://brave.com/linux/

sudo zypper install curl

sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

sudo zypper addrepo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

sudo zypper install brave-browser