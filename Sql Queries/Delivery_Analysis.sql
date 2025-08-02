SELECT 
  order_id,
  customer_id,
  order_purchase_timestamp,
  order_delivered_carrier_date,
  DATE_DIFF(order_delivered_carrier_date, order_purchase_timestamp, DAY) AS seller_processing_days,
  order_delivered_customer_date,
  order_estimated_delivery_date, 
  DATE_DIFF(order_delivered_customer_date, order_estimated_delivery_date, DAY) AS delivery_diff_days,
  CASE
    WHEN DATE_DIFF(order_delivered_customer_date, order_estimated_delivery_date, DAY) > 0 THEN 'LATE'
    WHEN DATE_DIFF(order_delivered_customer_date, order_estimated_delivery_date, DAY) < 0 THEN 'EARLY'
    ELSE 'ON_TIME'
  END as Delivery_status
FROM 
  `olist-customer-analysis.Brazilian_E_Commerce_Public_Dataset_by_Olist.olist_orders_data`
WHERE 
  order_status != 'canceled'
  AND order_delivered_customer_date IS NOT NULL
  AND order_estimated_delivery_date IS NOT NULL;


SELECT 
  od.order_id,
  od.customer_id,
  od.order_purchase_timestamp,
  od.order_approved_at,
  DATE_DIFF(od.order_approved_at, od.order_purchase_timestamp, HOUR) AS order_approval_time_in_hours,
  order_delivered_carrier_date,
  DATE_DIFF(od.order_delivered_carrier_date, od.order_approved_at, DAY) AS order_approve_to_fulfilment_days,
  DATE_DIFF(od.order_delivered_carrier_date, od.order_purchase_timestamp, DAY) AS seller_processing_days,
  DATE_DIFF(od.order_delivered_customer_date, od.order_estimated_delivery_date, DAY) AS delivery_diff_days,
  CASE
    WHEN DATE_DIFF(od.order_delivered_customer_date, od.order_estimated_delivery_date, DAY) > 0 THEN 'LATE'
    WHEN DATE_DIFF(od.order_delivered_customer_date, od.order_estimated_delivery_date, DAY) < 0 THEN 'EARLY'
    ELSE 'ON_TIME'
  END as Delivery_status,
  ord.review_score,
  CASE
   WHEN ord.review_score>0 and ord.review_score<=2 THEN 'NEGATIVE'
   WHEN ord.review_score=3 THEN 'NEUTRAL'
   WHEN ord.review_score>=4 AND ord.review_score<=5 THEN 'POSITIVE'
   ELSE 'INVALID'
   END AS review_marks
FROM 
  `olist-customer-analysis.Brazilian_E_Commerce_Public_Dataset_by_Olist.olist_orders_data` as od
  JOIN `olist-customer-analysis.Brazilian_E_Commerce_Public_Dataset_by_Olist.olist_order_reviews_data` as ord
  ON od.order_id=ord.order_id
WHERE 
  order_status != 'canceled'
  AND order_delivered_customer_date IS NOT NULL
  AND order_estimated_delivery_date IS NOT NULL;


SELECT 
  od.order_id,
  od.customer_id,
  DATE_DIFF(od.order_approved_at, od.order_purchase_timestamp, HOUR) AS order_approval_time_in_hours,
  DATE_DIFF(od.order_delivered_carrier_date, od.order_approved_at, DAY) AS order_approve_to_fulfilment_days,
  DATE_DIFF(od.order_delivered_carrier_date, od.order_purchase_timestamp, DAY) AS seller_processing_days,
  DATE_DIFF(od.order_delivered_customer_date, od.order_estimated_delivery_date, DAY) AS delivery_diff_days,
  CASE
    WHEN DATE_DIFF(od.order_delivered_customer_date, od.order_estimated_delivery_date, DAY) > 0 THEN 'LATE'
    WHEN DATE_DIFF(od.order_delivered_customer_date, od.order_estimated_delivery_date, DAY) < 0 THEN 'EARLY'
    ELSE 'ON_TIME'
  END as Delivery_status,
  ord.review_score,
  CASE
   WHEN ord.review_score>0 and ord.review_score<=2 THEN 'NEGATIVE'
   WHEN ord.review_score=3 THEN 'NEUTRAL'
   WHEN ord.review_score>=4 AND ord.review_score<=5 THEN 'POSITIVE'
   ELSE 'INVALID'
   END AS review_category
FROM 
  `olist-customer-analysis.Brazilian_E_Commerce_Public_Dataset_by_Olist.olist_orders_data` as od
  JOIN `olist-customer-analysis.Brazilian_E_Commerce_Public_Dataset_by_Olist.olist_order_reviews_data` as ord
  ON od.order_id=ord.order_id
WHERE 
  order_status != 'canceled'
  AND order_delivered_customer_date IS NOT NULL
  AND order_estimated_delivery_date IS NOT NULL;