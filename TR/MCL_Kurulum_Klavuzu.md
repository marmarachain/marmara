![MarmaraCreditLoops Logo](https://raw.githubusercontent.com/marmarachain/marmara/master/MCL-Logo.png "Marmara Credit Loops Logo")

# Marmara v.1.0.1 Kurulum

Marmara Kredi Döngüleri Zeki kontrak blokzincirini kurmanın iki yolu bulunmaktadır.
## Önderlenmiş Marmara Kredi Döngüleri Blokzincirinin Kurulumu

Marmara Kredi Döngüleri blokzincirinin önceden derlenmiş halini indirip, zip halinde olan dosyayı açıp kurulumu hızlıca tamamlayabilirisiniz.

Bunun için burada yer alan [linkten](https://github.com/marmarachain/marmara/releases) ilgili dosyalara erişim sağlayabilirsiniz.

### Linux İşletim Sistemi

Sistemin güncel olduğundan emin olunur:
```	
sudo apt-get update
sudo apt-get upgrade -y
```
Bağımlılık paketlerini asağıdaki komut ile indirin:
```
sudo apt-get install libgomp1
```
Burada verilen [linkten](https://github.com/marmarachain/marmara/releases) Marmara Linux binary dosyasını indirin. Dosyayı dilediğiniz bir alana taşıdıktan sonra aşağıda verilen komutları ilgili dizin yolunda termina üzerinden gerçekleştirin:
```
sudo apt install unzip
unzip MCL-linux.zip
sudo chmod +x komodod komodo-cli fetch-params.sh
./fetch-params.sh
```
Terminalden komodod ve komodo-cli dosyalarının bulunduğu dizine gidip Marmara Zincirini başlatın:
```
./komodod -ac_name=MCL -ac_supply=2000000 -ac_cc=2 -addnode=5.189.149.242 -addnode=161.97.146.150 -addnode=149.202.158.145 -addressindex=1 -spentindex=1 -ac_marmara=1 -ac_staked=75 -ac_reward=3000000000
```
Zinciri durdurmak için ilgili dizinde aşağıdaki komutu terminale yazınız:
```
./komodo-cli -ac_name=MCL stop
```

### Windows

[Releases](https://github.com/marmarachain/marmara/releases) sayfasında Assets altında yer alan MCL zip dosyasını Windows bilgisayarınıza indirip, zip dosyayı çıkarıp, içinde yer alan komodod.exe ve komodo-cli.exe ve diğer **bütün** dosyaları masaüstünde veya dilediğiniz yerde ```MCL``` isminde klasör oluşturup içine taşıyınız. 

Burada yer alan kurulum yönergelerinde masaüstünde oluşturulan MCL dizini kullanılmaktadır.

Öncelikle ZcashParams dosyalarını indirmek için ```fetch-params.bat``` isimli dosyaya çift tıklayarak çalıştırınız. 

Bu işlem başarı ile tamamlanırsa, ```MCL_start.bat``` dosyasına çift tıklayarak zinciri başlatınız.

Eğer ```fetch-params.bat``` dosyasını çalıştırma işlemi başarılı değilse, bu durumda aşağıda yer alan adımları takip ediniz:

İlk adım olarak komut terminal ekranı açıp ```ZcashParams``` klasörünü aşağıdaki komut ile oluşturunuz:
```
mkdir “%HOMEPATH%\AppData\Roaming\ZcashParams”
```
Aşağıda yer alan dosyaları ilgili linklerden inidirip, ```MCL``` isminde önceden masaüstünde oluşturduğunuz klasöre taşıyınız.

- [sprout-proving.key](https://z.cash/downloads/sprout-proving.key)

- [sprout-verifying.key](https://z.cash/downloads/sprout-verifying.key)

- [sapling-spend.params](https://z.cash/downloads/sapling-spend.params)

- [sapling-output.params](https://z.cash/downloads/sapling-output.params)

- [sprout-groth16.params](https://z.cash/downloads/sprout-groth16.params)

```MCL_start```.bat dosyasına çift tıklayarak zinciri başlatınız.

## Marmara Kredi Döngüleri Blokzincirinin Kaynak Kodundan Kurulumu

Marmara Kredi Döngüleri blokzinciri kaynak kodundan kurulabilir. Bu zorunlu bir işlem değildir (önceden derlenmiş hali de kullanılabilir), ancak kaynaktan derleme yöntemi kişinin en son yapılan yazılım yamalarına ve yükseltmelerine anında güncelleme yapmasına izin vermesi nedeniyle en iyi bir uygulama olarak kabul edilmektedir.
### Linux İşletim Sistemi

#### Kurulum için Gereksinimler

    Linux (Ubuntu gibi Debian tabanlı dağıtımlar)
        Ubuntu için 16.04 veya 18.04 sürümünün kullanımı önerilir

    64-bit İşlemci

    En az 2 CPU 

    Minimum 4GB Boş RAM (Önerilen 8 GB RAM'dir)

#### Başlangıç
Sistemin güncel olduğundan emin olunur:
```	
sudo apt-get update
sudo apt-get upgrade -y
```

#### Bağımlılık Paketlerinin İndirilmesi

```	
sudo apt-get install build-essential pkg-config libc6-dev m4 g++-multilib autoconf libtool ncurses-dev unzip git python zlib1g-dev wget bsdmainutils automake libboost-all-dev libssl-dev libprotobuf-dev protobuf-compiler libgtest-dev libqt4-dev libqrencode-dev libsodium-dev libdb++-dev ntp ntpdate software-properties-common curl clang libcurl4-gnutls-dev cmake clang -y
```
Bu işlem, İnternet bağlantınıza bağlı olarak biraz zaman alabilir. İşlemin arka planda çalışmasına izin veriniz.

Tamamlandığında, Marmara Kredi Döngüleri blokzinirini kurmak için aşağıdaki adımları izleyiniz.

#### Marmara Kredi Döngüleri Reposunun Klonlanması
```	
cd ~
git clone https://github.com/marmarachain/marmara komodo --branch master --single-branch
```
>8 GB RAM veya üstüne sahipseniz aşağıdaki adımları atlayarak **__Zcash Parametrelerinin Çekilmesi__** adımına geçiniz.

#### Swap(Takas) Alanının 4 GB şeklinde ayarlanması
Swap (Takas) Alanı, işletim sistemi tarafından sabit diskinizde ayrılmış olan bir bölümdür.
İşlenecek veriler ön belleğe (RAM) sığmadığı zaman bu bölüm “RAM”  gibi kullanılır ve böylelikle veri akışının ve proseslerinin devam etmesi sağlanır.  
Eğer kullanılan sistemde 4 GB'lik RAM mevcutsa, RAM boyutunun tamamen dolup, cevap verememesi durumuna karşılık bu alanın ayarlanması tavsiye edilir.

> Swap alanının olup olmadığını ``` sudo swapon --show ``` komutu ile kontrol edebilirsiniz.
Sistemde swapfile mevcut olup en az 4 GB olacak şekilde ayarlanmadıysa bu durumda öncelik olarak ```sudo swapoff /swapfile ``` komutuyla swap'ı kapatınız.

Swap alanını 4 GB şeklinde ayarlamak için aşağıdaki komutları komut satırına ekleyiniz: 
```
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile 
sudo mkswap /swapfile 
sudo swapon /swapfile
```
#### Zcash Parametrelerinin Çekilmesi
```
cd komodo
./zcutil/fetch-params.sh
./zcutil/build.sh -j$(nproc)
```
**Aşağıdaki adımlar kurulum için zorunlu olmayıp kullanıcının seçimine bırakılmıştır.**

##### Swappiness Ayarının Yapılması
Swappiness, Linux çekirdeğinin RAM içeriğini takas için ne kadar (ve ne sıklıkla) kopyaladığını tanımlayan çekirdek parametresidir. swappiness 0 ile 100 arasında bir değere sahip olabilir.
Aşağıda verilen komut, bu parametrenin değerini "10" şeklinde ayarlar. Swappiness parametresinin değeri ne kadar yüksekse, çekirdeğe işlemleri fiziksel bellekten agresif bir şekilde takas etmesini ve önbellek takas ettirmesini bildirecektir.
```
sudo sysctl vm.swappiness=10 
```
>Bu ayar, bir sonraki yeniden başlatmaya kadar geçerli olacaktır. Yeniden başlatma durumunda geçerli olmasını sağlamak amacıyla aşağıdaki komutu /etc/sysctl.conf dosyasına ekleyerek yeniden başlatımda otomatik olarak geçerli olmasını sağlayabiliriz:
>```sudo nano /etc/sysctl.conf``` vm.swappiness=10

#### UFW Ayarının Yapılması
Bu adım MCL kurulumu için zorunlu olmayıp makinanın veya sunucunun güvenliği sağlamak amacıyla kullanılabilir.

- UFW nin statüsü aşağıdaki komut ile kontrol edilir:
```
sudo ufw status
```
- Eğer UFW paketi yüklü değilse aşağıdaki komut kullanılarak indirilir:
```	
sudo apt install ufw
```
- Bağlantıların yapılmasını sağlayacak şekilde aşağıdaki komutlarla UFW etkinleştirilir:
```
echo y | sudo ufw enable
sudo ufw allow ssh
sudo ufw allow "OpenSSH"
sudo ufw allow 33824
```
# Önemli Bilgilendirme
İşbu yazılım **Komodo** üzerine, *Komodo* yazılımı da **zcash** üzerine geliştirilmiş olup sürekli olarak yoğun geliştirme çalışmaları altındadır.
**Marmara Kredi Döngüleri eksperimental olup sürekli geliştirme fazındadır.** Kendi sorumluluğunuzda kullanınız.

MCL ve Komodo Platform geliştiricileri hiçbir zaman ve hiç bir koşulda işbu yazılımın kullanımından kaynaklanan herhangi bir olası zarardan sorumlu değildir.
	
# Lisans
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
