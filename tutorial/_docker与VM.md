



## 容器 VS 虚拟机



<table>  <tbody>    <tr>      <td><img src="https://www.docker.com/sites/default/files/Container%402x.png" alt="Container stack example" width="300px"></td>      <td><img src="https://www.docker.com/sites/default/files/VM%402x.png" alt="Virtual machine stack example" width="300px"></td>    </tr>  </tbody></table>


- 轻量级：<br>硬盘空间: ubuntu 16.4的[docker镜像](https://hub.docker.com/_/ubuntu/)只有114M，[系统镜像iso](https://mirrors.tuna.tsinghua.edu.cn/ubuntu-releases/16.04/)则需要1.5G。<br> 运行时: 多个容器共享主机的内核，VM会消耗更多资源
- 启动快：<br>虚拟机等完整系统，冗余步骤多：比如用户登录
- Stackable: You can stack services vertically and on-the-fly.



Hypervisor是一种运行在物理服务器和操作系统之间的中间软件层,可允许多个操作系统和应用共享一套基础物理硬件，因此也可以看作是虚拟环境中的“元”操作系统，它可以协调访问服务器上的所有物理设备和虚拟机，也叫虚拟机监视器（Virtual Machine Monitor）。

- 虚拟化的级别越偏底层，速度越慢，用户越难察觉到虚拟化的存在。
- 虚拟化的级别越偏上层，速度越快，用户越容易感知。


JVM

- 程序虚拟机：Java虚拟机（JVM）
- 系统虚拟机：VPC，v-Box，VMware Server。。KVM、Xen、OpenVZ。需要一个完整的操作系统，所以体积会比较大，如果想优化速度就必须要精简操作系统了，
- VMware ESX Server 裸机安装


那么 Docker 的实质是什么？在我看来**就是个针对 PAAS 平台的自动化运维工具而已**。

虚拟机启动太慢，额外开销太高，性能由于多了一层会下降。

KVM：KVM并没有选择从底层开始新写一个Hypervisor，而是选择了基于Linux Kernel，通过加载新的模块从而使Linux Kernel本身变成一个Hypervisor
