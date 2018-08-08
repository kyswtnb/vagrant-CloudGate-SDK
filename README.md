## ゼロアグリのCloudGateSDKのBuild環境をvagrantで実現する

### 環境
```sh
$ cat /etc/lsb-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=16.04
DISTRIB_CODENAME=xenial
DISTRIB_DESCRIPTION="Ubuntu 16.04.4 LTS"
$ uname -a
Linux LAPTOP-ALOBKCGQ 4.4.0-17134-Microsoft #137-Microsoft Thu Jun 14 18:46:00 PST 2018 x86_64 x86_64 x86_64 GNU/Linux
```

### build手順
1. vagrantでubuntu起動
    ```sh
    vagrant up
    vagrant.exe up
    ```
1. ubuntuへログイン
    ```sh
    ssh vagrant@192.168.33.36

      # password -> vagrant

    cd CloudGate-SDK-x86_64-v2.78.0/
    
    ./build.sh
        # pythonのbuildで一度コケるが再実行で通る。謎。。
    ```

### その他のパッケージを追加する場合
1. feedsで必要なものをインポート
    ```sh
    ssh vagrant@192.168.33.36

      # password -> vagrant

    cd CloudGate-SDK-x86_64-v2.78.0/

    # 例)
    ./scripts/feeds install nginx

    # nginxをyでインストール対象とする
    make menuconfig

    # build
    make
        ## debugは make V=99
    ```
