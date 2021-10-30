# Docker Notes

两个网站：

1. docker hub: https://hub.docker.com/
2. play with docker: https://www.docker.com/play-with-docker

what Docker is ?

现实中我们会遇到这样一个问题，部署了一个项目，这个项目在本地可以运行，但是不能
部署到其他服务器上。其中可能的原因有：

- 其他服务器缺少文件
- 其他服务器运行的依赖软件，版本不一样
- 其他服务器上，系统的环境变量不一样

有了Docker之后，我们可以将这个软件的所有依赖都打包，然后在另一个机器上开箱即用
, 而不会出现其他问题.Docker 的好处还有，当我们在自己的机器上使用docker运行别人
的打包程序时，docker会在一个隔离的环境中进行下载，意味着我们可以同时拥有不同版
本的软件，而且不相互影响, 并且可以很容易删除没用的打包程序

what the diffience between Docker and virtual machine ?

虚拟机是通过软件来模拟硬件，好处是，同样是环境隔离开来的，即假设我们有Mac电脑，我们可以在Mac上运行虚
拟机，有Windows和Linux虚拟机，我们可以在上面运行不同的软件，他们相互之间不会干
扰。但他们内存是独立的，需要我们自己分配使用多少内存，并且共用电脑的硬件。而且
虚拟机启动的会很慢，因为每个虚拟机中都有自己系统，每次启动虚拟机都要像启动操作
系统一样，所以会非常慢. 因为每个虚拟机都会独自占用电脑的硬件，软件等资源，所以
能设置的虚拟机数量有限。

Docker的好处是：



docker的原理：

> docker 就像程序中的进程一样，运行着所有程序包，这些程序包都是共用一个系统内
> 核(系统内核: 每个操作系统都有自己的系统内核，与电脑硬件进行通信，这意味着每
> 个内核都有自己的API，Windows现在有Windows和Linux两种API，Mac有自己的API，所
> 以docker可以在Windows和Linux系统中，使用LinuxAPI，在Mac中，docker使用的是微
> 型Linux虚拟机)

安装docker


```
mac: brew install docker

check the version: docker version or docker -v
```

docker的工作流程：

1. 在本地新建立一个文件夹
2. 在文件夹内建立Dockerfile 文件
3. 创建自己的项目
4. 将自己的项目流程，都记录到Dockerfile中, 包括要运行的软件如python，运行的代
   码
5. 在当前目录下运行docker build

build 之后，docker会将这个项目创建为image，这样其他机器可以利用这个image，来运
行整个项目, 使用docker image ls 查看所有的image

在其他机器上运行该image, `docker run 'image_name'` 

docker ps

docker ps -a

docker 可以将别人很快弄好的镜像配置好，同理，我们也可以将自己的镜像配置好给别
人，有些优质的镜像，可以在网站上找到，然后使用docker部署就好了
