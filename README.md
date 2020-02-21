[![Build Status](https://travis-ci.org/KomodoPlatform/komodo.svg?branch=master)](https://travis-ci.org/KomodoPlatform/komodo)
[![Issues](https://img.shields.io/github/issues-raw/komodoplatform/komodo)](https://github.com/KomodoPlatform/komodo/issues)
[![PRs](https://img.shields.io/github/issues-pr-closed/komodoplatform/komodo)](https://github.com/KomodoPlatform/komodo/pulls)
[![Commits](https://img.shields.io/github/commit-activity/y/komodoplatform/komodo)](https://github.com/KomodoPlatform/komodo/commits/dev)
[![Contributors](https://img.shields.io/github/contributors/komodoplatform/komodo)](https://github.com/KomodoPlatform/komodo/graphs/contributors)
[![Last Commit](https://img.shields.io/github/last-commit/komodoplatform/komodo)](https://github.com/KomodoPlatform/komodo/graphs/commit-activity)


[![gitstars](https://img.shields.io/github/stars/komodoplatform/komodo?style=social)](https://github.com/KomodoPlatform/komodo/stargazers)
[![twitter](https://img.shields.io/twitter/follow/marmarachain?style=social)](https://twitter.com/marmarachain)
[![discord](https://img.shields.io/discord/412898016371015680)](https://discord.gg/NzpnAA)


![MarmaraCreditLoop Logo](/marmara_coin_logo.png "Marmara Credit Loop Logo")


# Marmara v.1.0 setup

Aciklama
Gereksinimlere dikkat ediniz. aksi halde gereksinimleri karşılamayan sunucu özelliklerinde hata verebilir. Gereksinim karşılanmayan sunucularda hata ve zararlar tamamen kullanıcıya aittir.,
```
Requirements:
Min. 4 GB Free RAM
Min. 2 CPUs
OS : Ubuntu 16.04 LTS x86_64
```

#### 1. kısım - Install the dependency packages 
```	
	sudo apt-get update
	sudo apt-get upgrade -y
	sudo apt install ufw
	sudo ufw --version
	echo y | sudo ufw enable
	sudo apt-get install ssh
	sudo ufw allow "OpenSSH"
	sudo apt-get install build-essential pkg-config libc6-dev m4 g++-multilib autoconf libtool ncurses-dev unzip git python zlib1g-dev wget bsdmainutils automake libboost-all-dev libssl-dev libprotobuf-dev protobuf-compiler libgtest-dev libqt4-dev libqrencode-dev libdb++-dev ntp ntpdate software-properties-common curl clang libcurl4-gnutls-dev cmake clang -y
	sudo apt-get install libsodium-dev
```
#### 2. kısım - Install nanomsg 
```	
2. kısım
	Install nanomsg
	
	cd /tmp
	wget https://github.com/nanomsg/nanomsg/archive/1.0.0.tar.gz -O nanomsg-1.0.0.tar.gz --no-check-certificate
	tar -xzvf nanomsg-1.0.0.tar.gz
	cd nanomsg-1.0.0
	mkdir build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr
	cmake — build .
	sudo ldconfig
	
	2.1
	git clone https://github.com/nanomsg/nanomsg
	cd nanomsg
	cmake .
	make
	sudo make install
	sudo ldconfig
	
```
#### 3. kısım - Change swap size on to 4GB (Ubuntu) 
	
```
	sudo swapon --show
	free -h
	df -h
	sudo fallocate -l 4G /swapfile
	ls -lh /swapfile 
	sudo chmod 600 /swapfile 
	ls -lh /swapfile 
	sudo mkswap /swapfile 
	sudo swapon /swapfile
	sudo swapon --show 
	free -h
	sudo cp /etc/fstab /etc/fstab.bak
	echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
```

#### 4 .kısım 
```	sudo sysctl vm.swappiness=10 
	This setting will persist until the next reboot. We can set this value automatically at restart by adding the line to our /etc/sysctl.conf file:
	sudo nano /etc/sysctl.conf 
	vm.swappiness=10
	sudo ufw allow 33824
```

	
#### 5. kısım - Installing Komodo	
```
	cd 
	git clone https://github.com/marmarachain/Marmara-v.1.0 komodo --branch marmara-specific --single-branch
	cd komodo
	./zcutil/fetch-params.sh
	./zcutil/build.sh -j$(nproc)

```

### Bu sıralamadan sonra her şey normal çalışır vaziyette olacaktır. Marmara Chain sorunsuz vaziyette kullanabilirsiniz.
---
Wallet adresi ve Pubkey alıp - pubkey ile Staking mod da başlatma.

#### chain e start verelim. 

src klasorümüze girelim.

`cd ~/komodo/src`
  
#### chaine ilk startımızı verelim.

```
./komodod -ac_name=MCL -ac_supply=2000000 -ac_cc=2 -addnode=37.148.210.158 -addnode=37.148.212.36 -addressindex=1 -spentindex=1 -ac_marmara=1 -ac_staked=75 -ac_reward=3000000000 &
```

#### ardından bir wallet adresi oluşturup not alınız. 

`./komodo-cli -ac_name=MCL getnewaddress`

#### örnek wallet adresi 

`RJajZNoEcCRD5wduqt1tna5DiLqiBC23bo`

#### oluşturulan wallet adresini alttaki komuttaki "wallet-adresi" yazan kısma girip enter'a basıyoruz 

```
./komodo-cli -ac_name=MCL validateaddress "wallet-adresi"
```


#### bu şekilde çıktı alacaksınız. ve burada yazan pubkey i de not alınız. 
```
{
	": true,
	"address": "RJajZNoEcCRD5wduqt1tna5DiLqiBC23bo",
	"scriptPubKey": "76a914660a7b5c8ec61c59b80cf8f2184adf8a24bccb6b88ac",
	"segid": 52,
	"ismine": true,
	"iswatchonly": false,
	"isscript": false,
	"pubkey": "03a3f641c4679c579b20c597435e8a32d50091bfc56e28303f5eb26fb1cb1eee72",
	"iscompressed": true,
	"account": ""
}
```

 oluşturulan pubkeyi niz : 03a3f641c4679c579b20c597435e8a32d50091bfc56e28303f5eb26fb1cb1eee72

#### Chaini  durduruyoruz. 
```
./komodo-cli -ac_name=MCL stop
```
#### Sırada pubkeyimizi kullanarak chain i Mining modun da çalıştırmak. 

Aşağıki komutu kullanarak çalıştırabilirsiniz. aşağıda ki "-pubkey=pubkeyburayagirilecek"  kısma not aldığınız pubkeyi giriniz. ve alttaki komut satırını düzenledikten sonra "cd komodo/src" klasorüne girip yapıştırın.
	
```
./komodod -ac_name=MCL -ac_supply=2000000 -ac_cc=2 -addnode=37.148.210.158 -addnode=37.148.212.36 -addressindex=1 -spentindex=1 -ac_marmara=1 -ac_staked=75 -ac_reward=3000000000 -gen -genproclimit=-1 -pubkey="pubkeyburayagirilecek" &
```

#### Ve artık mining halde çalışıyor sunucumuz. 

#### mining dökümlerinize aşağıdaki kodları kullanarak ulaşabilirsiniz. 

```
./komodo-cli -ac_name=MCL getinfo
./komodo-cli -ac_name=MCL marmarainfo 0 0 0 0 pubkey (to get details)
```

#### Marmara Chaini farklı modlarda çalıştırma  seçenekleri. 

```
-genproclimit=-1 Şayet -1 (yaparsanız tüm işlemci (CPU) günü kullanır.)
-genproclimit=1  Şayet 1  (yaparsanız tek işlemci kullanır.)
-genproclimit=0  Şayet 0  (yaparsanız Staking modunda çalışır ve Aktif coini kullanarak Staking yaparsınız.)

```

#### Not : Sunucu kapanma durumunda yapılacaklar. 

```
cd /komodo/src
./komodo-cli -ac_name=MCL stop
./komodod -ac_name=MCL -ac_supply=2000000 -ac_cc=2 -addnode=37.148.210.158 -addnode=37.148.212.36 -addressindex=1 -spentindex=1 -ac_marmara=1 -ac_staked=75 -ac_reward=3000000000 -gen -genproclimit=-1 -pubkey="pubkeyburayagirilecek" &
```
---
#### MCL params.
```	
./komodo-cli -ac_name=MCL marmaracreditloop txid
./komodo-cli -ac_name=MCL marmarainfo firstheight lastheight minamount maxamount [currency issuerpk]
./komodo-cli -ac_name=MCL marmaraissue receiverpk amount currency matures approvaltxid
./komodo-cli -ac_name=MCL marmaralock amount unlockht
./komodo-cli -ac_name=MCL marmarapoolpayout perc firstheight "[[\"pubkey\":shares], ...]"
./komodo-cli -ac_name=MCL marmarareceive senderpk amount currency matures batontxid
./komodo-cli -ac_name=MCL marmarasettlement batontxid
./komodo-cli -ac_name=MCL marmaratransfer receiverpk amount currency matures approvaltxid
./komodo-cli -ac_name=MCL marmaraaddress
./komodo-cli -ac_name=MCL marmarainfo 0 0 0 0 <pubkey> //to get details
./komodo-cli -ac_name=MCL walletaddress amount
```

#### Cüzdanınızı yedekleyin

 `wallet.dat` dosyası bütün varlıklarınızın bulunduğu güvenli bir dosyadır. yedeğini almayı unutmatınız!

Linux'ta dosya burada bulunur: `~/.komodo/MCL/wallet.dat`

Bu dosyayı yedeklemenin bir yolu, dosyanın bir kopyasını arşivlemektir.

```bash
# Dosyayı kopyalayın
cp -av ~/.komodo/MCL/wallet.dat ~/wallet.dat

# Dosyayı yeniden adlandır
mv ~/wallet.dat ~/2019-05-17-wallet_backup.dat

# Arşiv yapmak için
tar -czvf ~/2019-05-17-wallet_backup.dat.tgz ~/2019-05-17-wallet_backup.dat

# Son dosyayı güvenli bir yere taşıyıp saklayınız.
```




---
---
---
---
# English

### Explanation 
Pay attention to the requirements. otherwise, it may fail in server properties that do not meet the requirements. Errors and damages on these servers are the responsibility of the user.
```
Requirements:
Min. 4 GB Free RAM
Min. 2 CPUs
OS : Ubuntu 16.04 LTS x86_64
```

#### 1. step - Install the dependency packages 
```	sudo apt-get update
	sudo apt-get upgrade -y
	sudo apt install ufw
	sudo ufw --version
	echo y | sudo ufw enable
	sudo apt-get install ssh
	sudo ufw allow "OpenSSH"
	sudo apt-get install build-essential pkg-config libc6-dev m4 g++-multilib autoconf libtool ncurses-dev unzip git python zlib1g-dev wget bsdmainutils automake libboost-all-dev libssl-dev libprotobuf-dev protobuf-compiler libgtest-dev libqt4-dev libqrencode-dev libdb++-dev ntp ntpdate software-properties-common curl clang libcurl4-gnutls-dev cmake clang -y
	sudo apt-get install libsodium-dev
```
#### 2. step - Install nanomsg 
```	
2. kısım
	Install nanomsg
	
	cd /tmp
	wget https://github.com/nanomsg/nanomsg/archive/1.0.0.tar.gz -O nanomsg-1.0.0.tar.gz --no-check-certificate
	tar -xzvf nanomsg-1.0.0.tar.gz
	cd nanomsg-1.0.0
	mkdir build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr
	cmake — build .
	sudo ldconfig
	
	2.1
	git clone https://github.com/nanomsg/nanomsg
	cd nanomsg
	cmake .
	make
	sudo make install
	sudo ldconfig
	
```
#### 3. step - Change swap size on to 4GB (Ubuntu) 
	
```
	sudo swapon --show
	free -h
	df -h
	sudo fallocate -l 4G /swapfile
	ls -lh /swapfile 
	sudo chmod 600 /swapfile 
	ls -lh /swapfile 
	sudo mkswap /swapfile 
	sudo swapon /swapfile
	sudo swapon --show 
	free -h
	sudo cp /etc/fstab /etc/fstab.bak
	echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
```

#### 4 .step 
```	sudo sysctl vm.swappiness=10 
	This setting will persist until the next reboot. We can set this value automatically at restart by adding the line to our /etc/sysctl.conf file:
	sudo nano /etc/sysctl.conf 
	vm.swappiness=10
	sudo ufw allow 33824
```

	
#### 5. step - Installing Komodo	
```
	cd 
	git clone https://github.com/marmarachain/Marmara-v.1.0 komodo --branch marmara-specific --single-branch
	cd komodo
	./zcutil/fetch-params.sh
	./zcutil/build.sh -j$(nproc)

```
*** Note: The installation process takes 20 to 45 minutes.

#### After the setup, you are ready to use MCL blockchain
---
Start at staking mode by getting wallet address and pubkey

#### Start the chain.

Go to src folder.

```
cd ~/komodo/src
```
  
#### Start the chain firstly.

```
./komodod -ac_name=MCL -ac_supply=2000000 -ac_cc=2 -addnode=37.148.210.158 -addnode=37.148.212.36 -addressindex=1 -spentindex=1 -ac_marmara=1 -ac_staked=75 -ac_reward=3000000000 -pubkey="pubkey to enter here" &
```

#### then create a wallet address and write down this wallet address. 

```
./komodo-cli -ac_name=MCL getnewaddress
```

#### Wallet address sample 
```
RJajZNoEcCRD5wduqt1tna5DiLqiBC23bo
```

#### To confirm this wallet address and then create the pubkey, Text this wallet address in quotation marks , “Enter your wallet address here” secion.
```
./komodo-cli -ac_name=MCL validateaddress "Enter your wallet address here"
```

#### you will get the output like below. and then, write down also the pubkey that written here.
```
{
	": true,
	"address": "RJajZNoEcCRD5wduqt1tna5DiLqiBC23bo",
	"scriptPubKey": "76a914660a7b5c8ec61c59b80cf8f2184adf8a24bccb6b88ac",
	"segid": 52,
	"ismine": true,
	"iswatchonly": false,
	"isscript": false,
	"pubkey": "03a3f641c4679c579b20c597435e8a32d50091bfc56e28303f5eb26fb1cb1eee72",
	"iscompressed": true,
	"account": ""
}
```

this is the your pubkey : `03a3f641c4679c579b20c597435e8a32d50091bfc56e28303f5eb26fb1cb1eee72`

#### Stop the  chain.
```
./komodo-cli -ac_name=MCL stop
```

#### next step is the runing to chain in mining mode by using your own pubkey.

You can run it by using following command. text your pubkey to the area "-pubkey="pubkey to enter here" and then, copy to all command and then, when it is at "cd komodo/src" , paste it and click "enter"
```
./komodod -ac_name=MCL -ac_supply=2000000 -ac_cc=2 -addnode=37.148.210.158 -addnode=37.148.212.36 -addressindex=1 -spentindex=1 -ac_marmara=1 -ac_staked=75 -ac_reward=3000000000 -gen -genproclimit=-1 -pubkey="pubkey to enter here" &
```

#### at the moment, our server starts to running as mining mode . 

#### you can reach your mining document by using codes below.

```
./komodo-cli -ac_name=MCL getinfo
./komodo-cli -ac_name=MCL marmarainfo 0 0 0 0 pubkey (to get details)
```

#### Options to operate the Marmara Chain in different modes are as follows;

```
-genproclimit=-1 Şayet -1 (If you make -1, all processor (cpu) use.)
-genproclimit=1  Şayet 1  (If you make 1, single processor use.)
-genproclimit=0  Şayet 0  (if you make 0, it run at Staking mode and you can do staking by using active coin.)

```

#### Not : Note: these are what to do in cases of server shutdown,  crashed, reset

```
cd /komodo/src
./komodo-cli -ac_name=MCL stop
./komodod -ac_name=MCL -ac_supply=2000000 -ac_cc=2 -addnode=37.148.210.158 -addnode=37.148.212.36 -addressindex=1 -spentindex=1 -ac_marmara=1 -ac_staked=75 -ac_reward=3000000000 -gen -genproclimit=-1 -pubkey="pubkey to enter here" &
```
---
#### MCL params.
```	
./komodo-cli -ac_name=MCL marmaracreditloop txid
./komodo-cli -ac_name=MCL marmarainfo firstheight lastheight minamount maxamount [currency issuerpk]
./komodo-cli -ac_name=MCL marmaraissue receiverpk amount currency matures approvaltxid
./komodo-cli -ac_name=MCL marmaralock amount unlockht
./komodo-cli -ac_name=MCL marmarapoolpayout perc firstheight "[[\"pubkey\":shares], ...]"
./komodo-cli -ac_name=MCL marmarareceive senderpk amount currency matures batontxid
./komodo-cli -ac_name=MCL marmarasettlement batontxid
./komodo-cli -ac_name=MCL marmaratransfer receiverpk amount currency matures approvaltxid
./komodo-cli -ac_name=MCL marmaraaddress
./komodo-cli -ac_name=MCL marmarainfo 0 0 0 0 <pubkey> //to get details
./komodo-cli -ac_name=MCL walletaddress amount
```
#### Backup your wallet

We can not stress enough the importance of backing up your `wallet.dat` file.

On Linux, the file is located here: `~/.komodo/MCL/wallet.dat`

One method to backup this file is to archive a copy of the file.

```bash
# Copy the file
cp -av ~/.komodo/MCL/wallet.dat ~/wallet.dat

# Rename file
mv ~/wallet.dat ~/2019-05-17-wallet_backup.dat

# To make archive
tar -czvf ~/2019-05-17-wallet_backup.dat.tgz ~/2019-05-17-wallet_backup.dat

# Move the final file to a secure location
```

#### Now, You are ready to participate in MCL credit loops.

You can reach Marmara Credit Loop guide here.

https://github.com/marmarachain/Marmara-Versiyon-1.0-setup/issues/1


### contact :  
B. Gültekin Çetiner http://twitter.com/drcetiner & ~Paro, (c) 2019  


### Thanks for translation :  
Betül Zengin  
https://tr.linkedin.com/in/bet%C3%BCl-zengin-6839b816a

---
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
