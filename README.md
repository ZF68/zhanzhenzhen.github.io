Copyright (c) 2016 Zhenzhen Zhan

Blog files are under `public-text` directory.

博客文件在`public-text`目录中。

Steps to Write Your Own Blog
===============================

1. `npm install -g site`
1. Clone this repo, and set `git remote` to your GitHub Pages address.
1. `npm install`
1. Empty the `public` and `public-text` directory.
1. Add a `public-text/home.md` file.
1. Edit `lib/shared.main.fus` file. Possibly remove unnecessary `lit` element if you don't want to support multiple languages.
1. In `lib/client.main.fus` replace `username` and `repo` to yours.
1. In `lib/client.main.fus` there's a string `"/childhood-computer.jpg"`. Please add your own "prelude" image to `public` directory and modify this string.
1. When you write a blog, the Markdown file must be in `public-text` directory. The file name must start with `YYYY_MM_DD`. Other files such as images must be in `public` directory.

撰写您自己的博客的步骤
=======================

1. `npm install -g site`
1. Clone这个repo，然后设置 `git remote` 到您的 GitHub Pages 的地址。
1. `npm install`
1. 清空`public`和`public-text`目录。
1. 添加`public-text/home.md`文件。
1. 编辑`lib/shared.main.fus`文件。如果您不想支持多语言，可以清除不必要的`lit`元素。
1. 在`lib/client.main.fus`中将`username`和`repo`替换为您自己的。
1. 在`lib/client.main.fus`中有一个字符串`"/childhood-computer.jpg"`。请添加您自己的“序幕”图片到`public`目录，并修改该字符串。
1. 撰写博客时，Markdown文件必须放在`public-text`目录中，且文件名必须以`YYYY_MM_DD`开头。其他文件，例如图片，必须放在`public`目录中。

Debug
========

After configuring, use `site debug` command to run it on your computer. There are two ways of configuring:

Quick Way
----------

Use this way if you don't want to configure HTTPS while testing.

Add a file `ip.txt` in the project's directory. The file should contain a line with the following text:

```
127.0.0.1
```

Then remove some lines in `lib/server.main.fus` as mentioned in the comments in this file.

Standard Way
-------------

Create 3 files in the project's directory:

- `credential.p12`
- `password.txt`
- `ip.txt`

`credential.p12` should contain a self-signed certificate. `password.txt` should contain a line of a password. `ip.txt` should contain a line of desired IP address.

When browsing for the first time, you should type the password (see details in Site Engine's manual).

Only for Me
--------------

```bash
ln -s ../common-private/lan-ip-credential.p12 credential.p12
ln -s ../common-private/cookie-password.txt password.txt
ln -s ../common-public/lan-ip.txt ip.txt
```

For other developers please don't run these commands unless your directory structure is the same as mine.

调试
======

配置后，使用 `site debug` 命令来在您的电脑上运行它。有两种配置方法：

快速方法
----------

如果您不想在测试时配置HTTPS，则使用此方法。

在项目的目录中添加一个文件`ip.txt`。该文件应包含一行文本，如下：

```
127.0.0.1
```

然后删除`lib/server.main.fus`一些段落。请遵照该文件注释中的提示来删除。

标准方法
-------------

在项目的目录中添加3个文件：

- `credential.p12`
- `password.txt`
- `ip.txt`

`credential.p12`应包含自签名证书，`password.txt`应包含一行密码，`ip.txt`应包含一行您希望的IP地址。

初次浏览时，您需要输入密码（详情请见 Site Engine 的手册）。

Deploy
=========

`site deploy`

发布
=======

`site deploy`

Advanced
===========

You may want to deeply customize the layout or the logic of your GitHub Pages. To do this, you'll need to learn [FutureScript](https://futurescript.org/) and [Site Engine](http://zizisoft.com/site).

高级
======

您可能想深度定制您的 GitHub Pages 的版式和代码逻辑。要达到此目的，您需要学习[FutureScript](https://futurescript.org/)和 [Site Engine](http://zizisoft.com/site)。
