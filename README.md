# dotfiles


## Prepare

#### DNS

```
for network in "Ethernet" "Wi-Fi"
do
	networksetup -setdnsservers $network \
	218.85.152.99 \
	218.85.157.99 \
	180.76.76.76 \
	223.5.5.5 \
	223.6.6.6 \
	207.97.227.239 \
	8.8.8.8 \
	8.8.4.4
done	
```

#### App

1. http://iterm2.com/
2. https://central.github.com/mac/latest
3. git  "install via Github Desktop.app"


## install

1. http://iterm2.com/
2. https://central.github.com/mac/latest
3. git  "install via Github Desktop.app"
4. http://www.firefox.com.cn/
5. https://developer.apple.com/xcode/download/
6. https://developer.apple.com/downloads/
7. http://srf.baidu.com/input/mac.html
8. http://www.sublimetext.com/
9. http://im.qq.com/macqq/index.shtml
10. http://cidian.youdao.com/index-mac.html
11. https://itunes.apple.com/cn/app/go2shell/id445770608?mt=12
12. https://pqrs.org/osx/karabiner/ 
13. http://macvim-dev.github.io/macvim/

```
git clone https://github.com/chenshengzhi/dotfiles.git && cd dotfiles && source install.sh && cd ..
```
