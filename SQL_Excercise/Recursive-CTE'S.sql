/*
    For our first example we will simply try to generate a series of numbers
    from 0 to 100 , so our final o/p will be a single column with 100 rows 
    one for each number in the series.

    while working with CTE'S we will think off that these CTE'S are divided into
    three components
    1. The first is the Anchor Member i.e the rest of the series is built upon
    2. Then it is added with 'UNION ALL' method 
    3. Now the rest component of CTE is called recursive member
*/
with NumberSeries as(
    select 1 as MyNumber -- anchor member
    union all            -- followed by UNION ALL

    select MyNumber+1    -- recursive member
    from NumberSeries
    where MyNumber<100
)

select MyNumber from NumberSeries
-----------------------------------------------------

