SELECT 
 od.order_id,
 oid.product_id,
 sd.seller_id,
 sd.seller_zip_code_prefix,
 sd.seller_city,
 sd.seller_state,
 gd.geolocation_lat,
 gd.geolocation_lng,
 ord.review_score,
 CASE
  WHEN (ord.review_score) > 0 AND (ord.review_score) <= 2 THEN 'NEGATIVE'
  WHEN (ord.review_score) > 2 AND (ord.review_score) < 4 THEN 'NEUTRAL'
  WHEN (ord.review_score) >= 4  AND (ord.review_score) <= 5 THEN 'POSITIVE'
  ELSE 'INVALID'
  END AS review_remarks
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
 order by review_score;