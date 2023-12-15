# docker-develop-env
一些开发环境的docker配置

### 目前包含的配置
|名称|容器名|
|:--|:--|
|mysql|db|
|redis|redis|
|rabbitmq|rabbitmq|
|zookeeper|zookeeper|
|mongoDB|mongo|
|nginx|nginx|
|elasticsearch|es|
|kibana|kibana|
|consul|consul|
|kafka|kafka|
|kafka-manager|kafka-manager|

### 安装方式
1. 安装docker
> mac 环境 直接安装`docker desktop`
2. sh run.sh

### 使用方式

并不是所有容器都会被用到,所以可以使用

     docker stop <容器名>

来关闭不需要的配置

如果要使用时,可以使用
    
    docker start <容器名>

开启对应配置

###  k8s管理使用
 
如果并不满足于docker-compose进行管理维护,可以使用对应的k8s进行管理维护,详细见[k8s的搭建](./k8s)
