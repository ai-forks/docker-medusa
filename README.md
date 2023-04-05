## 创建基于tor的网络

### --cpus=$(( $(cat /proc/cpuinfo| grep "processor"| wc -l) - 1 )) \

### 
```
    docker stop ivideos-node && docker rm ivideos-node
    
    docker run -itd --restart=always --net=host --cpu-shares=512 \
        -m 1G --memory-swap=1G \
        -e DOMAIN="" \
        -v /tmp/ivideos-store:/app/ivideos-store \
        -v /app/ivideos-node:/root/ivideos-node \
        --name ivideos-node mixnet/ivideos-node 

    docker run -itd --restart=always --net=host --cpu-shares=512 \
        -e DOMAIN="" \
        -v /chunks/ivideos-store:/app/ivideos-store \
        -v /app/ivideos-node:/root/ivideos-node \
        --name ivideos-node mixnet/ivideos-node 
```

 ### 环境参数说明
```
    DOMAIN 服务域名,默认为所有网站提供加速,如果设置( -e DOMAIN=www.xxx.com ), 则只为对应的网站提供加速服务
```
