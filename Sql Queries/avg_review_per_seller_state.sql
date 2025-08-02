SELECT 
 sd.seller_state,
 avg(ord.review_score) as avg_review_score,
 CASE
  WHEN avg(ord.review_score) > 0 AND avg(ord.review_score) <= 2 THEN 'NEGATIVE'
  WHEN avg(ord.review_score) > 2 AND avg(ord.review_score) < 4 THEN 'NEUTRAL'
  WHEN avg(ord.review_score) >= 4  AND avg(ord.review_score) <= 5 THEN 'POSITIVE'
  ELSE 'INVALID'
  END AS review_category
 FROM 
 `olist-customer-analysis.Brazilian_E_Commerce_Public_Dataset_by_Olist.olist_order_reviews_data` as ord
 JOIN
 `olist-customer-analysis.Brazilian_E_Commerce_Public_Dataset_by_Olist.olist_orders_data` as od
 ON ord.order_id=od.order_id
 JOIN
 `olist-customer-analysis.Brazilian_E_Commerce_Public_Dataset_by_Olist.olist_order_items_data` as oid
 ON od.order_id=oid.order_id
 JOIN
 `olist-customer-analysis.Brazilian_E_Commerce_Public_Dataset_by_Olist.olist_sellers_data` as sd
 ON oid.seller_id=sd.seller_id
 JOIN `olist-customer-analysis.Brazilian_E_Commerce_Public_Dataset_by_Olist.olist_geolocation_data` as gd
 ON gd.geolocation_zip_code_prefix=sd.seller_zip_code_prefix
 GROUP BY seller_state
 ORDER BY avg(ord.review_score);