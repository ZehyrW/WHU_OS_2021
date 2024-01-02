# PartA任务一

## 实现内容

* 以页为单位实现内存分配与释放(**基于第三章课后动手做 free_page & alloc_page**)
* 设计多级反馈队列实现多进程管理与调度

config设置为三级队列，每级队列时间片分别为1、2、4。
<br>A-E五个进程，具体信息如下所示。
进程 | 需求资源 | 到达时间
---- | ------- | --------
A|3|0
B|8|1
C|4|3
D|5|4
E|7|5


## 具体操作

* **修改bochsrc中文件为你当前路径**
``` c
# filename of ROM images
romimage: file=/usr/local/share/bochs/BIOS-bochs-latest
vgaromimage: file=/usr/share/vgabios/vgabios.bin
```

* **在PartA_1文件夹下进入终端，执行以下命令**
``` bash
make image
```

* **一直键入```Enter```键**

* **bochs 1：处键入c**

```
bochs 1: c
```

* **得到最终展示结果**

## ATTENTION
**本任务基于chapter6源码实现**
