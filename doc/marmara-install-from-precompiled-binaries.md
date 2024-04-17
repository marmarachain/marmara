## Installing Marmara Credit Loops from Pre-compiled Binaries

One can download and unzip our pre-compiled binaries. This is the simplest method and hence requires no compiling procedure.

## Linux 

Verify that your system is up to date.

```	
sudo apt-get update
sudo apt-get upgrade -y
```

#### Install the dependency packages

```	
sudo apt-get install libgomp1
```
#### Downloading Assets from Releases
Go to [Releases](https://github.com/marmarachain/marmara/releases) and download Marmara linux binaries .zip from Assets and follow the instructions given below.

> Make sure to follow the following instructions on the downloaded directory or any other directory where you moved or copied. 

```sh
sudo apt install unzip
unzip MCL-linux.zip
sudo chmod +x marmarad marmara-cli fetch-params.sh
./fetch-params.sh
```
#### Start and Run the Marmara Chain

To start the chain, open the command prompt and execute the following sets of commands:
```
./marmarad -addnode=5.189.149.242 -addnode=161.97.146.150 -addnode=149.202.158.145
```
To stop the chain:
```
./marmara-cli stop
```

#### Backup Your Wallet

Backing up the `wallet.dat` file is very essential as it holds the assets of one.
On a Linux machine, the file could be found in: `~/.komodo/MCL/wallet.dat`

One method to backup this file is to archive a copy of the file.

```bash
#Copy the wallet.dat file
cp -av ~/.komodo/MCL/wallet.dat ~/wallet.dat

#Rename the wallet.dat file
mv ~/wallet.dat ~/2020-08-09-wallet_backup.dat

# Make an archieve of the wallet.dat file
tar -czvf ~/2020-08-09-wallet_backup.dat.tgz ~/2020-08-09-wallet_backup.dat

# Move the final file to a secure location
```

### Enabling UFW
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

## MacOS

Issue the following command in a terminal to install the command line tools:

```
xcode-select –-install
```

Download the .zip file from Releases page under Assets [here](https://github.com/marmarachain/marmara/releases/) to your macOS machine and extract the files. Change directory to the location of komodod & komodo-cli on the terminal. 

Run the following command:  

```sh
./fetch-params.sh
```

#### Start and Run the Marmara Chain

To start the chain, open the command prompt and execute the following sets of commands:
```
./marmarad -addnode=5.189.149.242 -addnode=161.97.146.150 -addnode=149.202.158.145
```
To stop the chain:
```
./marmara-cli stop
```

#### Backup Your Wallet

Backing up your wallet.dat file is **very critical**. One method to backup this file is to archive a copy of the file.

On MacOS, the wallet.dat file is located here: ```~/Library/Application\ Support/Komodo/wallet.dat```


## Windows

#### Downloading Files from Releases

Download the .zip file from Releases page under Assets [here](https://github.com/marmarachain/marmara/releases/) to your Windows computer and extract&place the files (komodod.exe & komodo-cli.exe) in a new folder on the Desktop called ```MCL``` or any other location you prefer (remember the location and use that). 

For this guide, we are using ```MCL``` directory on Desktop.

#### Create the Directory for the Zcash Parameters
Open the command line prompt and execute the following command:

```
mkdir “%HOMEPATH%\AppData\Roaming\ZcashParams”
```

Download following files and move them into the newly created directory i.e. MCL.

- [sprout-proving.key](https://komodoplatform.com/downloads/sprout-proving.key)

- [sprout-verifying.key](https://z.cash/downloads/sprout-verifying.key)

- [sapling-spend.params](https://z.cash/downloads/sapling-spend.params)

- [sapling-output.params](https://z.cash/downloads/sapling-output.params)

- [sprout-groth16.params](https://z.cash/downloads/sprout-groth16.params)


#### Start and Run the Marmara Chain

To start the chain, open the command prompt and execute the following sets of commands:
```
cd Desktop\MCL\
marmarad.exe -addnode=5.189.149.242 -addnode=161.97.146.150 -addnode=149.202.158.145
```
To stop the chain:
```
cd Desktop\MCL\
marmara-cli.exe stop
```

#### Backup Wallet

Backing up the **wallet.dat** file is **very critical**. One method to backup this file is to create a copy and archive it.

On Windows machine, the file is located below: 
```
%HOMEPATH%\AppData\Roaming\Komodo\MCL\wallet.dat
```

## Making Marmara Credit Loops
Start the chain as with pubkey as instructed in the usage guideline [here](https://github.com/marmarachain/marmara/doc/getting-Started-with-marmara.md)
