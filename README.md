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
```\anaconda3```
```\anaconda3\Scripts```
```\anaconda3\Library\bin```


## 第三步 安装TensorFlow-GPU
1.为conda设置清华源
打开Anaconda Prompt，输入清华仓库镜像，这样更新会快一些：

```conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/```

```conda config --set show_channel_urls yes```

2.创建名为“tensorflow”的conda环境
在命令行中切换到D盘(自己的安装目录)，输入以下代码：

```conda create -n tensorflow pip python=3.6```

务必注意一点，在安装完tensroflow后，由于我们是新创建的conda环境，该环境中基本上是空的，有很多包和IDE并没有安装进来，通过以下命令安装Anaconda基础包。

```conda install anaconda```

## 第四步 安装CUDA + cuDNN
1.下载CUDA + cuDNN
在这个网址查找CUDA已发布版本：https://developer.nvidia.com/cuda-toolkit-archive
cuDNN历史版本在该网址下载：https://developer.nvidia.com/rdp/cudnn-archive
附百度网盘资源：
CUDA 9.0:：https://pan.baidu.com/s/1_mQgLKmmEGUwMqiQ_QgcFg 提取码：qgy0
配套的cuDNN 7.0：链接：https://pan.baidu.com/s/1fntIUYhlS9JvQL7g9YfzuQ 提取码：05fi

2.安装 CUDA 9.0 和 cuDnn 7.0
cuda：
选择“自定义（高级）  ->  勾选所有
安装路径不要改，保持默认，一路下来就行。

接下来，解压“cudnn-9.0-windows10-x64-v7.zip”，将以下三个文件夹，打开文件夹内容，分别拷贝到CUDA安装的根目录对应的文件下面，不要直接复制文件夹。

这样CUDA Toolkit 9.0 和 cuDnn 7.0就已经安装了，进行环境变量的配置，将下面四个路径加入到环境变量中，注意要换成自己的安装路径。
CUDA_PATH = C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v9.0
CUDA_LIB_PATH = C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v9.0\lib\x64 
CUDA_BIN_PATH = C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v9.0\bin
CUDA_libnvvp = C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v9.0\libnvvp

3.安装Keras作为上层框架调用Tensorflow(注意在tensorflow环境下)
python
pip install keras == 2.1.2

4.测试
1）查看是否使用GPU
import tensorflow as tf
tf.test.gpu_device_name()
2）查看在使用哪个GPU
from tensorflow.python.client import device_lib
device_lib.list_local_devices()
3）查看已安装tensorflow版本
tf.__version__
4）查看已安装tensorflow安装路径
tf.__path__
5）确定自己的TensorFlow是CPU还是GPU的版本
import numpy
a = tf.constant([1.0, 2.0, 3.0, 4.0, 5.0, 6.0], shape=[2, 3], name='a')
b = tf.constant([1.0, 2.0, 3.0, 4.0, 5.0, 6.0], shape=[3, 2], name='b')
c = tf.matmul(a, b)
sess = tf.Session(config=tf.ConfigProto(log_device_placement=True))
print(sess.run(c))
6）查看keras版本
import keras as k
print(k.__version__)
7）查看tensorflow是否安装成功
hello = tf.constant('Hello')
sess=tf.Session()
print(sess.run(hello))
















