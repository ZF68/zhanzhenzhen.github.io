Copyright (c) 2016 Zhenzhen Zhan

初始化
===========

```bash
sudo npm install site -g --unsafe-perm
```

Clone这个repo，然后设置 `git remote` 到您的 GitHub Pages 的地址。

```bash
npm install
```

添加一个文件`github-credential.json`，该文件含有您GitHub的username和personal access token，格式如下：

```json
{
    "username": "<username>",
    "password": "<token>"
}
```

把`<username>`替换为用户名，`<token>`替换为personal access token（注意最好不要用密码，以防密码泄漏，要用personal access token）。

添加一个文件`ip.txt`，该文件含有一个IP地址。

然后，以下两种方案任选一种：

快速方法
----------

如果您不想在测试时配置HTTPS，则使用此方法。

删除`lib/server.main.fus`一些段落。请遵照该文件注释中的提示来删除。

标准方法
-------------

这是我使用的方法，您可参照此方法来进行安全的调试（即使是局域网内的电脑也不能偷窥您的正在调试的网站）。当然，如果IP是`127.0.0.1`，那不需要采用此方法。但如果IP是`10.0.0.2`之类的局域网地址的话（例如您要使手机可以访问该地址来测试），又不想让局域网的其他电脑可以访问，那最好采用此方法，此方法使用HTTPS和密码来保护网站。

添加一个文件`credential.p12`，该文件含有一个颁发自ZZZ Root CA的关于此IP的证书以及对应的私钥。

添加一个文件`password.txt`，该文件含有一个密码。


添加文件、改名
===============

先输入`site build debug`来生成一些工具模块。

我自己的文章都在`public-text`目录中，您可看一下它们的结构做一些简单的了解。

清空`public`和`public-text`目录。

编辑`lib/shared.main.fus`文件。如果您不想支持多语言，可以清除不必要的`lit`元素。

在`lib/client.main.fus`中有一个字符串`"/childhood-computer.jpg"`。请添加您自己的“序幕”图片到`public`目录，并修改该字符串。

使用这个命令添加主页文件：

```bash
./add home
```

它会生成`public-text/<number>-home.md`文件，其中`<number>`是数字，同时在您的GitHub上自动添加一条issue，issue号就是该`<number>`。

您以后还可以添加其他文件。如要添加博客（日志），那么使用`./add yyyy-mm-dd`的格式。如要添加文章，那么使用别的名称。

您以后还可以更改名称，使用`./rename <number> <new-name>`，把`<number>`替换成文章对应的issue号，把`<new-name>`替换成新名称。

您用到的其他文件，例如图片，必须放在`public`目录中。

调试
======

```bash
site debug
```

然后在浏览器中打开网站。如果是用快速方法，那么端口是50000；如果是用标准方法，那么使用HTTPS，端口是50001。使用标准方法的话，当进入主页，会跳转到输入密码的页面，只要输入正确，重新访问主页即可。

发布
=======

`site deploy`

高级
======

如果您想要屏蔽某条评论，只需为该issue添加一个label，名为`blocked`即可。

您可能想深度定制您的 GitHub Pages 的版式和代码逻辑。要达到此目的，您需要学习[FutureScript](https://futurescript.org/)和 [Site Engine](http://zizisoft.com/site)。
