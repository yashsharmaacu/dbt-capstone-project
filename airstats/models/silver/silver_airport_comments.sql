{{
    config(
        materialized='incremental'
    )
}}

with comments as (
    select * from {{ ref('src_airport_comments') }}
)

select
    comment_id,
    airport_ident,
    comment_timestamp,
    case
        when member_nickname is null or member_nickname = '' then '__UNKNOWN__'
        else member_nickname
    end as member_nickname,
    comment_subject,
    comment_body,
    current_timestamp as loaded_at
from
    comments
where
    comment_body is not null
    and comment_body <> ''

{% if is_incremental() %}

and (
    (select max(comment_id) from {{ this }}) is null
    or comment_id > (select max(comment_id) from {{ this }})
)

{% endif %}