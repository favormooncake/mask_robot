# 移动机器人定位与导航论文相关开源部分代码
包括以下内容：
1. 制作机械臂等工厂中移动物体数据集，训练，结果权重文件（后续根据需求不断扩充）
2. 移动机器人的固定路线跟踪速度规划曲线s_move.m
3. 倍福TWINCAT3软件的手柄信号接受以及四台松下电机控制PLC文件
4. xbox one手柄通过ADS通讯协议与倍福工控机通讯程序，python实现按键监听controller.py
4.

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
```CUDA_PATH = C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v9.0```
```CUDA_LIB_PATH = C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v9.0\lib\x64 ```
```CUDA_BIN_PATH = C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v9.0\bin```
```CUDA_libnvvp = C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v9.0\libnvvp```


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

## 第五步 其他需要安装的部分
1.git安装
网盘链接：https://pan.baidu.com/s/1G8CUJccBypQ9-AI7_q-qdw 提取码：simu

2.pycocotools安装
网盘链接：https://pan.baidu.com/s/19RAjr6Y2VwJLIZ_ZT-Bxqg 提取码：i9vo
解压，命令行进入解压文件目录，执行以下代码：

第一步：```cd coco/PythonAPI```
       ```python setup.py build_ext --inplace```
第二步：```python setup.py build_ext install```

3.包Shapely安装
```pip install shapely```

4.visual c++ 2015 bulid tools安装
百度网盘资源：https://pan.baidu.com/s/1BWS01bydmNQQsJaGrMrVcQ 提取码：clah,默认安装就可以。

## 第六步
1.mask rcnn源码下载
https://github.com/matterport/Mask_RCNN

2.mask_rcnn_coco.h5下载
百度网盘资源：链接：https://pan.baidu.com/s/11bAIAX0l0DJ-p76BlQrTXQ 提取码：meg3

3.mask rcnn安装
命令行进入mask rcnn源码文件夹下，把mask_rcnn_coco.h5也放在其中，输入以下命令：
```activate tensorflow```
//可以自行进文件里面看要求，不用执行这步
```pip install -r requirements.txt```
```python setup.py install```
```jupyter notebook```

## 关于训练过程
### 制作数据集
1、安装labelme
打开 anaconda prompt
1、输入命令：```conda create --name=labelme python=3.6```
2、输入命令：```activate labelme```
3、输入命令：```pip install pyqt```
4、输入命令：```pip install labelme```
安装完毕后再次输入命令即可打开labelme：
```activate labelme```
```labelme```

2、labelme标注过程
在Edit界面下可选择多种工具进行真值标注，为了提高精确度，建议放大后手动逐点标注，编写脚本还原标注点

3、标注完成后，进入json文件所在的目录，在终端执行以下命令
```labelme_json_to_dataset <文件名>.json```

文件夹下应该生成这五个文件，
```*.png ```
```info.yaml ```
```label.png ```
```label_names.txt ```
```label_viz.png```

4、如果由于版本原因发现无法生成info.yaml文件
进入anaconda的安装路径：D:\mask-rcnn\anaconda\envs\labelme\Lib\site-packages\labelme\cli,更改json_to_dataset.py文件
#找到如下代码块
    PIL.Image.fromarray(img).save(osp.join(out_dir, 'img.png'))
    utils.lblsave(osp.join(out_dir, 'label.png'), lbl)
    PIL.Image.fromarray(lbl_viz).save(osp.join(out_dir, 'label_viz.png'))

    with open(osp.join(out_dir, 'label_names.txt'), 'w') as f:
        for lbl_name in label_names:
            f.write(lbl_name + '\n')
	# 缺少的部分，进行添加
    logger.warning('info.yaml is being replaced by label_names.txt')
    info = dict(label_names=label_names)
    with open(osp.join(out_dir, 'info.yaml'), 'w') as f:
        yaml.safe_dump(info, f, default_flow_style=False)

    logger.info('Saved to: {}'.format(out_dir))

if __name__ == '__main__':
    main()

#在开头引入
	```import yaml```
之后再次输入命令labelme_json_to_dataset <文件名>.json，即可得到完整文件

我们首先将数据集分为四个文件夹，分别是 cv2_mask、json、labelme_json、pic

cv2_mask----》存放labelme指令生成的 label.png 文件
json 文件夹----》 存放我们使用labelme 标注后生成的那个 json文件
labelme_json 文件夹 ---》 存放前面输入指令后转化生成的json文件夹
pic文件夹  ----》 存放原始图片
为了便于不同图片，将上述四个文件夹存放文件以序号表示，例如：
001.png,001.json,002_jason文件夹,001.png(原图)

第二步，训练数据集
对train.py进行文件路径更改，理论上在Python3环境下可以顺利运行，训练后在log文件中可以找到训练后的.h文件

注意：
1.tensorflow2.0以上会报错，AttributeError: 'Model' object has no attribute 'metrics_tensors'
解决方法，就是在报错的model文件的该函数下添加该属性
self.keras_model.metrics_tensors = []
2.版本必须进行对应，scikit-image与numpy版本要一致，
 例如，h5py==2.10.0，对应scikit-image==1.15.1,对应scikit-image0.15.0
 
 ###关于测试过程
 对test.py进行文件路径更改，理论上可以顺利测试，使用上文得到的.h文件作为网络参数，经过测试可以发现准确率较高







