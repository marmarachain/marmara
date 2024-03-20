## How to get started with Marmara?

The basic Komodo software package includes two applications.

#### komodod

The komodod software application is the Smart Chain daemon that powers all Komodo blockchains.
#### komodo-cli

The komodo-cli software application allows a developer to execute API calls to komodod via the command line.

## MacOS

Find the directory where ```komodod``` and ```komodo-cli``` are located. Open the command prompt and change to that directory. 

### Using komodo-cli and getinfo

To see general information about MCL Smart chain, execute the ```getinfo``` command below:

```
./komodo-cli -ac_name=MCL getinfo
```

When the returned properties of ```blocks``` and ```longestchain``` are equal to each other, the daemon is finished syncing with the network.

One can interact with the MARMARA blockchain in MacOS by issuing the MARMARA commands as in [Linux OS](https://github.com/marmarachain/marmara/wiki/Getting-Started-with-Marmara#linux).


## Windows

Find the directory where ```komodod.exe``` and ```komodo-cli.exe``` are located. Open the command prompt and change to that directory. 

For instance, given that the respective files are located in Desktop under MCL folder; the command should be like below:
```
cd Desktop\MCL\
```

### Using komodo-cli and getinfo

An example is given for ```getinfo``` command below:

```
komodo-cli -ac_name=MCL getinfo
```

## Linux

If you have downloaded and build MCL from source then you can run the commands under ```cd komodo/src``` directory. According to your configuration, ```komodod``` and ```komodo-cli```  may be under different directories. Hence, find where they are and change directory accordingly.

Launch the Marmara Chain with the following parameters:
```
./komodod -ac_name=MCL -ac_supply=2000000 -ac_cc=2 -addnode=5.189.149.242 -addnode=161.97.146.150 -addnode=149.202.158.145 -addressindex=1 -spentindex=1 -ac_marmara=1 -ac_staked=75 -ac_reward=3000000000 &
```
Wait until it connects and synchronizes. You may check if the node synchronized to the chain by executing the following: 
```
./komodo-cli -ac_name=MCL getinfo
```

## _Indexing (Optional step for fastening up the process of downloading all the blocks)_**

Newcomers need to wait for all the blocks to be downloaded to their machine. To fasten up this process, [bootstrap](https://eu.bootstrap.dexstats.info/MCL-bootstrap.tar.gz) may be downloaded and used. 

Stop the Marmara blockchain by executing the following command:
<details>
    <summary> Linux: </summary>
    
```	
./komodo-cli -ac_name=MCL stop
```
</details>

<details>
    <summary> Windows: </summary>
    
```	
komodo-cli.exe -ac_name=MCL stop
```
</details>


To install bootstrap from the command line, execute the following command:
<details>
    <summary> Linux: </summary>
    
```
wget https://eu.bootstrap.dexstats.info/MCL-bootstrap.tar.gz
```
Now, in the following command, tar will extract the bootstrap contents in a specific directory as shown below:

```
tar -xvf MCL-bootstrap.tar.gz -C .komodo/MCL
```
</details>

Now, relaunch the Marmara Chain by using the following command:

<details>
    <summary> Linux: </summary>
    
```
./komodod -ac_name=MCL -ac_supply=2000000 -ac_cc=2 -addnode=5.189.149.242 -addnode=161.97.146.150 -addnode=149.202.158.145 -addressindex=1 -spentindex=1 -ac_marmara=1 -ac_staked=75 -ac_reward=3000000000 &
```
</details>

<details>
    <summary> Windows: </summary>
    
```
komodod.exe -ac_name=MCL -ac_supply=2000000 -ac_cc=2 -addnode=5.189.149.242 -addnode=161.97.146.150 -addnode=149.202.158.145 -addressindex=1 -spentindex=1 -ac_marmara=1 -ac_staked=75 -ac_reward=3000000000 &
```
</details> 

** Using Bootstrap is not a recommended approach to download the blocks since the bootstrap file may be distorted. The recommended approach is to index the blockchain from the start.**

## Creating A Pubkey and Launching MCL with pubkey

To use Marmara Credit Loops, a user must have a **pubkey** and launch the chain with a **pubkey**. Otherwise, any mining or staking in the smart chain would be **in vain**. Since all mined or staked coins will also be sent to this address. 

In order to get a pubkey, launch the Marmara Chain with the normal launch parameters and execute the [getnewaddress](https://developers.komodoplatform.com/basic-docs/smart-chains/smart-chain-api/wallet.html#getnewaddress) API command:

<details>
    <summary> Linux: </summary>
    
```	
./komodo-cli -ac_name=MCL getnewaddress
```
</details>

<details>
    <summary> Windows: </summary>
    
```	
komodo-cli.exe -ac_name=MCL getnewaddress
```
</details> 

<details>
    <summary> getnewaddress command will in turn return a new address:  </summary>

```	
DO_NOT_USE_THIS_ADDRESSgg5jonaes1J5L786
```
</details>

Now, execute the [validateaddress](https://developers.komodoplatform.com/basic-docs/smart-chains/smart-chain-api/util.html#validateaddress) command.
<details>
    <summary> Linux: </summary>
    
```	
./komodo-cli -ac_name=MCL validateaddress DO_NOT_USE_THIS_ADDRESSgg5jonaes1J5L786
```
</details>

<details>
    <summary> Windows: </summary>
    
```	
komodo-cli.exe -ac_name=MCL validateaddress DO_NOT_USE_THIS_ADDRESSgg5jonaes1J5L786
```
</details>

<details>
    <summary> This will return a json object with many properties. In the properties one can see: </summary>
    
```	
"pubkey": "DO_NOT_USE_THIS_ADDRESS019n79b0921a1be6d3ca6f9e8a050mar17eb845fe46b9d756"
```
</details> 

This will be your MCL pubkey, make sure to note it. You must now indicate it to the daemon. In order do this, first **stop** the daemon using the following command:

<details>
    <summary> Linux: </summary>
    
```	
./komodo-cli -ac_name=MCL stop
```
</details> 

<details>
    <summary> Windows: </summary>
    
```	
komodo-cli.exe -ac_name=MCL stop
```
</details>

### Launching MCL with pubkey

Relaunch your daemon using the required parameters, and make sure to include your pubkey as an additional parameter. For example:

<details>
    <summary> Linux: </summary>
    
```	
./komodod -ac_name=MCL -ac_supply=2000000 -ac_cc=2 -addnode=5.189.149.242 -addnode=161.97.146.150 -addnode=149.202.158.145 -addressindex=1 -spentindex=1 -ac_marmara=1 -ac_staked=75 -ac_reward=3000000000 -gen -genproclimit=1 -pubkey=DO_NOT_USE_THIS_ADDRESS019n79b0921a1be6d3ca6f9e8a050mar17eb845fe46b9d756 &
```
</details>

<details>
    <summary> Windows: </summary>
    
```	
komodod.exe -ac_name=MCL -ac_supply=2000000 -ac_cc=2 -addnode=5.189.149.242 -addnode=161.97.146.150 -addnode=149.202.158.145 -addressindex=1 -spentindex=1 -ac_marmara=1 -ac_staked=75 -ac_reward=3000000000 -gen -genproclimit=1 -pubkey=DO_NOT_USE_THIS_ADDRESS019n79b0921a1be6d3ca6f9e8a050mar17eb845fe46b9d756 &
```
</details>


>```-genproclimit``` sets the number of threads to be used for mining. 

>In the command above, if the parameter ```-genproclimit``` is set to 1 such as ```-gen -genproclimit=1``` launches the Marmara Chain with single (1) CPU. Note that you can set this to any number of cores such as 3. 

>In the command above, if the parameter ```-genproclimit``` is set to -1 such as ```-gen -genproclimit=-1``` launches the Marmara Chain with the whole CPU.

>In the command above, if the parameter ```-genproclimit``` is set to 0 such as ```-gen -genproclimit=0``` launches the Marmara Chain with Staking mode on and stakes on the Activated coin.  

## dumpprivkey

The `dumpprivkey` method reveals the private key corresponding to the indicated address.
The command for this is given below for demo purposes.

<details>
    <summary> Linux: </summary>
    
```
./komodo-cli -ac_name=MCL dumpprivkey "PWqwYaWNEVT7V9SdfFHARWnoB7vcpSfdvs"
```
</details>

<details>
    <summary> Windows: </summary>
    
```
komodo-cli.exe -ac_name=MCL dumpprivkey "PWqwYaWNEVT7V9SdfFHARWnoB7vcpSfdvs"
```
</details>

The response of the command gives the private address as in the example below:
```
DONOTUSETHISxxxxxxxxxxxxxxxxx7KkCmRnnSg7iXvRUqhYoxC9Y
```

## importprivkey

The `importprivkey` method adds a private key (as returned by dumpprivkey) to your wallet. The command may take several arguments as described in [here](https://developers.komodoplatform.com/basic-docs/smart-chains/smart-chain-api/wallet.html#importprivkey).
The simplest form of command for this is given below for demo purposes.

<details>
    <summary> Linux: </summary>
    
```
./komodo-cli -ac_name=MCL importprivkey "DONOTUSETHISxxxxxxxxxxxxxxxxx7KkCmRnnSg7iXvRUqhYoxC9Y"
```
</details>

<details>
    <summary> Windows: </summary>
    
```
komodo-cli.exe -ac_name=MCL importprivkey "DONOTUSETHISxxxxxxxxxxxxxxxxx7KkCmRnnSg7iXvRUqhYoxC9Y"
```
</details>

The response of the command gives the wallet address as in the demo response below:
```
R9z796AehK5b6NCPeVkGUHSpJnawerf8oP
```
Now, the wallet address can be validated through ```validateaddress``` to get the MCL pubkey:

<details>
    <summary> Linux: </summary>
    
```
./komodo-cli -ac_name=MCL validateaddress R9z796AehK5b6NCPeVkGUHSpJnawerf8oP
``` 
</details>

<details>
    <summary> Windows: </summary>
    
```
komodo-cli.exe -ac_name=MCL validateaddress R9z796AehK5b6NCPeVkGUHSpJnawerf8oP
``` 
</details>

After getting the respective MCL pubkey from the response of the command above, relaunch the Marmara Chain with that pubkey as in [here](https://github.com/marmarachain/marmara/wiki/Getting-Started-with-Marmara#launching-mcl-with-pubkey) .  

## Creating a Wallet Address from One's own Words in Marmara Blockchain

For Linux OS; as previously explained, one can make use of the command `./komodo-cli -ac_name=MCL getnewaddress` in order to get a wallet address and then use the command `./komodo-cli -ac_name=MCL validateaddress "Rwalletno"` to get the respective Privkey.

However, the `Privkey` received in this way consists of a hard to remember combination of letters and number. Note that keeping this privkey safe and secure and reachable only by you is very important and essential way to reach your assets. Hence, one can generate a privkey from his/her own set of words and keep a record of these words to generate the respective privkey whenerever needed.

For this purpose, create a set of 12 seed words that have **no special characters** in them. For instance: `"can create your own keywords and generate privkey from these whenever needed"`.

Then use the following command to get the respective privkey generated:

<details>
    <summary> Linux: </summary>
    
```
./komodo-cli -ac_name=MCL convertpassphrase "can create your own keywords and generate privkey from these whenever needed"
```
</details>

<details>
    <summary> Windows: </summary>
    
```
komodo-cli.exe -ac_name=MCL convertpassphrase "can create your own keywords and generate privkey from these whenever needed"
```
</details>
 
The command in turn returns the following JSON Object:
```
{
  "agamapassphrase": "can create your own keywords and generate privkey from these whenever needed",
  "address": "RCna416S62uNVAKMwRuFtmRH2X3xJuTidD",
  "pubkey": "03a3c416d3bafe44448dcb3a56e5dd13db5cc3e6992051a61a2f5675b4796c0d7a",
  "privkey": "9005f5b2593ab3e662e1330ceca848d62fb2021165c6484ac7037cb4efc5317e",
  "wif": "UtqWJyhXjJWYigKyKCm5ML96LvSZFDfZrT2HYXAdGs8byZ3uCMzy"
}
```
Later, one can use `importprivkey` method to add the respective private key to the wallet address:
<details>
    <summary> Linux: </summary>
    
```
./komodo-cli -ac_name=MCL importprivkey "UtqWJyhXjJWYigKyKCm5ML96LvSZFDfZrT2HYXAdGs8byZ3uCMzy"
```
</details>

<details>
    <summary> Windows: </summary>
    
```
komodo-cli.exe -ac_name=MCL importprivkey "UtqWJyhXjJWYigKyKCm5ML96LvSZFDfZrT2HYXAdGs8byZ3uCMzy"
```
</details>

Now, the owner of the assets needs to keep a record of the keyword combination safely to generate the respective privkey whenever needed.
**Remember that private keys should always be kept secret and so are the keywords!**

## Taking Backup of Wallet

Backing up the `wallet.dat` file is very essential as it holds the assets of one.

### Linux
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

## Checking the Staking/Mining mode of your node in Marmara Chain

The following command helps to check the mode of the node:
<details>
    <summary> Linux: </summary>
    
```	 
./komodo-cli -ac_name=MCL getgenerate
```
</details>

<details>
    <summary> Windows: </summary>
    
```	 
komodo-cli.exe -ac_name=MCL getgenerate
```
</details>

Once the command given above is executed, the following JSON object gets returned:
```	
{
  "staking": false,
  "generate": true,
  "numthreads": 1
}
```
From above, it can be seen that the node is in the **mining** node.
>```"staking": false``` means that staking is off.
> ```"generate": true``` means that mining is active.
>```"numthreads": 1``` refers to the number of cores used for mining. In this case, this parameter was set to one earlier.
>
To change mode of the node to **staking**, execute the command below:

<details>
    <summary> Linux: </summary>
    
```	   
 ./komodo-cli -ac_name=MCL setgenerate true 0
```
</details>

<details>
    <summary> Windows: </summary>
    
```	   
komodo-cli.exe -ac_name=MCL setgenerate true 0
```
</details>

Now checking the status of the node:

<details>
    <summary> Linux: </summary>
    
```
 ./komodo-cli -ac_name=MCL getgenerate
```
</details>
<details>
    <summary> Windows: </summary>
    
```
komodo-cli.exe -ac_name=MCL getgenerate
```
</details>

This command returns a JSON object:
```
{
  "staking": true,
  "generate": false,
  "numthreads": 0
}
```
> Note that ```"staking": true``` _**will not be of use**_ if you have no activated coins!

## Sending Coins to an Address
One may directly send a payment to a given address by issuing the following command. The payment is made based on the **Normal Amount** available on the respective wallet.
The amount is rounded to the nearest 0.00000001. A transaction fee is deducted for the transaction being made from one's Normal Amount.

<details>
    <summary> Linux: </summary>
    
```
./komodo-cli -ac_name=MCL sendtoaddress "MCL_address" amount
```
</details>

<details>
    <summary> Windows: </summary>
    
```
komodo-cli.exe -ac_name=MCL sendtoaddress "MCL_address" amount
```
</details>

> **Note:** This command directly sends payment to the specified address and should be used carefully. As, the payment sent through this method cannot be redeemed later. 


## Reaching Details about Node and Wallet in Marmara Chain
The following commands are useful for getting details about your node and wallet.
- ```getinfo```
<details>
    <summary> Linux: </summary>
    
```
./komodo-cli -ac_name=MCL getinfo
```
</details>
<details>
    <summary> Windows: </summary>
    
```
komodo-cli.exe -ac_name=MCL getinfo
```
</details>

<details>
    <summary> A typical result is given below. Note that the <b>synced status</b> is false: </summary>

```
{
  "version": 3000300,
  "protocolversion": 170009,
  "KMDversion": "0.5.3",
  "synced": false,
  "notarized": 0,
  "prevMoMheight": 0,
  "notarizedhash": "0000000000000000000000000000000000000000000000000000000000000000",
  "notarizedtxid": "0000000000000000000000000000000000000000000000000000000000000000",
  "notarizedtxid_height": "mempool",
  "KMDnotarized_height": 0,
  "notarized_confirms": 0,
  "walletversion": 60000,
  "balance": 0.00000000,
  "blocks": 72200,
  "longestchain": 586375,
  "tiptime": 1583613252,
  "difficulty": 38227.25456170298,
  "keypoololdest": 1614160564,
  "keypoolsize": 101,
  "paytxfee": 0.00000000,
  "sapling": 61,
  "timeoffset": 0,
  "connections": 16,
  "proxy": "",
  "testnet": false,
  "relayfee": 0.00000100,
  "errors": "",
  "CCid": 2,
  "name": "MCL",
  "p2pport": 33824,
  "rpcport": 33825,
  "magic": -1687041972,
  "premine": 2000000,
  "reward": "3000000000",
  "halving": "0",
  "decay": "0",
  "endsubsidy": "0",
  "notarypay": "0",
  "staked": 75
}
```
</details>

```getinfo``` command returns important details such as the version of MARMARA through ```"version"```; synchronization status of your node through ```synced``` (this parameter's value is true if the parameters "blocks" and "longestchain" are equal ); difficulty of the chain through ```"difficulty"```; number of nearest connected nodes to the chain through ```"connections"```; the pubkey with which you are connected to the chain through ```"pubkey":```

- ```getpeerinfo``` command returns detailed information on nearest connected nodes to the chain around your node.

<details>
    <summary> Linux: </summary>
    
```
./komodo-cli -ac_name=MCL getpeerinfo  
```
</details>
<details>
    <summary> Windows: </summary>
    
```
komodo-cli.exe -ac_name=MCL getpeerinfo  
```
</details>

- ```marmarainfo```

<details>
    <summary> Linux: </summary>
    
```
./komodo-cli -ac_name=MCL marmarainfo 0 0 0 0 pubkey
```
</details>
<details>
    <summary> Windows: </summary>
    
```
komodo-cli.exe -ac_name=MCL marmarainfo 0 0 0 0 pubkey
```
</details>

```marmarainfo``` command returns important details such as the normal amount in the pubkey through ```"myPubkeyNormalAmount"```; the activated amount through  ```"myActivatedAmount"```; the details of credit loops made through ```"Loops"```; the total amount locked in credit loops through ```"TotalLockedInLoop"```; the number of credit loops closed through ```"numclosed"```; and the details of credit loops closed through ```"closed"```.

## Activating and Deactivating Coins

- ```marmaralock``` is used to activate the coins. Active coins are needed for staking and if there are none then even if the staking mode is on, no blocks would be found through staking. The entire command is given below and the **amount** is to be replaced by the amount of coins such as 1000.
<details>
    <summary> Linux: </summary>
    
```  
./komodo-cli -ac_name=MCL marmaralock amount
```
</details>
<details>
    <summary> Windows: </summary>
    
```  
komodo-cli.exe -ac_name=MCL marmaralock amount
```
</details> 

This command in turn returns a JSON object with the result of the operation and the hex created for it. Note that the _**"hex"**_ given below is for demonstration purposes.
```
{
  "result": "success",
  "hex": "0400008085202f89020039b219200ae4b5c83d77bffce7a8af054d6fb..........e9181f6aac3e1beb1e260e9a1f49ed24e6ac00000000edeb04000000000000000000000000"
}
```
Now, in order to confirm this transaction, copy the hex returned through the JSON object and validate it through the ```sendrawtrasaction``` command given below:
<details>
    <summary> Linux: </summary>
    
```  
./komodo-cli -ac_name=MCL sendrawtransaction 0400008085202f89020039b219200ae4b5c83d77bffce7a8af054d6fb..........e9181f6aac3e1beb1e260e9a1f49ed24e6ac00000000edeb04000000000000000000000000
```
</details>
<details>
    <summary> Windows: </summary>
    
```  
komodo-cli.exe -ac_name=MCL sendrawtransaction 0400008085202f89020039b219200ae4b5c83d77bffce7a8af054d6fb..........e9181f6aac3e1beb1e260e9a1f49ed24e6ac00000000edeb04000000000000000000000000
```
</details> 

If the above command gets successfully executed in the blockchain, it gives out a transaction id in response. One may check if this transaction is verified by searching the respective id in the [Marmara Explorer site](http://explorer.marmara.io).
To see the activated coins, use ```marmarainfo``` command provided earlier and search for the value across the ```"myActivatedAmount"``` parameter. Note that the raw transactions are collected in the mempool and a few blocks may be needed to found to see the transaction recorded on the block.


- ```marmaraunlock``` is used deactivate the coins i.e. turn them into normal amount. Normal Amount is utilized for sending payments directly to an address through```sendtoaddress``` command explained earlier. The **amount** is to be replaced by the amount of coins to be deactivated such as 500.   

<details>
    <summary> Linux: </summary>
    
```  
./komodo-cli -ac_name=MCL marmaraunlock amount
```
</details> 
<details>
    <summary> Windows: </summary>
    
```  
komodo-cli.exe -ac_name=MCL marmaraunlock amount
```
</details>

In the same way explained earlier, this transaction needs to be validated through the ```sendrawtrasaction``` command given above. For this purpose, copy the hex returned by ```marmaraunlock``` command and use it with ```sendrawtrasaction``` command.
  
- ```listaddressgroupings``` is used to list the pairs of wallet addresses and respective normal amounts in them. The usage is given in the command below.
<details>
    <summary> Linux: </summary>
    
```
./komodo-cli -ac_name=MCL listaddressgroupings
```
</details>
<details>
    <summary> Windows: </summary>
    
```
komodo-cli.exe -ac_name=MCL listaddressgroupings
```
</details>


## Marmaraamountstat

This command is used to get all the activated, normal and locked in loop amount of the Marmara blockchain irrespective of the owner.If the begin_height and end_height inputs are set to zero(0), it gets the entire set of data from blocks.

<details>
    <summary> Linux: </summary>
    
```
./komodo-cli -ac_name=MCL marmaraamountstat begin_height end_height
```
</details>

<details>
    <summary> Windows: </summary>
    
```
komodo-cli.exe -ac_name=MCL marmaraamountstat begin_height end_height
```
</details>

Example for Linux OS:

```
./komodo-cli -ac_name=MCL marmaraamountstat 50000 60000
```

<details>
<summary> Sample Result:</summary>

```
{
  "result": "success",
  "BeginHeight": 50000,
  "EndHeight": 60000,
  "TotalNormals": 166854.85464948,
  "TotalPayToScriptHash": 0.00000000,
  "TotalActivated": 582681.11953150,
  "TotalLockedInLoops": 237510.00000000,
  "TotalUnknownCC": 0.02820000,
  "SpentNormals": 161377.88109325,
  "SpentPayToScriptHash": 0.00000000,
  "SpentActivated": 382128.12128773,
  "SpentLockedInLoops": 143510.00000000,
  "SpentUnknownCC": 0.00000000
}
```
</details>


## help

This command is used to get all the methods related to the Marmara smart chain. 

<details>
    <summary> Linux: </summary>
    
```
./komodo-cli -ac_name=MCL help
```
</details>

<details>
    <summary> Windows: </summary>
    
```
komodo-cli.exe -ac_name=MCL help
```
</details>
One can also check out a specific method's parameters by issuing the following command with the method name mentioned:
For example:
<details>
    <summary> Linux: </summary>
    
```
./komodo-cli -ac_name=MCL help getinfo
```
</details>

<details>
    <summary> Windows: </summary>
    
```
komodo-cli.exe -ac_name=MCL marmaraamountstat 
```
</details>

# References
---
For more detailed information on Komodo Antara Framework and its details, please refer to its extended [developer documentation](https://developers.komodoplatform.com/).
