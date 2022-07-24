/*
    Now we will go through another example where we will generate a series of date
    in a year starting from Jan 1
*/



with DateSeries as(
    Select CAST('01-01-2021' as date) as MyDate -- anchor member
    union all -- followed by UNION ALL

    select DATEADD(DAY,1,MyDate)
    from DateSeries
    where MyDate < CAST('12-31-2021' as Date)
)

select MyDate from Dateseries  
OPTION(MaxRecursion 365)