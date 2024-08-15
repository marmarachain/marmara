[![Build Status](https://travis-ci.org/KomodoPlatform/komodo.svg?branch=master)](https://travis-ci.org/KomodoPlatform/komodo)
[![Issues](https://img.shields.io/github/issues-raw/komodoplatform/komodo)](https://github.com/KomodoPlatform/komodo/issues)
[![PRs](https://img.shields.io/github/issues-pr-closed/komodoplatform/komodo)](https://github.com/KomodoPlatform/komodo/pulls)
[![Commits](https://img.shields.io/github/commit-activity/y/komodoplatform/komodo)](https://github.com/KomodoPlatform/komodo/commits/dev)
[![Contributors](https://img.shields.io/github/contributors/komodoplatform/komodo)](https://github.com/KomodoPlatform/komodo/graphs/contributors)
[![Last Commit](https://img.shields.io/github/last-commit/komodoplatform/komodo)](https://github.com/KomodoPlatform/komodo/graphs/commit-activity)


[![gitstars](https://img.shields.io/github/stars/komodoplatform/komodo?style=social)](https://github.com/KomodoPlatform/komodo/stargazers)
[![twitter](https://img.shields.io/twitter/follow/marmarachain?style=social)](https://twitter.com/marmarachain)
[![discord](https://img.shields.io/discord/412898016371015680)](https://discord.gg/QZNMw73)

![MarmaraCreditLoops Logo](https://raw.githubusercontent.com/marmarachain/marmara/master/MCL-Logo.png "Marmara Credit Loops Logo")

## Marmara Credit Loops

This is the official Marmara Credit Loops sourcecode repository based on https://github.com/marmarachain. 

## Resources

- Marmara Credit Loops Website: [Marmara Website](http://marmara.io/)
- Marmara Credit Loops Blockexplorer: [Marmara Explorer](https://explorer.marmara.io/)
- Marmara Credit Loops Discord: [MCL Discord](https://discord.com/invite/DZDPAd)
- Mail: [marmarachain@gmail.com](mailto:marmarachain@gmail.com)
- Whitepaper: [Marmara Whitepaper](http://marmara.io/docs/IMSS2019_WhitePaper_English.pdf)


## Tech Specification
- Pre-mining: 2,000,000 MCL
- Annual Supply: ~ 15,000,000 MCL
- Block Time: 60 seconds
- Block Reward:  30 MCL
- 25% Mining, 75% Staking (Staking is only possible with activated/locked coins).
- 3x staking when Activating/locking Coins in Credit Loops

## About this Project

Marmara, or Marmara Credit Loops is a peer-to-peer credit creation and circulation platform using Komodo Blockchain Technologies that is based on Zcash and has been extended by its innovative consensus algorithm called dPoW which utilizes Bitcoin's hashrate to store Komodo blockchain information into the Bitcoin blockchain. 

The main purpose of Marmara is to solve non-redemption problem in peer-to-peer credit creation and circulation. It is the first system in the World to solve universal bouncing problem in post-dated cheques and promissory notes used in many countries. The system may be easily used by communities adopting similar culture. It is originally a trust based system.

Millennium Version has 100 % collateralization. So there is no more bouncing problem in credits or cheques. This is achieved through staking coins by means of activation, i.e. timelocking. When activated in credit loops, coins give you 3x boosted staking power.
More details are available under http://marmara.io/

## Getting Started

- To install/download Marmara Credit Loops, follow the [Marmara Credit Loops Instructions](https://github.com/marmarachain/marmara/wiki).
- To get started with Marmara Credit Loops, follow the [Marmara Credit Loops Usage Guidelines](https://github.com/marmarachain/marmara/wiki/Getting-Started-with-Marmara) and to make Marmara Credit Loops, follow the [Making Marmara Credit Loops](https://github.com/marmarachain/marmara/wiki/How-to-make-Marmara-Credit-Loops?) guide.

### Linux

#### Requirements

    Linux (easiest with a Debian-based distribution, such as Ubuntu)
        For Ubuntu, we recommend using the 18.04 or 20.02 releases
    64-bit Processor
    Minimum 2 CPUs
    Minimum 4GB of free RAM

#### Build Marmara from Source

Note: For Ubuntu 20.04, please change the python-zmq library to python3-zmq below.

Install the dependency packages:
```	
sudo apt-get install build-essential pkg-config libc6-dev m4 g++-multilib autoconf libtool ncurses-dev unzip git python python-zmq zlib1g-dev wget curl bsdmainutils automake cmake clang ntp ntpdate nano -y
```
Build marmara from source:
```	
cd ~
git clone https://github.com/marmarachain/marmara --branch master --single-branch
cd marmara
./zcutil/fetch-params.sh
./zcutil/build.sh -j$(expr $(nproc) - 1)
#This can take some time.
```

### OSX

Ensure you have brew and Command Line Tools installed.

```	
# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# Install Xcode, opens a pop-up window to install CLT without installing the entire Xcode package
xcode-select --install 
# Update brew and install dependencies
brew update
brew upgrade
brew tap discoteq/discoteq; brew install flock
brew install autoconf autogen automake
brew update && brew install gcc@8
brew install binutils
brew install protobuf
brew install coreutils
brew install wget
# Clone the Marmara repo
git clone https://github.com/marmarachain/marmara --branch master --single-branch
cd marmara
./zcutil/fetch-params.sh
./zcutil/build-mac.sh -j$(expr $(sysctl -n hw.ncpu) - 1)
# This can take some time.
```

### Windows

Use a debian cross-compilation setup with mingw for windows and run:

Note: For Ubuntu 20.04, please change the python-zmq library to python3-zmq below.

```	
sudo apt-get install build-essential pkg-config libc6-dev m4 g++-multilib autoconf libtool ncurses-dev unzip git python python-zmq zlib1g-dev wget libcurl4-gnutls-dev bsdmainutils automake curl libsodium-dev cmake mingw-w64

# install rust
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
rustup target add x86_64-pc-windows-gnu
sudo update-alternatives --config x86_64-w64-mingw32-gcc
# (configure to use POSIX variant)
sudo update-alternatives --config x86_64-w64-mingw32-g++
# (configure to use POSIX variant)

git clone https://github.com/marmarachain/marmara --branch master --single-branch
cd marmara
./zcutil/fetch-params.sh
./zcutil/build-win.sh -j$(nproc)
```

### Contact
- B. Gültekin Çetiner [![twitter](https://img.shields.io/twitter/follow/drcetiner?style=social)](https://twitter.com/drcetiner )

License
---
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
