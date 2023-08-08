-- Step 1: create database
create database 线上销售数据;


-- Step 2: create schema
create schema 服装销售数据;
create schema 食品销售数据;
create schema 顾客数据;


-- Step 3: create tables under each schema created above
-- Customer data
create table "顾客数据"."顾客数据_2020_2023" (
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

-- Clothing sector data
create table "服装销售数据"."服装产品数据" (
  产品编号 VARCHAR(10) NOT NULL,
  颜色 VARCHAR(5),
  类型 VARCHAR(5),
  价格 FLOAT,
  库存 INT,
  产品图片 TEXT
);

create table "服装销售数据"."交易数据_2020_2023" (
  交易编号 VARCHAR(10) NOT NULL,
  顾客序号 VARCHAR(10) NOT NULL,
  产品编号 VARCHAR(10) NOT NULL,
  交易日期 VARCHAR(10),
  交易时间 TIME,
  件数 INT,
  平台 VARCHAR(5)
);

-- Food sector data
create table "食品销售数据"."食品产品数据" (
  产品编号 VARCHAR(10) NOT NULL,
  原料 VARCHAR(5),
  类型 VARCHAR(5),
  价格 FLOAT,
  库存 INT,
  产品图片 TEXT
);

create table "食品销售数据"."交易数据_2020_2023" (
  交易编号 VARCHAR(10) NOT NULL,
  顾客序号 VARCHAR(10) NOT NULL,
  产品编号 VARCHAR(10) NOT NULL,
  交易日期 VARCHAR(10),
  交易时间 TIME,
  件数 INT,
  平台 VARCHAR(5)
);


-- Step 4: create views based on tables above
-- Full view on clothing sector transactions
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

-- Full view on food sector transactions
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


-- Step 5: query against tables & views
-- Top selling cities across the platform (clothing + food sector)
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

-- VIP customers: top 10% customers who made the highest purchases in either clothing or food sector
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
  where cast(ranking as decimal)/cnt <= 0.1;