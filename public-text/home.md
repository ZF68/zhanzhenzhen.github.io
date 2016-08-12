<script type="application/ld+json">
{
    "@context": "http://schema.org/",
    "@type": "CreativeWork",
    "headline": "主页",
    "dateCreated": "2016-08-06T14:44+08:00"
}
</script>

这是詹臻臻的个人网站。

它的特色在于，用 GitHub Pages 的同时，实现评论，全部的架构都位于GitHub，不依赖第三方，零费用。

[网站的Repo在这里。](https://github.com/zhanzhenzhen/zhanzhenzhen.github.io)

我使用自己开发的 Site Engine 来作为框架，并使用自己发明的FutureScript语言来写代码。

[想要了解FutureScript和 Site Engine，点击这里。](https://zizisoft.com/)

FutureScript的文档相对完整些。而 Site Engine 的文档还很不完整，但您可以先不管这些，如果您想创建您自己的技术博客，只要替换`public-text`目录中的文章（Markdown格式），再将`lib/client.main.fus`中的`username`和`repo`替换成您自己的就行了，非常简单。具体步骤如下：

- `npm install -g site@2.6.1`
- git clone 这个网站的repo，并修改remote（或者您也可以fork）。
- 对repo做相应修改（上文已提及）。
- 如要调试，输入`site build debug && npm start`，端口号参见`server.main.fus`（此步骤可省略）。
- 发布前，输入`site build release && site static`。此命令将混合代码转换成纯客户端代码，并commit到master分支中（注意，我们的源代码是存放在source分支中的，但对 GitHub Pages 真正起作用的是master分支）。这一切都是自动完成，您无需手动切换分支。
- 最后输入`git push --all`发布。以后每次发布，只需`site build release && site static && git push --all`就行了。

这个界面很简陋，然而这只是刚刚开始，我会逐步把它变得华丽。
