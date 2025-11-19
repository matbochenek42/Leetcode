--175. Combine Two Tables

# Write your MySQL query statement below

SELECT
    p.firstName,
    p.lastName,
    a.city,
    a.state
FROM
    person p
LEFT JOIN
    address a ON p.personid = a.personid



--181. Employees Earning More Than Their Managers

# Write your MySQL query statement below

SELECT
    e2.name Employee
FROM
    employee e
JOIN
    employee e2 ON e.id = e2.managerId
WHERE
    e2.salary > e.salary



--182. Duplicate Emails

# Write your MySQL query statement below

SELECT
    email
FROM
    person 
GROUP BY
    email
HAVING
    COUNT(*) > 1



--183. Customers Who Never Order

# Write your MySQL query statement below

SELECT
    c.name Customers
FROM
    customers c
LEFT JOIN
    orders o ON o.customerid = c.id
WHERE
    o.customerid IS NULL



--511. Game Play Analysis I

# Write your MySQL query statement below

SELECT DISTINCT
    a.player_id,
    MIN(a.event_date) OVER(PARTITION BY a.player_id) first_login 
FROM
    activity a



--577. Employee Bonus

# Write your MySQL query statement below

SELECT
    e.name,
    b.bonus
FROM
    employee e
LEFT JOIN
    bonus b ON e.empid = b.empid
WHERE
    b.bonus < 1000 OR b.bonus IS NULL



--584. Find Customer Referee

# Write your MySQL query statement below

SELECT
    name
FROM
    customer
WHERE
    referee_id != 2 OR referee_id IS NULL



--586. Customer Placing the Largest Number of Orders

# Write your MySQL query statement below

WITH cte AS
(
    SELECT
        customer_number,
        COUNT(order_number) pom
    FROM
        orders
    GROUP BY
        customer_number
)
SELECT
    customer_number
FROM
    cte
ORDER BY
    pom DESC
LIMIT 1



--595. Big Countries

# Write your MySQL query statement below


SELECT
    name,
    population,
    area
FROM
    world
WHERE
    area >= 3000000 OR population  >= 25000000



--596. Classes With at Least 5 Students

# Write your MySQL query statement below

SELECT
    class
FROm
    courses
GROUP BY
    class
HAVING
    COUNT(student) >= 5



--196. Delete Duplicate Emails

-- Write your PostgreSQL query statement below

DELETE 
FROM 
    person
WHERE 
    id IN 
    (
        SELECT id
        FROM (
            SELECT id,
                ROW_NUMBER() OVER(PARTITION BY email ORDER BY id) AS row_num
            FROM person
    )
    WHERE row_num > 1
)



--178. Rank Scores

-- Write your PostgreSQL query statement below


SELECT
    score,
    DENSE_RANK() OVER(ORDER BY score DESC) rank
FROM
    scores



--620. Not Boring Movies

-- Write your PostgreSQL query statement below


SELECT
    *
FROM
    cinema
WHERE
    description != 'boring' AND id % 2 != 0
ORDER BY
    rating DESC



--197. Rising Temperature

-- Write your PostgreSQL query statement below

WITH cte AS
(
    SELECT 
        id,
        recorddate rd,
        LEAD(recorddate) OVER(ORDER BY recorddate) data2,
        temperature as t2
    FROM
        weather
),
cte2 AS
(
    SELECT 
        *
    FROM
        cte
    WHERE
        data2 - rd = 1
)
SELECT
    w.id
FROM
    weather w
LEFT JOIN
    cte2 ON w.recorddate = cte2.data2
WHERE
    cte2.t2 < w.temperature AND w.recorddate = cte2.data2



--607. Sales Person

# Write your MySQL query statement below

SELECT DISTINCT
    s.name
FROM
    salesperson s
LEFT JOIN
    orders o ON o.sales_id = s.sales_id
LEFT JOIN
    company c ON c.com_id = o.com_id
WHERE
    s.sales_id NOT IN
	(
		SELECT
			s.sales_id
		FROM
			salesperson s
		LEFT JOIN
			orders o ON o.sales_id = s.sales_id
		LEFT JOIN
			company c ON c.com_id = o.com_id
		WHERE
			c.name = 'RED'
			
	)



--619. Biggest Single Number
# Write your MySQL query statement below


SELECT
    MAX(num) num
FROM
    (
        SELECT
            num,
            COUNT(num) as licz
        FROM
            mynumbers
        GROUP BY
            num
    ) acte
WHERE licz = 1



