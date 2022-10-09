-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
select cf_id, backers_count
from campaign
where outcome = 'live'
order by backers_count desc;

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
select b.cf_id, count(b.cf_id)
from backers as b
inner join campaign as c
on b.cf_id = c.cf_id
where c.outcome = 'live'
group by b.cf_id
order by count(b.cf_id) desc;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
select co.first_name, co.last_name, co.email, ca.goal - ca.pledged as "Remaining Goal Amount"
into email_contacts_remaining_goal_amount
from campaign as ca
inner join contacts as co
on ca.contact_id = co.contact_id
where ca.outcome = 'live'
order by "Remaining Goal Amount" desc;

-- Check the table
select * from email_contacts_remaining_goal_amount;

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
select b.email, b.first_name, b.last_name, b.cf_id, ca.company_name, ca.description, ca.end_date, ca.goal - ca.pledged as "Left of Goal"
into email_backers_remaining_goal_amount
from campaign as ca
inner join backers as b
on ca.cf_id = b.cf_id
where ca.outcome = 'live'
order by b.email desc;


-- Check the table
select * from email_backers_remaining_goal_amount;
