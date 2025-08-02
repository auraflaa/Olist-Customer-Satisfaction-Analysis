# Olist Customer Satisfaction Analysis

## 1. Scenario & Introduction

As a Data Analyst on the Operations & Strategy Team at Olist, I was tasked with analyzing the complete order lifecycle to identify the main causes of poor customer satisfaction. This analysis aims to provide data-driven insights to guide strategic decisions on improving the overall health and efficiency of the marketplace.

*For a comprehensive deep dive into Olist's business model, history, and competitive landscape, please see the [**full business analysis here**](./Olist_Business_Analysis.md).*

---

## 2. The Business Task (Ask)

The central business question for this analysis is: **"What are the key drivers of negative customer reviews, and how can we use these insights to improve the overall customer experience?"**

This was investigated by focusing on three guiding questions:
1.  How does delivery performance impact review scores?
2.  Do certain product categories receive more negative reviews?
3.  Are there geographic "hotspots" of poor seller performance?

---

## 3. Methodology (Prepare & Process)

The analysis was conducted using a multi-tool workflow to mirror a professional data environment.

* **Data Warehousing (BigQuery & SQL):** The raw, multi-table dataset from Kaggle was loaded into BigQuery. SQL was used to perform all data cleaning, joining, and feature engineering. Key steps included handling incomplete data, ensuring geographic accuracy by averaging coordinates, and creating new features like `delivery_diff_days` and `seller_processing_days`.
* **Analysis & Visualization (R & Tableau):** The final, cleaned datasets were analyzed and visualized using R (`ggplot2`) to create static plots for a reproducible report and Tableau for an interactive dashboard.

---

## 4. Analysis & Sharing

The analysis revealed three primary drivers of customer dissatisfaction. The findings were consolidated into two key deliverables designed for different audiences: a comprehensive, reproducible report for a technical audience, and an interactive dashboard for business stakeholders.

### Key Findings
1.  **Late Delivery is the Primary Cause:** The data shows an undeniable correlation between delivery delays and negative reviews.
2.  **Product Quality is a Secondary Factor:** Certain product categories consistently underperform, suggesting issues with product quality or damage.
3.  **Seller Performance Varies Geographically:** Seller performance is not uniform, with clear "hotspots" of negative reviews concentrated in specific regions.

### Final Deliverables
* **[View the full hosted report (index.html)](https://auraflaa.github.io/Olist-Customer-Satisfaction-Analysis/)**
* **[Explore the interactive Tableau Dashboard](https://public.tableau.com/views/OlistDataAnalysis_17541543662870/TheBusinessProblem?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)**
* **[Access the public BigQuery Project](https://console.cloud.google.com/bigquery?inv=1&invt=Ab4UiQ&project=olist-customer-analysis)**

---

## 5. Recommendations (Act)

Based on the findings, three actionable recommendations are proposed:

1.  **Launch a Tiered Seller Performance Program:** Incentivize and reward sellers who consistently ship orders quickly to directly address the primary cause of negative reviews.
2.  **Conduct a Targeted Quality Audit:** Initiate a quality review of the top 3-5 underperforming product categories to address issues beyond shipping.
3.  **Optimize Regional Logistics:** Re-evaluate and strengthen logistics partnerships in the identified geographic hotspots to improve delivery reliability.

