# It's 23-Oct-2022, and if you install openSUSE Leap, it comes with Python3.6 inbuilt. But this doesn't work with the new VSCode debugger.
# So, to make it work, we need some prior installations.

# 1. Install Build Essentials:
zypper info -t pattern devel_basis
sudo zypper install -t pattern devel_basis
zypper install libffi-devel openssl-devel zlib-devel
