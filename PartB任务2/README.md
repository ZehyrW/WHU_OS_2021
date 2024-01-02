# PartB任务二

## 实现内容

* 对可执行文件的完整性校验（**奇偶校验法**）

## 具体操作

* **修改bochsrc中文件为你当前路径**
``` c
# filename of ROM images
romimage: file=/usr/local/share/bochs/BIOS-bochs-latest
vgaromimage: file=/usr/share/vgabios/vgabios.bin
```

* **在PartB_2文件夹下进入终端，执行以下命令**
``` bash
$ cd command
$ make install
$ cd ..
$ make image
```

* **一直键入```Enter```键**

* **bochs 1：处键入c**

```
bochs 1: c
```

* **键入```Shift + F2```进入TTY1**

* **依次输入以下命令查看校验过程**

```
test
inject test
test
```

* **得到最终展示结果**

## ATTENTION
**本任务基于chapter11源码实现**
