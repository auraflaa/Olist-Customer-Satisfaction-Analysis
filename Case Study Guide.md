# Case Study: Improving Customer Satisfaction on the Olist E-commerce Marketplace

### 1. Scenario

You are a new Data Analyst at **Olist**, one of Brazil's largest e-commerce marketplaces. Olist operates as a platform that connects thousands of small businesses (sellers) to customers across the country. Your role is on the **Operations & Strategy Team**, which is focused on improving the overall health and efficiency of the marketplace.

The Head of Strategy has identified that customer satisfaction is a key driver of repeat business and long-term growth. However, internal reports suggest that negative reviews are on the rise, and they seem to be linked to shipping and delivery issues. Your task is to analyze the complete order lifecycle—from purchase to delivery and subsequent review—to identify the main causes of poor customer satisfaction. Your findings will guide strategic decisions on which operational areas to improve, which sellers to support, and how to set better delivery expectations for customers.

### 2. The Business Task (Ask)

Your manager has assigned you a primary business question: **"What are the key drivers of negative customer reviews, and how can we use these insights to improve the overall customer experience?"**

To answer this, your analysis should investigate these guiding questions:
1.  How does the actual delivery time compared to the estimated delivery time impact customer review scores?
2.  Are there specific product categories that consistently receive lower review scores?
3.  Do sellers from certain geographic regions have a higher rate of negative reviews or shipping delays?

### 3. The Data (Prepare)

You will use the official **Brazilian E-commerce Public Dataset by Olist**. This is a real, anonymized dataset hosted on Kaggle, a popular platform for data science projects.

* **Primary Dataset Link:** [**Brazilian E-commerce Public Dataset by Olist on Kaggle**](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

This dataset is a collection of 9 separate `.csv` files that are linked together, similar to tables in a database. A key part of your project will be understanding this relationship and joining the files. The most important files for this analysis are:
* `olist_orders_dataset.csv`
* `olist_order_reviews_dataset.csv`
* `olist_order_items_dataset.csv`
* `olist_products_dataset.csv`
* `olist_sellers_dataset.csv`

### 4. The Tools (Process)

During the processing phase, you will need to clean the data and merge these files. This is a critical step that recruiters love to see. Here are some recommended tools:

* **Programming Languages:**
    * [**Python**](https://www.python.org/) with libraries like [**Pandas**](https://pandas.pydata.org/) (for data manipulation) and [**Jupyter Notebook**](https://jupyter.org/) (for structuring your analysis).
    * [**R**](https://www.r-project.org/) with [**RStudio Desktop**](https://posit.co/download/rstudio-desktop/) and the `tidyverse` package.
* **Database Tools:**
    * You could also load the data into a SQL database like [**PostgreSQL**](https://www.postgresql.org/) and use `JOIN` statements to combine the tables.

### 5. Analysis & Sharing

Your analysis should focus on correlating operational data (like shipping times) with customer sentiment data (review scores). Once your analysis is complete, you will need to create visualizations to share your findings.

* **Suggested Analysis:**
    * Calculate a "delivery delta" by subtracting the actual delivery date from the estimated delivery date.
    * Group orders by review score (e.g., 1-2 stars = "Negative", 3 = "Neutral", 4-5 = "Positive").
    * Analyze the average delivery delta for each review score group.
    * Investigate if certain product categories or seller regions correlate with lower scores.
* **Visualization Tools:**
    * Python libraries like [**Matplotlib**](https://matplotlib.org/) and [**Seaborn**](https://seaborn.pydata.org/).
    * [**Tableau Public**](https://public.tableau.com/en-us/s/) or [**Microsoft Power BI**](https://powerbi.microsoft.com/en-us/desktop/) for creating interactive dashboards.

### 6. Deliverables (Act)

Your final project should be a detailed report, dashboard, or presentation that includes:
1.  A clear summary of the business problem and your approach.
2.  Documentation of your data cleaning, preparation, and merging process. This is very important.
3.  Key visualizations showing the relationship between delivery performance, product category, and customer satisfaction.
4.  **Three actionable recommendations** for the Olist strategy team.
5.  A link to your project on your portfolio, hosted on a platform like [**GitHub**](https://github.com/).
