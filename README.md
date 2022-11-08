# 基于 Vue 和 SpringBoot 的通讯录管理系统

ExtJS 版本的项目在 `extjs` 文件夹下；Vue 版本的项目在 `vue`  文件夹下，自述说明请往下拉！

ExtJS 版本是大三《数据库编程》的课程设计，Vue 版本是工作后因个人兴趣编写的版本，如有不足之处敬请谅解。

Vue 版本的项目是一个很好的开发模板哦！

## ExtJS 版本

`extjs`文件夹下的项目是一个基于 **ExtJS** 和 **SpringBoot** 的通讯录管理系统，模拟了通讯录记录的业务流程，主要包含通讯录类型模块、通讯录明细模块、用户管理、菜单权限管理、图表分析大屏这五个模块。

### 前端

- Extjs
- JQuery

### 后端

- SpringBoot
- Jpa

### 数据库

- MySql 8.0.30

### 模块预览

首先是 ExtJS 版本的登陆页，是暗黑风格的登陆模块，登陆界面需要输入标准三大套件：账号、密码、验证码，如下所示。

![输入图片说明](image/ext/1.png)

当然也有注册页面，注册就要多填一些数据，实现逻辑大致一样，如下图所示。

提示：请注意验证码在表单右边哦！

![输入图片说明](image/ext/2.png)

登陆之后就是主页了，主页就让人看着清爽，简简单单几个静态的打字，如下图所示。

![输入图片说明](image/ext/3.png)

第一个模块是用户管理模块，用于管理可以进入到这个系统的用户，如下图所示。

![输入图片说明](image/ext/4.png)

当然对于用户可以进行基于姓名的条件查询，表单有点简陋，如下图所示。

![输入图片说明](image/ext/5.png)

第二个模块就是权限管理模块，这个模块管理了`管理员` 和 `用户`分别有哪些菜单权限，Vue 版本对齐进行了深入优化，角色可自由定义增删。

![输入图片说明](image/ext/6.png)

下面这个是菜单管理模块，功能可以对标 Vue 版本的菜单支持模块，用于管理模块和源代码路径的映射关系，如下图所示。

![输入图片说明](image/ext/7.png)

第四个模块是管理类型管理模块，也就是通讯录的类型，如朋友、同学、家人等，支持增删改查导出操作，如下图所示。

![输入图片说明](image/ext/8.png)

当然朋友类型的添加界面也要展示一下，如下图所示。

![输入图片说明](image/ext/9.png)

删除的提示界面也一样，整个系统都是这样的一个二次确认提示框。

![输入图片说明](image/ext/10.png)

第五个就是通讯录管理模块，正儿八经的管理通讯录的数据，可以看到密密麻麻的测试数据，如下图所示。

![输入图片说明](image/ext/11.png)

对于这么正儿八经的模块，当然也支持条件查询，那就是关系类型的条件查询，如下图所示。

![输入图片说明](image/ext/12.png)

第六个模块就是通讯录查询模块，这个模块是`视图`的定位，就是用来查询的，虽然没什么用，但做都做了，还是保留着吧，如下图所示。

![输入图片说明](image/ext/13.png)

第七个模块是图表管理模块，展示各类通讯录的分布情况，看起来黄蓝对比色还不错，图下图所示。

![输入图片说明](image/ext/14.png)

当然了，用户既然能登进来，肯定能修改自己的密码，修改密码的界面如下图所示。

 ![输入图片说明](image/ext/15.png)

为了在课程设计中拿高一点的分数，我还写了个大屏，套了个模板，数据来源于自己的 API 接口，这不就成了，拿了个`优秀`，嘿嘿~ 大屏界面如下图所示。

![输入图片说明](image/ext/16.png)

各位同学可能想问了，我如果去开发这套系统，是则么样的感受呢？那就是打开 `Eclipse` 然后顶着屏幕的感受啦，就像下面这张图这样，你快盯他！

![输入图片说明](image/ext/17.png)

ExtJS 版本的数据库很简单，总共就六张表，图下图所示。

![输入图片说明](image/ext/18.png)

## Vue.js 版本

Vue.js 版本的通讯录系统，采用了 <https://gitee.com/yyzwz/template> 这个项目作为开发模板。

Vue 版本的登陆界面如下所示，用户需要输入登陆账号、密码和图形验证码。

![输入图片说明](image/vue/1.png)

项目支持企业微信扫码登陆，当然需要在项目后端配上你自己企业的 ID 和应用 ID，如下图所示。

![输入图片说明](image/vue/2.png)

登陆成功后，进入到主页面，如下图所示。点击每一个常用模块可以快速进入对应的模块，不用再依次选菜单了。

![输入图片说明](image/vue/3.png)

朋友类型模块如下所示，你可以在这个模块中维护朋友类型的数据，朋友类型数据要在通讯录明细模块中引用。

![输入图片说明](image/vue/4.png)

通讯录明细模块如下所示，你可以在这里维护通讯录数据。

![输入图片说明](image/vue/5.png)

通话记录模块如下图所示，是通讯录明细的一个扩展，维护朋友之间的联系维度。

![输入图片说明](image/vue/6.png)

还有一些图表，本项目采用了 蚂蚁金服 Antv 产品，有兴趣的朋友可以了解看看，如果要 Echarts 可以到 Extjs 版本的项目查看。

![输入图片说明](image/vue/7.png)

![输入图片说明](image/vue/8.png)

![输入图片说明](image/vue/9.png)

![输入图片说明](image/vue/10.png)

当然你可以在这个项目上进行二次开发，扩展你的非标需求，就像下图这样。

![输入图片说明](image/vue/11.png)

另外本项目将所有的文件，封装成了一个云盘模块，其他模块如果涉及到文件上传、下载预览等业务时，只需调用写好的组件即可完成，简化开发量。

![输入图片说明](image/vue/12.png)

## 免责声明

- 本项目开源，仅供个人学习使用，**转发 / 商用授权请联系作者，否则后果自负**。
- 作者拥有本软件构建后的应用系统全部内容所有权及独立的知识产权。
- 如有问题，欢迎在仓库 Issue 留言，看到后会第一时间回复。相关意见会酌情考虑，但没有一定被采纳的承诺或保证。

下载本系统代码的用户，**必须同意以下内容，否则请勿下载**！

1. 出于自愿而使用/开发本软件，了解使用本软件的风险，且同意自己承担使用本软件的风险。
2. 利用本软件构建的网站的任何信息内容以及导致的任何版权纠纷和法律争议及后果和作者无关，作者对此不承担任何责任。
3. 在任何情况下，对于因使用或无法使用本软件而导致的任何难以合理预估的损失（包括但不仅限于商业利润损失、业务中断与业务信息丢失），作者概不承担任何责任。
4. 必须了解使用本软件的风险，作者不承诺提供一对一的技术支持、使用担保，也不承担任何因本软件而产生的难以预料的问题的相关责任。
