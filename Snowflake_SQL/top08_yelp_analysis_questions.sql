-- 08 questions

--1 -find number of businesses category

with cte as (
select business_id, trim(A.value) as Category
from tbl_yelp_businesses 
,lateral split_to_table(categories,',') A
)

select Category,count(*) as no_of_business
from cte
group by 1
order by 2 desc


--2 Find the top 10 users who have reviewed the most businesses in the "Restaurants" category.

select  r.user_id, count(distinct r.business_id)
from tbl_yelp_reviews r
inner join tbl_yelp_businesses b
on r.business_id = b.business_id
where b.categories ilike '%restaurants%' -- ilike use to filder data doesnt matter if the uppercase came like 'Restaurants'
group by 1
order by 2 desc
limit 10;


--3- Find the most popular categories of businesses (based on the number of reviews) .

with cte as (
select business_id, trim(A.value) as Category
from tbl_yelp_businesses 
,lateral split_to_table(categories,',') A
)

select Category, count(*) as Number_of_reviews
from cte
inner join tbl_yelp_reviews r on cte.business_id=r.business_id
group by 1
order by 2 desc
limit 10;


--4- Find the top 3 most recent reviews for each business.

with cte as (
select  r.*,b.name
, row_number() over(partition by r.business_id order by review_date desc) as rn
from tbl_yelp_reviews r
inner join tbl_yelp_businesses b
on r.business_id = b.business_id
)
select * from cte
where rn<=3


--5- Find the month with the highest number of reviews .

select month(review_date) as review_month, count(*) as no_of_reviews
from tbl_yelp_reviews
group by 1
order by 2 desc


--6 Find the percentage of 5-star reviews for each business.

select b.business_id, b.name, count(*) as total_reviews
,sum(case when r.review_stars = 5 then 1 else null end) as star5_reviews
,star5_reviews/total_reviews as precent_5_star
from tbl_yelp_reviews r
inner join tbl_yelp_businesses b
on r.business_id = b.business_id
group by 1,2
limit 10;

--7- Find the top 5 most reviewed businesses in each city.

select b.city, b.business_id, b.name, count(*) as total_reviews
from tbl_yelp_reviews r
inner join tbl_yelp_businesses b
on r.business_id = b.business_id
group by 1,2,3
order by 1
limit 10;


--8- find top 10 businesses with highest posit ve sentiment reviews

select r.business_id, b.name, count(*) as total_reviews
from tbl_yelp_reviews r
inner join tbl_yelp_businesses b on r.business_id=b.business_id
group by 1,2
order by 3 desc
limit 10;



