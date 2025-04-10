# Yelp Data Analytics End-to-End 🚀

This project showcases an end-to-end data analytics pipeline using Yelp's open datasets, with Snowflake as the core data platform. It includes data ingestion, transformation, sentiment analysis with Python UDFs, and insightful SQL analytics—all inspired by [Ankit Bansal's YouTube tutorial](https://www.youtube.com/watch?v=oXLxbk5USFg).

---

## 📦 Dataset

- `yelp_academic_dataset_business.json`
- `split_file_1.json` (from `yelp_academic_dataset_review.json`)

Both datasets come from the official [Yelp Open Dataset](https://www.yelp.com/dataset).

---

## 🔧 Tech Stack

- **Snowflake** – Cloud Data Warehouse
- **AWS S3** – Storage for raw data
- **SQL** – Data transformation and querying
- **Python (TextBlob)** – Sentiment analysis via Snowflake UDF

---

## 📂 Project Structure


---

## 🚀 Steps Covered

1. **Upload Yelp data to S3**
2. **Load data from S3 to Snowflake**
3. **Flatten and transform JSON fields**
4. **Create Python UDF for sentiment classification**
5. **Run analytical SQL queries**

---

## 🧠 Key SQL Insights

- Number of businesses by category
- Top users reviewing "Restaurants"
- Popular business categories by review count
- Top 3 most recent reviews per business
- Month with the most reviews
- % of 5-star reviews per business
- Top businesses with positive sentiment

---

## 🧪 Sentiment Analysis (Python UDF)

```python
from textblob import TextBlob
def sentiment_analyzer(text):
    analysis = TextBlob(text)
    if analysis.sentiment.polarity > 0:
        return 'Positive'
    elif analysis.sentiment.polarity == 0:
        return 'Neutral'
    else:
        return 'Negative'
