with view as (
    SELECT contents,    
    ROUND ((LENGTH(contents) - LENGTH( REPLACE ( contents, "bull", "") ) ) 
    / LENGTH("bull")) AS count_bull,
    ROUND ((LENGTH(contents) - LENGTH( REPLACE ( contents, "bear", "") ) ) 
    / LENGTH("bear")) AS count_bear
    from google_file_store
)

select "bull" as word , sum(count_bull) as nentry from view
union
select "bear" as word , sum(count_bear) as nentry from view
