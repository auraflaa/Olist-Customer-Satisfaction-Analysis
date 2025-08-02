SELECT 
  seller_zip_code_prefix,
  AVG(geolocation_lat) AS geolocation_lat,
  AVG(geolocation_lng) AS geolocation_lng,
  AVG(review_score)     AS avg_review_score
FROM 
  `olist-customer-analysis.Clean_and_Merged_Datasets.geolocation_distribution_of_reviews`
GROUP BY 
  seller_zip_code_prefix;


SELECT 
  seller_state,
  AVG(geolocation_lat) AS geolocation_lat,
  AVG(geolocation_lng) AS geolocation_lng,
  AVG(review_score)     AS avg_review_score
FROM 
  `olist-customer-analysis.Clean_and_Merged_Datasets.geolocation_distribution_of_reviews`
GROUP BY 
  seller_state;


SELECT 
  seller_state,
  seller_zip_code_prefix,
  AVG(geolocation_lat) AS geolocation_lat,
  AVG(geolocation_lng) AS geolocation_lng,
  AVG(review_score) AS avg_review_score,
   CASE
  WHEN AVG(review_score) > 0 AND AVG(review_score) <= 2 THEN 'NEGATIVE'
  WHEN AVG(review_score) > 2 AND AVG(review_score) < 4 THEN 'NEUTRAL'
  WHEN AVG(review_score) >= 4  AND AVG(review_score) <= 5 THEN 'POSITIVE'
  ELSE 'INVALID'
  END AS review_category
FROM 
  `olist-customer-analysis.Clean_and_Merged_Datasets.geolocation_distribution_of_reviews`
GROUP BY 
  seller_state,
  seller_zip_code_prefix
ORDER BY
  seller_state,
  seller_zip_code_prefix;

SELECT
  seller_state,
  seller_zip_code_prefix,
  AVG(geolocation_lat) AS geolocation_lat,
  AVG(geolocation_lng) AS geolocation_lng,
  COUNT(*) AS total_reviews,
  ROUND(AVG(review_score),2) as avg_review_score,
  -- Calculate the percentage of reviews that are 1 or 2 stars
  ROUND(SAFE_DIVIDE(
    COUNTIF(review_score <= 2),
    COUNT(*)
  ) * 100, 2) AS percentage_negative_reviews
FROM
  `olist-customer-analysis.Clean_and_Merged_Datasets.geolocation_distribution_of_reviews`
GROUP BY
  seller_state,
  seller_zip_code_prefix
ORDER BY
  seller_state,
  seller_zip_code_prefix;