SELECT activity_date as day, COUNT(DISTINCT user_id)as active_users
FROM Activity 
WHERE ( activity_date BETWEEN '2019-07-27'-INTERVAL 29 day AND '2019-07-27' )
    AND activity_type IN ('open_session', 'end_session', 'scroll_down', 'send_message')
GROUP BY activity_date;