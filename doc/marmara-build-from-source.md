The basic Marmara software package includes two applications.

#### marmarad

The marmarad software application is the Smart Chain daemon that powers Marmara blockchain.

#### marmara-cli

The marmara-cli software application allows a developer to execute API calls to marmarad via the command line.

#### Both are Installed Automatically

Both of these software applications are installed in the ```~/komodo/src/``` directory as a part of any of the following installation procedures.

## Building Marmara Credit Loops Smart Chain From Source

One may build Marmara Credit Loops Smart Chain from source. This is not required, however building from source is considered as the best practice in a production environment, since this allows one to instantly update to the latest patches and upgrades.

### Linux

#### Requirements

    Linux (easiest with a Debian-based distribution, such as Ubuntu)
        For Ubuntu, we recommend using the 16.04 or 18.04 releases

    64-bit Processor

    Minimum 2 CPUs

    Minimum 4GB of free RAM

#### Get Started
Verify that your system is up to date.
```	
sudo apt-get update
sudo apt-get upgrade -y
```

#### Install the dependency packages

Note: For Ubuntu 20.04, please change the python-zmq library to python3-zmq below.

```	
sudo apt-get install build-essential pkg-config libc6-dev m4 g++-multilib autoconf libtool ncurses-dev unzip git python python-zmq zlib1g-dev wget curl bsdmainutils automake cmake clang ntp ntpdate nano -y
```
This action takes some time, depending on your Internet connection. Let the process run in the background.

Once completed, follow the steps below to install Marmara Credit Loops smart chain.

#### Clone the Marmara Credit Loops Repository
```	
cd ~
git clone https://github.com/marmarachain/marmara --branch master --single-branch
```
>Skip the following steps and jump to **__Fetch the Zcash Parameters__** step if the system you are using has 8 GB or more RAM.

#### Changing swap size to 4 GB
Swap is a space on a disk which is used when the amount of physical RAM memory is full. 
If the system has 4 GB of RAM, to avoid cases of running out of RAM, swap space needs to be configured.

>Check if OS already has swap enabled using ``` sudo swapon --show ```. 
If swapfile exists and is not configured as at least 4 GB then turn off the swap before configuring it by ```sudo swapoff /swapfile ```

Execute the following commands to allocate 4 GB of RAM for the swap space. 
```
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile 
sudo mkswap /swapfile 
sudo swapon /swapfile
```
#### Fetch the Zcash Parameters
```
cd marmara
./zcutil/fetch-params.sh
./zcutil/build.sh -j$(nproc)
```
**The following steps are optional to follow.**

##### Setting up Swappiness
Swappiness is the kernel parameter that defines how much (and how often) Linux kernel copies RAM contents to swap. 
The following sets up the parameter's value as “10”. Note that the higher the value of the swappiness parameter, the more aggressively Linux's kernel will swap.
```
sudo sysctl vm.swappiness=10 
```
>This setting will persist until the next reboot. We can set this value automatically at restart by adding the line to our /etc/sysctl.conf file:
>```sudo nano /etc/sysctl.conf``` vm.swappiness=10

#### Enabling UFW
This step is not required for installing MCL but can be used for server security purposes.

- Check the status of UFW by
```
sudo ufw status
```
- UFW package can be installed by executing the following command
```	
sudo apt install ufw
```
- Activate UFW and allow connections by executing the following commands
```
echo y | sudo ufw enable
sudo ufw allow ssh
sudo ufw allow "OpenSSH"
sudo ufw allow 33824
sudo ufw allow out 33824
```

### macOS

#### Requirements

- OSX (version > 10.11)
- Minimum 4GB of free RAM (8GB+ recommended)


#### Ensure Command Line Tools are Installed

Issue the following command in a terminal.
```
xcode-select –-install
```
#### Ensure brew is Installed

We use the software brew to install dependencies. If you have the latest version of brew installed already, you may skip this step.
```
usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew install/master/install)"
```

#### Use brew to Install Dependencies

Execute each command separately
```
brew update
brew upgrade
brew tap discoteq/discoteq; brew install flock
brew install autoconf autogen automake
brew install gcc@8
brew install binutils
brew install protobuf
brew install coreutils
brew install wget
```

#### Clone the Marmara Credit Loops Repository

```
cd ~
git clone https://github.com/marmarachain/marmara --branch master --single-branch
```

#### Fetch the Zcash Parameters
```
cd marmara
./zcutil/fetch-params.sh
./zcutil/build-mac.sh -j8
```

Having completed these, launch the Marmara Chain by following the instructions in [here](https://github.com/marmarachain/marmara/doc/getting-started-with-marmara.md).

### Windows

The Windows software cannot be directly compiled on a Windows machine. 

Rather, the software must be compiled on a Linux machine (Ubuntu recommended), and the respective output .exe must then be carried to the Windows machine. 

#### Requirements
- Linux machine or Virtual Machine-based installation of Ubuntu Linux
- Linux Requirements in [here](#### Requirements).

#### Install the dependency packages

Note: For Ubuntu 20.04, please change the python-zmq library to python3-zmq below.

```
sudo apt-get install build-essential pkg-config libc6-dev m4 g++-multilib autoconf libtool ncurses-dev unzip git python python-zmq zlib1g-dev wget libcurl4-gnutls-dev bsdmainutils automake curl libsodium-dev cmake mingw-w64
```
Note: For Ubuntu 20.04, please change the python-zmq library to python3-zmq below.
#### Install Rust

```
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
rustup target add x86_64-pc-windows-gnu
```

#### Configure the compiler to use POSIX thread model

Execute the following command:
```
sudo update-alternatives --config x86_64-w64-mingw32-gcc
```

After having issued the above command, select the POSIX option as indicated below:

```
Selection    Path                                   Priority   Status
------------------------------------------------------------
  0            /usr/bin/x86_64-w64-mingw32-gcc-win32   60        auto mode
  1            /usr/bin/x86_64-w64-mingw32-gcc-posix   30        manual mode
* 2            /usr/bin/x86_64-w64-mingw32-gcc-win32   60        manual mode

Press <enter> to keep the current choice[*], or type selection number: 1
```

Issue the following command:

```
sudo update-alternatives --config x86_64-w64-mingw32-g++
```

Having executing the above command, select the POSIX option as below:
```
There are 2 choices for the alternative x86_64-w64-mingw32-g++ (providing /usr/bin/x86_64-w64-mingw32-g++).

  Selection    Path                                   Priority   Status
------------------------------------------------------------
  0            /usr/bin/x86_64-w64-mingw32-g++-win32   60        auto mode
  1            /usr/bin/x86_64-w64-mingw32-g++-posix   30        manual mode
* 2            /usr/bin/x86_64-w64-mingw32-g++-win32   60        manual mode

Press <enter> to keep the current choice[*], or type selection number: 1
```

#### Clone the Marmara Repository

```
git clone https://github.com/marmarachain/marmara --branch master --single-branch
cd marmara
```

#### Fetch the Zcash Parameters

```
./zcutil/fetch-params.sh
./zcutil/build-win.sh -j$(nproc)
```

Once this step is completed, you will find ```marmarad.exe``` & ```marmara-cli.exe``` files inside the src directory. 

Copy and move these files to the Windows machine. Continue from [here](https://github.com/marmarachain/marmara/doc/marmara-install-from-precompiled-binaries.md)
