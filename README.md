## Get Started with PieCloudDB Database CoC

PieCloudDB Database CoC 版本上手文档、示例及数据。

This is the quick start tutorial GitHub repo for PieCloudDB's management console.

. 

├── Online Retail Sample Data

│├── fake_online_retail_data.zip       # Sample data files

│├── demo_query.sql          # Sample data DDL + sample analysis queries

└── README.md


## 快速开始PieCloudDB CoC版

我们将从导入数据⼊⼿，结合虚拟电商销售数据等实例，详细展示PieCloudDB CoC版本查询计算和查询历史等功能，引导您快速了解和上⼿PieCloudDB 云上云版本。详细的视频讲解请参照<u>[快速上手PieCloudDB视频](https://www.bilibili.com/video/BV15s4y1J7fL/)</u>。

快速开始大致分为以下五个部分：

* 建立虚拟数仓

* 新建文件夹和SQL文件

* 简单实例：建立数据库和表

* 复杂实例：数据上传 -- 虚拟电商销售数据

* 查询评估：查询历史功能应用

### **数字计算第一步：虚拟数仓**

登录PieCloudDB云上云版本（app.pieclouddb.com），进入主界面，在左侧菜单栏点击「虚拟数仓」。

![](https://www.openpie.com/imgs/ddf9f27d-56c8-2a1c-576a-73dba727dc03)

进入「虚拟数仓」界面，点击右上角「新建虚拟数仓」创建一个新的虚拟数仓。

![](https://www.openpie.com/imgs/bcdda561-563c-859b-00e9-3a064cecf0e7)

填写虚拟数仓名称，节点数，节点大小和备注。完成后，点击「确认」启动虚拟数仓。

![](https://www.openpie.com/imgs/818fbaca-ab50-4b85-b229-49f62fd3aac0)

等待虚拟数仓状态从启动中更新为运行中，即可使用该虚拟数仓执行SQL任务。

![](https://www.openpie.com/imgs/4450be5a-b6ee-dd0f-bc04-d29f2cf01652)

## **新建文件夹和SQL文件**

虚拟数仓创建完成且处于运行中后，我们点击「数据洞察」进入「数据洞察」界面。点击图中的文件夹图标创建文件夹。

![](https://www.openpie.com/imgs/1d800dc9-67bf-8baf-d407-ba4f5960e8d1)

填入文件夹名称，点击「确认」。

![](https://www.openpie.com/imgs/a2dfb44e-af68-8d94-e22f-869fe754f0e2)

点击如图所示文件图标，建立一个新的SQL文件。

![](https://www.openpie.com/imgs/cb1effec-279b-b280-435a-a3012d2069d0)

点击文件栏内文件名右侧「···」按钮，可重命名、移动、删除或导出文件。

![](https://www.openpie.com/imgs/705c9e4c-1601-8e6d-3de2-c65cc61aa8c6)

点击「重命名」，将文件重命名为“demo_query”，点击「确认」完成重命名。

![](https://www.openpie.com/imgs/ffe1c5e1-be5d-5217-d4d3-24a6d191775d)

创建SQL文件后，即可在文件内书写查询语句，执行SQL任务。PieCloudDB会自动保存更新的SQL文件。

## **简单实例：建立数据库和表**

在确保有可用的虚拟仓库后，打开一个SQL文件（这里我们以先前创建的文件demo_query为例），输入以下查询语句。

```auto
create database testdb;
```

在运行以上查询前，选择对应的数据库和虚拟数仓执行SQL任务。这里我们选择初始数据库「openpie」，并选择一个可用的虚拟数仓「虚拟数仓1」。

![](https://www.openpie.com/imgs/e1c358ae-72eb-6aa3-7aab-c303742f6c01)

选中该语句并点击执行，执行该查询语句。

![](https://www.openpie.com/imgs/a4ec431f-a411-c1ad-6e10-5abf88a131b3)

结果显示如下，数据库已创建成功。

![](https://www.openpie.com/imgs/c6cca0dc-f0cc-2b8e-440e-8e0d1c6eaae9)

若想在新建的数据库中创建新表，按如图所示将执行查询的数据库切换为新建的数据库「testdb」。

![](https://www.openpie.com/imgs/e2185380-db1a-c27d-6a80-4129db848848)

执行以下语句，创建一个存储电影数据的数据表。

```auto
create table test_table (
ID char(10),
Name char(50),
Length int,
Date char(10),
Type char(20)
);
```

和先前创建数据库的例子相似，在PieCloudDB中选中并执行该语句。

![](https://www.openpie.com/imgs/2e2305a8-d781-c8bb-cee6-4db9b3bcb53a)

数据表建立后，运行以下SQL语句，在该表中新增两条记录。

```auto
insert into test_table VALUES
('B6717', 'Tampopo', 110, '1985-02-10', 'Comedy'),
('HG120', 'The Dinner Game', 140, '1985-02-10', 'Comedy');
```

运行以下select语句，在数据表中查看新增的记录。

```auto
select * from test_table;
```

在PieCloudDB中结果如图所示。

![](https://www.openpie.com/imgs/2d9ebda9-20a7-6196-1287-7b9abfbe8b3c)

## **复杂实例：数据上传 -- 虚拟电商销售数据**

在初步了解PieCloudDB「数据洞察」功能后，我们在这个基础上利用「数据集成」功能，上传更大的数据文件并对数据进行分析。这里我们上传的虚拟电商销售数据结构大致如下。

![](https://www.openpie.com/imgs/8307ebcf-146c-4bb7-a507-613b59ebbc88)

首先，来到「数据洞察」，运行以下SQL语句，创建数据所需要的数据库。

```auto
create database 线上销售数据;
```

与先前简单实例相似，切换执行查询的数据库到「线上销售数据」。运行以下语句，在「线上销售数据」中创建三个schema。

```auto
create schema 服装销售数据;
create schema 食品销售数据;
create schema 顾客数据;
```

有了以上schema后，我们即可运行以下语句，在各个schema上创建对应的表。

「食品销售数据」schema——食品相关数据数据：

```auto
-- 食品产品数据
create table 食品销售数据.食品产品数据 (
  产品编号 VARCHAR(10) NOT NULL,
  原料 VARCHAR(5),
  类型 VARCHAR(5),
  价格 FLOAT,
  库存 INT,
  产品图片 TEXT
);

-- 2020年至2023年食品交易数据
create table "食品销售数据".交易数据_2020_2023 (
  交易编号 VARCHAR(10) NOT NULL,
  顾客序号 VARCHAR(10) NOT NULL,
  产品编号 VARCHAR(10) NOT NULL,
  交易日期 VARCHAR(10),
  交易时间 TIME,
  件数 INT,
  平台 VARCHAR(5)
);
```

「服装销售数据」schema——服装相关数据数据：

```auto
-- 服装产品数据
create table 服装销售数据.服装产品数据 (
  产品编号 VARCHAR(10) NOT NULL,
  颜色 VARCHAR(5),
  类型 VARCHAR(5),
  价格 FLOAT,
  库存 INT,
  产品图片 TEXT
);

-- 2020年至2023年服装交易数据
create table "服装销售数据".交易数据_2020_2023 (
  交易编号 VARCHAR(10) NOT NULL,
  顾客序号 VARCHAR(10) NOT NULL,
  产品编号 VARCHAR(10) NOT NULL,
  交易日期 VARCHAR(10),
  交易时间 TIME,
  件数 INT,
  平台 VARCHAR(5)
);
```

「顾客数据」schema——用户相关信息：

```auto
-- 2020至2023年顾客数据
create table 顾客数据.顾客数据_2020_2023 (
  顾客序号 VARCHAR(10) NOT NULL,
  顾客姓名 VARCHAR(5),
  生日 DATE,
  注册日期 DATE,
  手机号 VARCHAR(11),
  省份 VARCHAR(10),
  城市 VARCHAR(10),
  地区 VARCHAR(10),
  地址 VARCHAR(100)
);
```

创建完所需的表后，逐一上传数据文件至对应的表中。点击左侧菜单栏「数据集成」，选择「导入数据」，进入界面后再选择右上角导入数据，开始导入数据。

![](https://www.openpie.com/imgs/0c1de174-4d13-7d52-9f5f-a74787cf31d0)

进入「导入数据」界面后，按照如图所示的步骤，上传数据文件至对应数据表。

![](https://www.openpie.com/imgs/1813dfa6-3c72-3795-077d-1f6cb6de7d27)

导入文件后，可点击文件名左侧靠右眼睛式样的图标预览文件，也可点击该位置靠左齿轮式样的图标修改文件的上传选项。由于需要的上传数据都包含表头，在开始上传前，我们需要重新调整高级选项，修改上传全局设置。具体操作详见<u>[快速上手PieCloudDB视频](https://www.bilibili.com/video/BV15s4y1J7fL/)</u>。

点击「高级选项」：

![1](https://user-images.githubusercontent.com/96459983/233787378-cd14cb2a-2d72-4822-abb0-5366b3316a72.png)

确认分隔符，打开「文件是否包含表头」选项。

![2](https://user-images.githubusercontent.com/96459983/233787403-a8d05e8d-06e4-4a3b-8e8f-23c8575cbfd7.png)

点击确认保存设置，再点击文件右侧的「点击开始」可上传单个文件至数据库。

![3](https://user-images.githubusercontent.com/96459983/233787423-7d6d277f-168b-4296-992d-84133fa013ae.png)

PieCloudDB也可上传多份数据至同一数据表中。如图所示，服装交易数据由多个数据文件组成。

![](https://www.openpie.com/imgs/1ed203a8-94fe-b36c-e9c3-267f29b86291)

在多个文件的情况下，最下侧的「高级选项」可调整全局的文件上传选项。如个别文件需要单独设置上传选项，如前文提及的一样，点击相应文件名左侧的设置按钮可进行单独设置。由于文件众多，这里点击「全部开始」可依次上传多个文件。

数据加载到各个表中后，我们可以执行一些联合查询来进行数据分析。

以下SQL语句可创立两个视图，一个基于食品交易信息，另一个基于服装交易信息，这样我们可以根据交易的特性，快速查询到对应的商品以及购买商品顾客的信息。

```auto
-- 基于服装交易的视图
create view "服装销售数据"."交易数据全部信息_2020_2023" as (
  select "交易编号",a."顾客序号", a."产品编号", "交易日期", "交易时间", "件数", "平台", "颜色", "类型", "价格", "库存", "产品图片", 
    "顾客姓名",c."生日","注册日期","省份","城市","地区","地址"
    from "服装销售数据"."交易数据_2020_2023" as a 
    left join "服装销售数据"."服装产品数据" as b 
    on a."产品编号" = b."产品编号" 
    left join "顾客数据"."顾客数据_2020_2023" as c
    on a."顾客序号" = c."顾客序号"
    order by a."交易日期" desc
);

-- 基于食品交易的视图
create view "食品销售数据"."交易数据全部信息_2020_2023" as (
  select "交易编号",a."顾客序号", a."产品编号", "交易日期", "交易时间", "件数", "平台", "原料", "类型", "价格", "库存", "产品图片", 
    "顾客姓名",c."生日","注册日期","省份","城市","地区","地址"
    from "食品销售数据"."交易数据_2020_2023" as a 
    left join "食品销售数据"."食品产品数据" as b 
    on a."产品编号" = b."产品编号" 
    left join "顾客数据"."顾客数据_2020_2023" as c
    on a."顾客序号" = c."顾客序号"
    order by a."交易日期" desc
);
```

根据这两个视图，我们可以轻松查询到2022年双十二期间以城市为单位的销售额，并根据销售额从高到低进行排序。

```auto
select a."省份", a."城市", sum(a."总价") as "销售额" 
  from (
  select "交易编号", "顾客序号", "产品编号", "交易日期", "件数"*"价格" as "总价", "省份", "城市"
  	from "服装销售数据"."交易数据全部信息_2020_2023" 
  union 
  select "交易编号", "顾客序号", "产品编号", "交易日期", "件数"*"价格" as "总价", "省份", "城市" 
    from "食品销售数据"."交易数据全部信息_2020_2023"
  where "交易日期" = '2022-12-12') as a
group by "省份", "城市"
order by "销售额" desc;
```

执行该查询的结果如下：

![](https://www.openpie.com/imgs/ba8d59a6-6d73-2344-df39-63234dd6078e)

可以看到，数据中销售的前6名都为直辖市，且前十名当中，长江以北的城市居多。（数据为虚拟数据，城市信息与虚拟客户随机匹配）

我们也可以根据数据表中销售额以及顾客信息，使用window方程查找出服装、食品各板块消费前10%的顾客。

```auto
with sale_by_customer as (
  (select "顾客序号", sum("件数"*"价格") as "销售额", cast('服装' as varchar(5)) as "销售种类" 
    from "服装销售数据"."交易数据_2020_2023" as a
  left join "服装销售数据"."服装产品数据" as b 
    on a."产品编号" = b."产品编号" 
    group by "顾客序号" 
    order by "销售额" desc, "顾客序号")
UNION
  (select "顾客序号", sum("件数"*"价格") as "销售额", cast('食品' as varchar(5)) as "销售种类" 
    from "食品销售数据"."交易数据_2020_2023" as a
  left join "食品销售数据"."食品产品数据" as b 
    on a."产品编号" = b."产品编号" 
    group by "顾客序号" 
    order by "销售额" desc, "顾客序号")),
customer_ranking as (
  select *, row_number() over (partition by "销售种类" order by "销售额" desc) as ranking, count(*) over (partition by "销售种类") as cnt -- (select count(*) as cnt from clothes_sale_by_customer) as cnt 
  from sale_by_customer)
select c."顾客序号","顾客姓名","生日","注册日期","省份","城市","地区","地址", "销售种类" as "vip销售种类"
  from customer_ranking as c
  left join "顾客数据"."顾客数据_2020_2023" as d
    on c."顾客序号" = d."顾客序号"
  where cast(ranking as decimal)/cnt <= 0.1
;
```

该查询语句的结果如下，顾客姓名、生日、地址、注册日期均为虚构数据。

![](https://www.openpie.com/imgs/81949a8a-29fd-e21a-9f7e-3d5f6ef76388)

这些用户都是服装、食品各板块的优质客户，为了提升回购率，我们可以考虑给这些用户发放优惠政策，鼓励这些用户回购。

## **查询评估**

点击左侧菜单栏的「查询历史」，即可根据状态以及执行日期查询先前SQL任务的请求历史。

![](https://www.openpie.com/imgs/da10125d-007e-99ce-95fa-94e12d97ca44)

「查询历史」提供SQL任务执行信息、状态、时间等信息，试用版会为用户保留历史请求结果集的下载功能，但可供下载的结果集大小不可超过100MB。

点击SQL文本可提供SQL任务的详细信息。

![](https://www.openpie.com/imgs/f7727752-e1d7-ad7e-bfbf-9ffd33cbb90d)

如图所示，SQL文本上侧为任务详情，右上角的两个按钮分别提供在「数据洞察」中打开该文本和复制文本的功能。

## **结语**

至此，我们完成了在PieCloudDB上进行数据实例的演示。欢迎大家登录<u>[拓数派官网](https://www.openpie.com/)</u>免费试用PieCloudDB「云上云」版，开启属于自己的的数据探索之旅。 
