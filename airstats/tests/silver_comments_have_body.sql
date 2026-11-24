select *
from {{ ref('silver_airport_comments') }}
where comment_body is null or comment_body = ''
