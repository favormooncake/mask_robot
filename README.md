## mask_robot
改进mask-rcnn，制作机械臂等工厂中移动物体数据集，训练

# 关于mask-rcnn在windows10下的配置
作者安装的是CUDA 9.0、cuDnn 7.0、python 3.5或者3.6、anaconda3的5.1版本、tensorflow-gpu 1.5.0、kears 2.1.4。
各个版本需要一一对应，上面的配置是没有问题的。

## 第一步 安装python3.6
https://www.python.org/downloads/release/python-360/
根据自己是64位机还是32位机选择即可

## 第二步 安装Anaconda
官网下载地址：https://www.anaconda.com/download/ 
但是速度很慢，推荐清华镜像：https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/
在清华源上找见Anaconda3-5.1.0-Windows-x86_64.exe，之后进行安装。
附百度网盘资源：https://pan.baidu.com/s/1NK6YpNFvnFDRLBHxIwlrgg 提取码：ev0e

注意安装anaconda时一定要把环境变量加入windows环境中。要没有勾选，安装完后还有手动加入。（两个框都勾上）

验证安装是否成功：打开CMD输入“conda–version”命令，出现conda 4.4.10。若没有的话把你anaconda3安装路径下的这三个路径加入系统环境变量中就行了。
\anaconda3
\anaconda3\Scripts
\anaconda3\Library\bin


## 第三步 安装TensorFlow-GPU
1.为conda设置清华源
打开Anaconda Prompt，输入清华仓库镜像，这样更新会快一些：

```conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/```

```conda config --set show_channel_urls yes```

2.创建名为“tensorflow”的conda环境
在命令行中切换到D盘，输入以下代码：

```conda create -n tensorflow pip python=3.6```

































