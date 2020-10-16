For this kata we will be using the DVD Rental database(https://www.postgresqltutorial.com/postgresql-sample-database/).

Your are working for a company that wants to reward its top 10 customers with a free gift. You have been asked to generate a simple report that returns the top 10 customers by total amount spent. Total number of payments has also been requested.

The query should output the following columns:

customer_id [int4]
email [varchar]
payments_count [int]
total_amount [float]
and has the following requirements:

only returns the 10 top customers, ordered by total amount spent
///////////////////////////////////////////////////////////////////////

select customer.customer_id,
       customer.email, 
       count(payment.customer_id) as payments_count, 
       CAST(sum(payment.amount) AS float) as total_amount
from customer inner join payment on customer.customer_id=payment.customer_id
group by customer.customer_id
ORDER BY total_amount DESC
LIMIT 10;
