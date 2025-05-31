delete from FactSales

insert into dbo.FactSales(TimeKey)
select DATEPART(hour, date_sales)*60*60
      + DATEPART(minute, date_sales)*60
      + DATEPART(second, date_sales) as TimeKey
from FactSales

