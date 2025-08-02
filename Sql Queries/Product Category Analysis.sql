SELECT  
  pd.product_category_name,
  IFNULL(pcnt.product_category_name_english, pd.product_category_name) AS category_name_display,
  AVG(ord.review_score) AS avg_review_score,
  CASE
   WHEN AVG(ord.review_score) > 0 AND AVG(ord.review_score) <=2 THEN 'NEGATIVE'
   WHEN AVG(ord.review_score) > 2 AND AVG(ord.review_score) <4 THEN 'NEUTRAL'
   WHEN AVG(ord.review_score) >= 4  AND AVG(ord.review_score) <=5 THEN 'POSITIVE'
   ELSE 'INVALID'
   END AS review_category
FROM 
  `olist-customer-analysis.Brazilian_E_Commerce_Public_Dataset_by_Olist.product_category_name_translation` AS pcnt
RIGHT JOIN
  `olist-customer-analysis.Brazilian_E_Commerce_Public_Dataset_by_Olist.olist_products_data` AS pd
    ON pcnt.product_category_name = pd.product_category_name
JOIN
  `olist-customer-analysis.Brazilian_E_Commerce_Public_Dataset_by_Olist.olist_order_items_data` AS oid
    ON pd.product_id = oid.product_id
JOIN
  `olist-customer-analysis.Brazilian_E_Commerce_Public_Dataset_by_Olist.olist_orders_data` AS od
    ON oid.order_id = od.order_id
JOIN
  `olist-customer-analysis.Brazilian_E_Commerce_Public_Dataset_by_Olist.olist_order_reviews_data` AS ord
    ON od.order_id = ord.order_id
WHERE 
  pd.product_category_name IS NOT NULL
GROUP BY 
  pd.product_category_name,
  category_name_display
ORDER BY 
  avg_review_score;




SELECT  
  pd.product_id,
  oid.order_id,
  pd.product_category_name,
  IFNULL(pcnt.product_category_name_english, pd.product_category_name) AS category_name_display,
  ord.review_score,
  CASE
   WHEN (ord.review_score) > 0 AND (ord.review_score) <=2 THEN 'NEGATIVE'
   WHEN (ord.review_score) > 2 AND (ord.review_score) <4 THEN 'NEUTRAL'
   WHEN (ord.review_score) >= 4  AND (ord.review_score) <=5 THEN 'POSITIVE'
   ELSE 'INVALID'
   END AS review_category
FROM 
  `olist-customer-analysis.Brazilian_E_Commerce_Public_Dataset_by_Olist.product_category_name_translation` AS pcnt
RIGHT JOIN
  `olist-customer-analysis.Brazilian_E_Commerce_Public_Dataset_by_Olist.olist_products_data` AS pd
    ON pcnt.product_category_name = pd.product_category_name
JOIN
  `olist-customer-analysis.Brazilian_E_Commerce_Public_Dataset_by_Olist.olist_order_items_data` AS oid
    ON pd.product_id = oid.product_id
JOIN
  `olist-customer-analysis.Brazilian_E_Commerce_Public_Dataset_by_Olist.olist_orders_data` AS od
    ON oid.order_id = od.order_id
JOIN
  `olist-customer-analysis.Brazilian_E_Commerce_Public_Dataset_by_Olist.olist_order_reviews_data` AS ord
    ON od.order_id = ord.order_id
WHERE 
  pd.product_category_name IS NOT NULL
ORDER BY 
  ord.review_score;
