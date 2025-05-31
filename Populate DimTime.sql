delete from DimTime

declare @DimTimeKey int, @Date datetime, @AM char(2), 
	@hour24 tinyint, @hour tinyint, @minute tinyint, @second int
set @DimTimeKey = 0

while @DimTimeKey < (60*60*24)
begin
	set @DimTimeKey = @DimTimeKey + 1
	set @Date = DATEADD(second,@DimTimeKey,convert(datetime, '1/1/2007'))
	set @AM = right(convert(varchar,@Date,109),2)
	set @hour24 = DATEPART(hour, @Date)
	set @hour = case when @AM = 'PM' then @hour24 - 12 else @hour24 end
	set @minute = DATEPART(minute, @Date)
	set @second = DATEPART(second, @Date)

	insert into dbo.DimTime(DimTimeKey,Time,Time24,HourName,MinuteName,MinuteKey,Hour,Hour24,Minute,Second,AM)
	select	@DimTimeKey, 
			Time = right('0' + convert(varchar,@hour),2) 
				+ ':' + right('0' + convert(varchar,@minute),2)  
				+ ':' + right('0' + convert(varchar,@second),2) + ' ' + @AM,
			Time24 = convert(varchar,@Date,108), 
			HourName = right('0' + convert(varchar,@hour),2) + ' ' + @AM,
			MinuteName = right('0' + convert(varchar,@hour),2) 
				+ ':' + right('0' + convert(varchar,@minute),2)+ ' ' + @AM,
			MinuteKey = (@hour24*60) + @minute,
			@hour, @hour24, @minute, @second, @AM
end

select *
from DimTime
where AM = 'AM'


