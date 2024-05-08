## 一. 简介 Haooho 仓库管理系统
本仓库管理系统主要方便小型生产制造业，记录原材料的采购入库和成品消耗原材料的数量。方便管理材料库存，让小型企业有系统可用，有数据可参考。

* 若使用过程有出现问题或者需要跟进的，请发邮件联系 ahoaho@zoho.com.cn

## 二.运行docker容器服务

```shell
docker compose up -d
```

## 三.初始化数据库
```
docker cp tbs.sql depoinstall-haooho-db-1:/tmp 

docker exec -it depoinstall-haooho-db-1 mysql -uroot -p depo

Enter password: （输入密码）
haoohoCyber

source  /tmp/tbs.sql;

GRANT ALL ON *.* TO 'cyberkeon'@'%';
flush privileges;

#退出按快捷键
ctrl+d
```

## 四.查看系统
```
打开浏览器 ，输入地址
http://127.0.0.1:8367/

```