--1050. Actors and Directors Who Cooperated At Least Three Times

# Write your MySQL query statement below


SELECT
    actor_id,
    director_id
FROM
    actordirector
GROUP BY
    actor_id,
    director_id
HAVING
    COUNT(*) >= 3



--1068. Product Sales Analysis I

-- Write your PostgreSQL query statement below


SELECT
    p.product_name,
    s.year,
    s.price 
FROM
    sales s
JOIN
    product p ON p.product_id = s.product_id



--610. Triangle Judgement

# Write your MySQL query statement below


SELECT
    x,
    y,
    z,
    CASE
        WHEN x > y AND x > z AND y+z > x THEN 'Yes'
        WHEN x > y AND x > z AND y+z < x THEN 'No'
        WHEN y > x AND y > z AND x+z > y THEN 'Yes'
        WHEN y > x AND y > z AND x+z < y THEN 'No'
        WHEN z > x AND z > y AND x+y > z THEN 'Yes'
        WHEN z > x AND z > y AND x+y < z THEN 'No'
        WHEN z=x OR y = x OR z=y THEN 'Yes'
        ELSE 'No'
    END as triangle
FROM
    triangle



--627. Swap Sex of Employees

-- Write your PostgreSQL query statement below

UPDATE 
    salary
SET 
    sex = CASE 
                WHEN sex = 'm' THEN 'f'
                WHEN sex = 'f' THEN 'm'
              END



--1075. Project Employees I

-- Write your PostgreSQL query statement below


SELECT
    p.project_id,
    ROUND(AVG(e.experience_years),2) average_years
FROM
    project p
JOIN
    employee e ON e.employee_id = p.employee_id
GROUP BY
    p.project_id



--1327. List the Products Ordered in a Period

-- Write your PostgreSQL query statement below


SELECT
    p.product_name,
    SUM(o.unit) unit
FROM
    products p
JOIN
    orders o ON o.product_id = p.product_id
WHERE
    EXTRACT(MONTH FROM o.order_date) = 2 AND EXTRACT(YEAR FROM o.order_date) = 2020
GROUP BY
    p.product_name
HAVING
    SUM(o.unit) >= 100



--1084. Sales Analysis III

-- Write your PostgreSQL query statement below


SELECT
    p.product_id,
    p.product_name
FROM
    product p
JOIN
    sales s ON s.product_id = p.product_id
GROUP BY
    p.product_id,
    p.product_name
HAVING
    SUM(CASE WHEN s.sale_date >= '2019-04-01' OR s.sale_date < '2019-01-01' THEN 1 ELSE 0 END) = 0



--1141. User Activity for the Past 30 Days I

# Write your MySQL query statement below


SELECT
    activity_date day,
    COUNT(DISTINCT user_id) active_users
FROM
    activity
GROUP BY
    activity_date
HAVING
    COUNT(DISTINCT user_id) <> 0 AND activity_date > '2019-06-27' AND  activity_date <= '2019-07-27'
    
    #SUM(CASE WHEN activity_type = 'end_session' THEN 0 ELSE 1 END) > 0



--1148. Article Views I

# Write your MySQL query statement below

SELECT DISTINCT * FROM
(
    SELECT DISTINCT
        author_id AS id
    FROM
        views
    WHERE
        author_id = viewer_id
    ORDER BY
        id 
) AS ok



--1179. Reformat Department Table

# Write your MySQL query statement below


SELECT 
    id,
    SUM(CASE WHEN month = 'Jan' THEN revenue ELSE NULL END) AS Jan_Revenue,
    SUM(CASE WHEN month = 'Feb' THEN revenue ELSE NULL END) AS Feb_Revenue,
    SUM(CASE WHEN month = 'Mar' THEN revenue ELSE NULL END) AS Mar_Revenue,
    SUM(CASE WHEN month = 'Apr' THEN revenue ELSE NULL END) AS Apr_Revenue,
    SUM(CASE WHEN month = 'May' THEN revenue ELSE NULL END) AS May_Revenue,
    SUM(CASE WHEN month = 'Jun' THEN revenue ELSE NULL END) AS Jun_Revenue,
    SUM(CASE WHEN month = 'Jul' THEN revenue ELSE NULL END) AS Jul_Revenue,
    SUM(CASE WHEN month = 'Aug' THEN revenue ELSE NULL END) AS Aug_Revenue,
    SUM(CASE WHEN month = 'Sep' THEN revenue ELSE NULL END) AS Sep_Revenue,
    SUM(CASE WHEN month = 'Oct' THEN revenue ELSE NULL END) AS Oct_Revenue,
    SUM(CASE WHEN month = 'Nov' THEN revenue ELSE NULL END) AS Nov_Revenue,
    SUM(CASE WHEN month = 'Dec' THEN revenue ELSE NULL END) AS Dec_Revenue
