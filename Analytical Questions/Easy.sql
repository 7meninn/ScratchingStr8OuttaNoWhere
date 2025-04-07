-- 1. Return the total number of comments received for each user in the 30 or less days before 2020-02-10. Don't output users who haven't received any comment in the defined time period.

SELECT 
    user_id, 
    SUM(number_of_comments) AS total_comments
FROM 
    fb_comments_count
WHERE 
    created_at BETWEEN '2020-01-11' AND '2020-02-10'
GROUP BY 
    user_id
HAVING 
    total_comments > 0;


-- 2. Return a distribution of users activity per day of the month. By distribution we mean the number of posts per day of the month.

SELECT 
    EXTRACT(DAY FROM post_date) AS day_of_the_month,
    COUNT(post_id) AS posts_count
FROM 
    facebook_posts
GROUP BY 
    day_of_the_month
ORDER BY 
    day_of_the_month;


-- 3. Find users who are both a viewer and streamer. (Here maybe the question wants us to find a user who is streaming and viewing at the same time interval. If you will submit it on your account then do let me know! on bimaltyagi333@gmail.com and I'll update accordingly.)

SELECT user_id
FROM twitch_sessions
WHERE session_type IN ('viewer', 'streamer')
GROUP BY user_id
HAVING COUNT(DISTINCT session_type) = 2;

-- 4. Calculate the average session duration (in seconds) for each session type?

SELECT 
    session_type,
    AVG(TIMESTAMPDIFF(SECOND, session_start, session_end)) AS avg_duration_seconds
FROM 
    twitch_sessions
GROUP BY 
    session_type;


-- 5. 