---
title: 使用pgp向github提交签名commit
description: PGP大法好(绿色小锁真好看)
date: 2023-12-31
slug: pgptogithub
image: 01d3dd5d4b60d4a8012187f4bf8003.jpg@2o.jpg
categories:
    - Main
    - Linux
---

# 使用pgp向github提交签名commit

本文由 `High Ping Network` 的小伙伴 sam 进行编撰，首发于 [Sam 的博客](https://blog.jyf.icu)

## 快速介绍
### 什么是pgp
> GNU Privacy Guard(GnuPG或GPG)是一个密码学软件，用于加密、签名通信内容及管理非对称密码学的密钥。GnuPG是自由软件，遵循IETF订定的OpenPGP技术标准设计，并与PGP保持兼容。
### 为什么要提交签名commit
众所周知，Git的提交只需要自己的邮箱和密码，这就出现了一个漏洞：  只要他人有你的用户名和邮箱，就可以进行提交，就可以更改你的仓库内容。  
 
一个典型的案例：
`https://spencerwoo.com/blog/wait-this-is-not-my-commit`

## 阅前须知
- 阅读本教程，**默认**您拥有一定的[git基础](https://blog.csdn.net/qq_44094296/article/details/114324505)
- 本教程环境为 `Ubuntu22.04`

## 创建PGP密钥
使用下列命令来创建一个属于你的密钥对

```bash
gpg --full-generate-key
```  

- 在密钥种类处：选择默认 RSA and DSA 即可;
- 在密钥长度选项处：选择 4096 bits;
- 在密钥过期时间处：按照自己的需要选择，建议避免永不过期；
- 在我们的*用户 ID*和*邮箱*处：常用用户名，并**填入 GitHub 上面认证过的邮箱**;
- 最后，为密钥设置一个安全的密码，并一定记住这一密码。(当然你也可以不设置直接回车。不过不建议)
这样，我们就拥有了一个属于自己的密钥对

## 查看并上传密钥到github
使用下列命令来查看密钥
```bash
gpg --list-secret-keys --keyid-format LONG
```
其输出应该像这样(Comes from [there](https://spencerwoo.com/blog/wait-this-is-not-my-commit))
```bash
/home/spencer/.gnupg/pubring.kbx
--------------------------------
sec   rsa4096/24CD550268849CA0 2020-08-29 [SC]
      9433E1B6807DE7C15E20DC3B24CD550268849CA0
uid                 [ultimate] Spencer Woo (My GPG key) <my@email.com>
ssb   rsa4096/EB754D2B2409E9FE 2020-08-29 [E]
```
其中，第一行的 `RSA4096` 后的 `24CD550268849CA0` 为你的PGP指纹。请妥善保存它(后面会用到)。
接着我们需要告诉 GitHub 我们使用的 GPG 公钥。
使用下面的命令即可导出我们的 GPG 公钥
```bash
gpg --armor --export [你的指纹]
```
接着将输出(他应该长这样)
```bash
-----BEGIN PGP PUBLIC KEY BLOCK-----
dasSJDsiiiaF......
-----END PGP PUBLIC KEY BLOCK---
```
粘贴到 [此处](https://github.com/settings/keys)，并保存。


## 使用git签名commit
使用如下命令，就可以完成本操作。(此命令会开启所有commit全部签名，如果不需要请查阅后文)
```bash
git config --global user.signingkey [你的指纹]
git config --global commit.gpgsign true
```

如需单次签名 使用`git commit`命令时，在结尾加入`-S`参数，即：
```bash
git commit -S -m "commit注释"
```

## 完成
完成上述步骤后进行一次提交，即可看见自己的commit上有了Verified的绿色标签(如果不行，你可以找谷歌爸爸~~(手动狗头)~~)

