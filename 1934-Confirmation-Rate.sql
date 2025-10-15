select
    signups.user_id,
    round(avg(if(action='confirmed',1,0)),2) as confirmation_rate
from
    signups
left join   
    confirmations
    on
    signups.user_id = confirmations.user_id
group by
    user_id;