FROM 
    department 
GROUP BY
    id;



--1211. Queries Quality and Percentage

-- Write your PostgreSQL query statement below

WITH pom AS
(
    SELECT
        query_name,
      --  position,
        --rating,
        rating::NUMERIC / position::NUMERIC  quality,
        CASE
            WHEN rating < 3 THEN 1 ELSE 0 
        END AS  poor_query_percentage 
    FROM
        queries
)
SELECT
    query_name,
   -- position,
    --rating,
    ROUND(SUM(quality) / COUNT(query_name), 2) quality,
    ROUND(SUM(poor_query_percentage)::NUMERIC / COUNT(query_name)::NUMERIC *100, 2) poor_query_percentage
FROM
    pom
GROUP BY
    query_name



--1280. Students and Examinations

# Write your MySQL query statement below

WITH pom AS
(
    SELECT
        st.student_id,
        st.student_name,
        sub.subject_name
    FROM
        students st
    CROSS JOIN
        subjects sub
), pom2 AS
(
    SELECT
        st.student_id,
        st.student_name,
        e.subject_name
    FROM
        students st
    LEFT JOIN
        examinations e ON e.student_id = st.student_id

)
SELECT
    pom.student_id,
    pom.student_name,
    pom.subject_name,
    COUNT(pom2.student_id) AS attended_exams
FROM
    pom
LEFT JOIN
    pom2 ON pom.student_id = pom2.student_id AND pom.subject_name = pom2.subject_name 
GROUP BY
        pom.student_id,
    pom.student_name,
    pom.subject_name
ORDER BY
    pom.student_id,
    pom.student_name



--1378. Replace Employee ID With The Unique Identifier

# Write your MySQL query statement below


SELECT
    euni.unique_id,
    name
FROM
    EmployeeUNI euni
RIGHT JOIN
    employees e ON e.id = euni.id



--1407. Top Travellers

# Write your MySQL query statement below

WITh odp AS
(
    SELECT
        u.name,
        u.id,
        SUM(r.distance) travelled_distance
    FROM
        users u
    LEFT JOIN
        rides r ON r.user_id = u.id
    GROUP BY
        u.name,
        u.id
)
SELECT
    name,
    COALESCE(travelled_distance,0) AS travelled_distance
FROM
    odp
ORDER BY
    travelled_distance DESC,
    name ASC



--1484. Group Sold Products By The Date

-- Write your PostgreSQL query statement below

SELECT
    sell_date,
    COUNT(DISTINCT product) AS num_sold,
    STRING_AGG(DISTINCT product, ',' ORDER BY product) AS products
FROM
    Activities
GROUP BY
    sell_date
ORDER BY
    sell_date;



--1581. Customer Who Visited but Did Not Make Any Transactions

# Write your MySQL query statement below

SELECT
    v.customer_id,
    COUNT(v.visit_id) AS count_no_trans
FROM
    visits v
LEFT JOIN
    Transactions t ON t.visit_id = v.visit_id
WHERE
    t.transaction_id is NULL
GROUP BY
    v.customer_id



--1587. Bank Account Summary II

# Write your MySQL query statement below

SELECT
    u.name,
    SUM(t.amount) balance   
FROM
    users u
JOIN
    transactions t ON t.account = u.account
GROUP BY
    u.name
HAVING
    SUM(t.amount) > 10000



--1965. Employees With Missing Information

-- Write your PostgreSQL query statement below

SELECT
    e.employee_id AS employee_id
FROM
    employees e
WHERE 
    e.employee_id NOT IN
(
    SELECT
        s.employee_id
    FROM
        salaries s
)

UNION ALL

SELECT
    s.employee_id AS employee_id
FROM
    salaries s
WHERE 
    s.employee_id NOT IN
(
    SELECT
        e.employee_id
    FROM
        employees e
)
ORDER BY
    employee_id



--1890. The Latest Login in 2020

# Write your MySQL query statement below
WITH pom as
(
    SELECT
        user_id,
        time_stamp
    FROM
        logins
    WHERE
        YEAR(time_stamp) = 2020
)
SELECT
    user_id,
    MAX(time_stamp) AS last_stamp
FROM
    pom
GROUP BY 
    user_id


