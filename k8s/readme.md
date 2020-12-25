## 使用K8S管理docker

如果想使用k8s进行管理当前创建的容器, 以下提供了一些解决方案

### 下载镜像

执行[当前脚本](./load_image.sh)

> 参考当前下载的docker-desktop版本,对应实时修改`KUBE_VERSION`的内容
> 阿里云的url  可能也要换成对应的[地址](https://cr.console.aliyun.com/cn-hangzhou/instances/mirrors?accounttraceid=7ed5e027a4f14573832262b8744cf5bafpau)

### 安装KubeCtl工具

根据你对应的k8s版本,在<a>https://github.com/kubernetes/kubernetes/tree/master/CHANGELOG</a>中选择对应的kubeCtl版本并下载

然后执行以下脚本

	$ tar zxvf kubernetes-client-darwin-amd64.tar.gz
	$ cd ./kubernetes/client/bin
	$ chmod +x kubectl && mv kubectl /usr/local/bin/kubectl

执行
>  kubectl version
可以查看当前的版本

### 启动DashBoard

> k8s 带的dashboard 不是很好用,比较难上手.如果可以的话, 还是建议安装`rancher` or `Prometheus` 来进行学习

运行脚本
	 kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v1.10.1/aio/deploy/recommended.yaml

如果执行此命令有问题，可从之前网页查看的 recommended.yaml 另存为本地来执行。

然后启动代理

	kubectl proxy
	Starting to serve on 127.0.0.1:8001

这时候,打开浏览器,访问
	http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

即说明启动成功

* 创建 Service Account 和 ClusterRoleBinding

创建user.yaml

```yml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kubernetes-dashboard

---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: admin-user
  namespace: kubernetes-dashboard
```

然后执行以下命令

	kubectl apply -f user.yaml

* 获取Bearer Token

执行命令

	kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')
 
即可以获得token用来登陆

> 以上参考自<a><https://kuboard.cn/install/install-k8s-dashboard.html#%E8%AE%BF%E9%97%AE/a>

### 将docker-compose 转换成k8s管理

* 下载kompose
* 使用kompose convert
