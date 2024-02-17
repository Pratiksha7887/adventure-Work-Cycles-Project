
SELECT * FROM dimcustomer;
SELECT * FROM dimdate;
SELECT * FROM dimproduct;
SELECT * FROM dimproductcategory;
SELECT * FROM dimproductsubcategory;
SELECT * FROM dimsalesterritory;
SELECT * FROM fact_internet_sales_new;
SELECT * FROM factinternetsales;

#-----KPI----#

Select * from fact_internet_sales_new;

#----SALES AMOUNT-----
select round(sum(SalesAmount)) as "Sales Amt" from fact_internet_sales_new; 
select round(Avg(SalesAmount)) as "Avg Sales Amt" from fact_internet_sales_new; 

#-----PROFIT-----
select round(sum(SalesAmount-TotalProductCost)) as "Profit Amt" from fact_internet_sales_new;
select concat(round(sum(SalesAmount-TotalProductCost)/100),'%') as "Overall Profit %" from fact_internet_sales_new; 
select concat(round(Avg(SalesAmount-TotalProductCost),2),'%') as "Avg Profit %" from fact_internet_sales_new;

#---DISCOUNT----
select round(sum(DiscountAmount)) as "Discount Amt" from fact_internet_sales_new;

#-----TAX----
select round(sum(TaxAmt)) as "Tax Amt" from fact_internet_sales_new;

#----PRODUCT COST-----
select round(sum(TotalProductCost)) as "Total Product Cost" from fact_internet_sales_new;
select round(Avg(TotalProductCost)) as "Avg Product Cost" from fact_internet_sales_new;

#-----ORDER QUANTITY------
select count(OrderQuantity) as "Count of Order Quantity" from fact_internet_sales_new;

select distinct(count(ProductKey)) as "Count of Product" from fact_internet_sales_new;


#-------TOP 10 PRODUCT SALES------#
SELECT * FROM dimproduct;
SELECT 
    f.productkey AS productkey, d.EnglishProductName as "Product Name",
    count(f.SalesOrderLineNumber) AS TotalSalesOrderLineNumber
FROM 
    fact_internet_sales_new f
JOIN 
    dimproduct d ON f.productkey = d.productkey
GROUP BY 
    f.productkey, d.EnglishProductName
ORDER BY 
    TotalSalesOrderLineNumber DESC
LIMIT 10;  

    
