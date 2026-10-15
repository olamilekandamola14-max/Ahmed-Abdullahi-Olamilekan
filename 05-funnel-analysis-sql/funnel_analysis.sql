CREATE DATABASE funnel_analysis;
USE funnel_analysis;

-- Q1 unique events: one row per user_pseudo_id per event_name (earliest event_timestamp)
CREATE TABLE funnel_events AS SELECT * FROM (SELECT r.*, ROW_NUMBER() OVER (PARTITION BY user_pseudo_id, event_name 
ORDER BY event_timestamp) AS row_num
    FROM raw_events AS r
    WHERE user_pseudo_id IS NOT NULL
	AND event_name IS NOT NULL
) AS ranked_events
WHERE row_num = 1;

SELECT * FROM (SELECT r.*, ROW_NUMBER() OVER (PARTITION BY user_pseudo_id, event_name 
ORDER BY event_timestamp) AS row_num
    FROM raw_events AS r
    WHERE user_pseudo_id IS NOT NULL
	AND event_name IS NOT NULL
) AS ranked_events
WHERE row_num = 1;

-- Q2 top 3 countries by total events
SELECT country, COUNT(*) AS total_events,
ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC, country ASC) AS country_rank
FROM raw_events GROUP BY country ORDER BY total_events DESC, country ASC LIMIT 3;

-- Q3 funnel table
SELECT country, event_name,
COUNT(*) AS event_count
FROM funnel_events
WHERE event_name IN (
    'page_view',
    'view_item',
    'add_to_cart',
    'begin_checkout',
    'add_payment_info',
    'purchase'
)
AND country IN ('United States', 'India', 'Canada')
GROUP BY
    country,
    event_name
ORDER BY
    country,
    CASE event_name
        WHEN 'page_view' THEN 1
        WHEN 'view_item' THEN 2
        WHEN 'add_to_cart' THEN 3
        WHEN 'begin_checkout' THEN 4
        WHEN 'add_payment_info' THEN 5
        WHEN 'purchase' THEN 6
    END;
    
    -- ================================================
    -- Ideas for other slices (distinct users per funnel stage, unique_events)
    
    -- Top 4 Device OS funnel analysis
    SELECT operating_system AS `Device OS`,
    SUM(CASE WHEN event_name = 'page_view'
        THEN 1 ELSE 0 END) AS page_view,
    SUM(CASE WHEN event_name = 'view_item'
        THEN 1 ELSE 0 END) AS view_item,
    SUM(CASE WHEN event_name = 'add_to_cart'
        THEN 1 ELSE 0 END) AS add_to_cart,
    SUM(CASE WHEN event_name = 'begin_checkout'
        THEN 1 ELSE 0 END) AS begin_checkout,
    SUM(CASE WHEN event_name = 'add_payment_info'
        THEN 1 ELSE 0 END) AS add_payment_info,
    SUM(CASE WHEN event_name = 'purchase'
        THEN 1 ELSE 0 END) AS purchase
FROM funnel_events
WHERE operating_system IS NOT NULL
  AND event_name IN (
      'page_view',
      'view_item',
      'add_to_cart',
      'begin_checkout',
      'add_payment_info',
      'purchase')
GROUP BY operating_system
ORDER BY page_view desc limit 4;

-- medium funnel analysis
   SELECT medium AS `traffic_medium`,
    SUM(CASE WHEN event_name = 'page_view'
        THEN 1 ELSE 0 END) AS page_view,
    SUM(CASE WHEN event_name = 'view_item'
        THEN 1 ELSE 0 END) AS view_item,
    SUM(CASE WHEN event_name = 'add_to_cart'
        THEN 1 ELSE 0 END) AS add_to_cart,
    SUM(CASE WHEN event_name = 'begin_checkout'
        THEN 1 ELSE 0 END) AS begin_checkout,
    SUM(CASE WHEN event_name = 'add_payment_info'
        THEN 1 ELSE 0 END) AS add_payment_info,
    SUM(CASE WHEN event_name = 'purchase'
        THEN 1 ELSE 0 END) AS purchase
FROM funnel_events
WHERE medium IS NOT NULL
  AND event_name IN (
      'page_view',
      'view_item',
      'add_to_cart',
      'begin_checkout',
      'add_payment_info',
      'purchase')
GROUP BY medium
ORDER BY page_view desc;

-- Top 4 Browser funnel analysis
SELECT browser,
    SUM(CASE WHEN event_name = 'page_view'
        THEN 1 ELSE 0 END) AS page_view,
    SUM(CASE WHEN event_name = 'view_item'
        THEN 1 ELSE 0 END) AS view_item,
    SUM(CASE WHEN event_name = 'add_to_cart'
        THEN 1 ELSE 0 END) AS add_to_cart,
    SUM(CASE WHEN event_name = 'begin_checkout'
        THEN 1 ELSE 0 END) AS begin_checkout,
    SUM(CASE WHEN event_name = 'add_payment_info'
        THEN 1 ELSE 0 END) AS add_payment_info,
    SUM(CASE WHEN event_name = 'purchase'
        THEN 1 ELSE 0 END) AS purchase
FROM funnel_events
WHERE browser IS NOT NULL
  AND event_name IN (
      'page_view',
      'view_item',
      'add_to_cart',
      'begin_checkout',
      'add_payment_info',
      'purchase')
GROUP BY browser
ORDER BY page_view desc limit 4;
    