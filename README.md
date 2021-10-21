# 阿里云函数计算FC模板

## 简介

阿里云函数计算FC支持Docker部署，使我们可以在不修改源代码的情况下使服务Serverless化

本仓库是一个Github Action自动构建Docker镜像并推送到阿里云容器镜像服务的模板

配置完成后你需要做的只有：使用任何语言、框架写好代码，推送到`master`分支

构建、部署全部自动完成！

本仓库部署后的示例：[https://fc.skyone.host/hello](https://fc.skyone.host/hello)

## 使用方法

### 第一步：

fork一份本仓库

![fork本仓库](https://i.w3tt.com/2021/10/21/5EBTp.png)

正确配置`secrets`

![配置secrets](https://i.w3tt.com/2021/10/21/5ETvU.png)

需要配置以下环境变量：

* DOCKER_USERNAME

    阿里云的完整用户名

* DOCKER_PASSWORD

    阿里云镜像仓库密码，在[这里](https://cr.console.aliyun.com)申请，注意访问凭证选择固定密码

* DOCKER_REGISTRY

    阿里云镜像仓库位置，例如杭州：

    `registry.cn-hangzhou.aliyuncs.com/命名空间/仓库名`
    
* DOCKER_IMAGE_TAG

    容器标签，例如：

    `registry.cn-hangzhou.aliyuncs.com/xxx/xxx:latest`

### 第二步：

前往阿里云创建镜像仓库，代码源选择你fork的仓库

配置阿里云函数计算FC，创建服务和函数，并选择对应的阿里云镜像仓库

### 第三步：

克隆仓库到本地

```shell
git clone git@github.com:your_name/your_repo.git
```

如果你开发过Node.js，接下来就不用我说了，如果你使用其他语言，请删除`src`、`package.json`、`package-lock.json`，然后开始开发吧！

### 最后一步

修改`Dockerfile`，这里我准备的是node.js的环境，使用node.js的话就只需要修改`npm start`命令即可，其他环境请自行修改。

**注意！** 阿里云函数计算FC默认监听容器的9000端口，所有不管你使用什么语言、什么框架，最终都需要监听9000端口！
