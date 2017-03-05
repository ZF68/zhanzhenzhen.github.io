Copyright (c) 2016 Zhenzhen Zhan

Blog files are under `public-text` directory.

If you want to run it on your computer, there're two ways.

# Quick Way

Use this way if you don't want to configure HTTPS while testing.

Add a file `ip.txt` in the project's directory. The file should contain a line with the following text:

```
127.0.0.1
```

Then remove some lines in `lib/server.main.fus` as mentioned in the comment.

# Standard Way

Create 3 files in the project's directory:

- `credential.p12`
- `password.txt`
- `ip.txt`


`credential.p12` should contain a self-signed certificate. `password.txt` should contain a line of a password. `ip.txt` should contain a line of desired IP address.

When browsing for the first time, you should type the password (see details in Site Engine's manual).

# Only for Me

```bash
ln -s ../common-private/lan-ip-credential.p12 credential.p12
ln -s ../common-private/cookie-password.txt password.txt
ln -s ../common-public/lan-ip.txt ip.txt
```

For other developers please don't run these commands unless your directory structure is the same as mine.

它的特色在于，用 GitHub Pages 的同时，实现评论的功能，全部的架构都位于GitHub，不依赖第三方，零费用。

[网站的Repo在这里。](https://github.com/zhanzhenzhen/zhanzhenzhen.github.io)

我使用自己开发的 Site Engine 来作为框架，并使用自己设计的FutureScript语言来写代码。

[想要了解FutureScript和 Site Engine，点击这里。](https://zizisoft.com/)

FutureScript的文档相对完整些。而 Site Engine 的文档还很不完整，但您可以先不管这些，如果您想创建您自己的技术博客，只要替换`public-text`目录中的文章（Markdown格式），再将`lib/client.main.fus`中的`username`和`repo`替换成您自己的就行了，非常简单。具体步骤如下：

- `npm install -g site`
- git clone 这个网站的repo，并修改remote（或者您也可以fork）。
- `npm install`
- 对repo做相应修改（上文已提及）。
- 如要调试，输入`site debug`（如不想调试，此步骤可省略）。
- 最后输入`site deploy`发布。

这个界面很简陋，然而这只是刚刚开始，我会逐步把它变得华丽。
