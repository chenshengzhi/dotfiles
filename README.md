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

## install

1. http://iterm2.com/
2. https://central.github.com/mac/latest
3. http://www.firefox.com.cn/
4. https://developer.apple.com/xcode/download/
5. https://developer.apple.com/downloads/
6. http://srf.baidu.com/input/mac.html
7. http://www.sublimetext.com/
8. http://im.qq.com/macqq/index.shtml
9. http://cidian.youdao.com/index-mac.html
10. https://itunes.apple.com/cn/app/go2shell/id445770608?mt=12
11. https://spectacleapp.com/
12. https://tokyo.kapeli.com/downloads/v3/Dash.zip
13. https://github.com/shadowsocks/ShadowsocksX-NG

```
git clone https://github.com/chenshengzhi/dotfiles.git && cd dotfiles && source install.sh && cd ..
```
