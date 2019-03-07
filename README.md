# docker-smartdns
使用
```
docker run -d -p 53:53/udp --restart=always --name smartdns ghostry/smartdns
```
如果想自定义配置,可以使用`-v /data/smartdns:/smartdns`参数
