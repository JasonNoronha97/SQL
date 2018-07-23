-- FILE OF ALL QUESTIONS AND ANSWERS --
--


--1.*Write a query which will display the customer id, account type they hold, their account number and bank name.

SELECT
    a.customer_id,
    b.account_type,
    b.account_no,
    c.bank_name
FROM
    account_info b,
    customer_personal_info a,
    bank_info c
WHERE
    a.customer_id = b.customer_id
    AND c.ifsc_code = b.ifsc_code;

--2.*Write a query which will display the customer id, account type and the account number of HDFC customers who registered after 12-JAN-2012 and before 04-APR-2012.

SELECT
    f.customer_id,
    g.account_type,
    g.account_no
FROM
    account_info g,
    customer_personal_info f,
    bank_info h
WHERE
    f.customer_id = g.customer_id
    AND h.ifsc_code = g.ifsc_code
--  AND g.registration_date BETWEEN('2012-01-12','2012-04-04')
    AND (g.registration_date >='2012-01-12' AND g.registration_date <= '2012-04-04') 
    AND h.bank_name='HDFC';
    
    
--3.*Write a query which will display the customer id, customer name, account no, account type and bank name where the customers hold the account.

SELECT
    i.customer_id,
    i.customer_name,
    j.account_no,
    j.account_type,
    k.ifsc_code
FROM
    account_info j,
    customer_personal_info i,
    bank_info k
WHERE
    i.customer_id = j.customer_id
    AND k.ifsc_code = j.ifsc_code;

--4.*Write a query which will display the customer id, customer name, gender, marital status along with the unique reference string and
-- sort the records based on customer id in descending order. <br/>
--<br/><b>Hint:  </b>Generate unique reference string as mentioned below
--:
--<br/> CustomerName_Gender_MaritalStatus
--<br/><b> Example, </b>
--<br/> C-005           KUMAR              M                 SINGLE            KUMAR_M_SINGLE
--<BR/> 
--Use ""UNIQUE_REF_STRING"" as alias name for displaying the unique reference string."



--5.*Write a query which will display the account number, customer id, registration date, initial deposit amount of the customer
-- whose initial deposit amount is within the range of Rs.15000 to Rs.25000.

SELECT
    b.account_no,
    b.registration_date,
    b.initial_deposit,
    a.customer_id
FROM
    account_info b,
    customer_personal_info a
WHERE
    a.customer_id = b.customer_id AND b.initial_deposit BETWEEN 15000 AND 25000 ;

--6.*Write a query which will display customer id, customer name, date of birth, guardian name of the customers whose name starts with 'J'.

SELECT
    customer_personal_info.customer_id,
    customer_personal_info.customer_name,
    customer_personal_info.date_of_birth,
    customer_personal_info.guardian_name
FROM
    customer_personal_info 
WHERE
    customer_personal_info.customer_name LIKE 'J%';

--7.*Write a query which will display customer id, account number and passcode. 
--<br/>
--Hint:  To generate passcode, join the last three digits of customer id and last four digit of account number.
-- 
--<br/>Example
--<br/>C-001                   1234567898765432                0015432
--<br/>Use ""PASSCODE"" as alias name for displaying the passcode."



--8.*Write a query which will display the customer id, customer name, date of birth, Marital Status, Gender, Guardian name, 
--contact no and email id of the customers whose gender is male 'M' and marital status is MARRIED.

SELECT
    customer_personal_info.customer_id,
    customer_personal_info.customer_name,
    customer_personal_info.date_of_birth,
    customer_personal_info.marital_status,
    customer_personal_info.gender,
    customer_personal_info.guardian_name,
    customer_personal_info.contact_no,
    customer_personal_info.mail_id
FROM
    customer_personal_info
WHERE
    customer_personal_info.gender='M'
    AND
    customer_personal_info.marital_status='MARRIED';

--9.*Write a query which will display the customer id, customer name, guardian name, reference account holders name of the customers 
--who are referenced / referred by their 'FRIEND'.

SELECT
    c.customer_id,
    c.customer_name,
    c.guardian_name,
    d.reference_acc_name,
FROM
    customer_reference_info d,
    customer_personal_info c
WHERE
    c.customer_id = d.customer_id;

--10.*Write a query to display the customer id, account number and interest amount in the below format with INTEREST_AMT as alias name
-- Sort the result based on the INTEREST_AMT in ascending order.  <BR/>Example: 
--$5<BR/>Hint: Need to prefix $ to interest amount and round the result without decimals.
-- 
--11.*Write a query which will display the customer id, customer name, account no, account type, activation date,
-- bank name whose account will be activated on '10-APR-2012'
--
--12.*Write a query which will display account number, customer id, customer name, bank name, branch name, ifsc code
--, citizenship, interest and initial deposit amount of all the customers.
--
--13.*Write a query which will display customer id, customer name, date of birth, guardian name, contact number,
-- mail id and reference account holder's name of the customers who has submitted the passport as an identification document.
--
--14.*Write a query to display the customer id, customer name, account number, account type, initial deposit, 
--interest who have deposited maximum amount in the bank.
--
--15.*Write a query to display the customer id, customer name, account number, account type, interest, bank name 
--and initial deposit amount of the customers who are getting maximum interest rate.
--
--16.Write a query to display the customer id, customer name, account no, bank name, contact no 
--and mail id of the customers who are from BANGALORE.
--
--17.Write a query which will display customer id, bank name, branch name, ifsc code, registration date, 
--activation date of the customers whose activation date is in the month of march (March 1'st to March 31'st).
--
--18.Write a query which will calculate the interest amount and display it along with customer id, customer name, 
--account number, account type, interest, and initial deposit amount.<BR>Hint :Formula for interest amount, 
--calculate: ((interest/100) * initial deposit amt) with column name 'interest_amt' (alias)
--
--19.Write a query to display the customer id, customer name, date of birth, guardian name, contact number, 
--mail id, reference name who has been referenced by 'RAGHUL'.
--
--20."Write a query which will display the customer id, customer name and contact number with ISD code of 
--all customers in below mentioned format.  Sort the result based on the customer id in descending order. 
--<BR>Format for contact number is :  
--<br/> ""+91-3digits-3digits-4digits""
--<br/> Example: +91-924-234-2312
--<br/> Use ""CONTACT_ISD"" as alias name."
--
--21.Write a query which will display account number, account type, customer id, customer name, date of birth, guardian name, 
--contact no, mail id , gender, reference account holders name, reference account holders account number, registration date, 
--activation date, number of days between the registration date and activation date with alias name "NoofdaysforActivation", 
--bank name, branch name and initial deposit for all the customers.
--
--22."Write a query which will display customer id, customer name,  guardian name, identification doc type,
-- reference account holders name, account type, ifsc code, bank name and current balance for the customers 
--who has only the savings account. 
--<br/>Hint:  Formula for calculating current balance is add the intital deposit amount and interest
-- and display without any decimals. Use ""CURRENT_BALANCE"" as alias name."
--
--23."Write a query which will display the customer id, customer name, account number, account type, interest, initial deposit;
-- <br/>check the initial deposit,<br/> if initial deposit is 20000 then display ""high"",<br/> if initial deposit is 16000 display 'moderate'
--,<br/> if initial deposit is 10000 display 'average', <br/>if initial deposit is 5000 display 'low', <br/>if initial deposit is 0 display
-- 'very low' otherwise display 'invalid' and sort by interest in descending order.<br/>
--Hint: Name the column as ""Deposit_Status"" (alias). 
--<br/>Strictly follow the lower case for strings in this query."
--
--24."Write a query which will display customer id, customer name,  account number, account type, bank name, ifsc code, initial deposit amount
-- and new interest amount for the customers whose name starts with ""J"". 
--<br/> Hint:  Formula for calculating ""new interest amount"" is 
--if customers account type is savings then add 10 % on current interest amount to interest amount else display the current interest amount.
-- Round the new interest amount to 2 decimals.<br/> Use ""NEW_INTEREST"" as alias name for displaying the new interest amount.
--
--<br/>Example, Assume Jack has savings account and his current interest amount is 10.00, then the new interest amount is 11.00 i.e (10 + (10 * 10/100)). 
--"
--
--25.Write query to display the customer id, customer name, account no, initial deposit, tax percentage as calculated below.
--<BR>Hint: <BR>If initial deposit = 0 then tax is '0%'<BR>If initial deposit &lt;= 10000 then tax is '3%' 
--<BR>If initial deposit &gt; 10000 and initial deposit &lt; 20000 then tax is '5%' <BR>If initial deposit &gt;= 20000 and
-- initial deposit&lt;=30000 then tax is '7%' <BR>If initial deposit &gt; 30000 then tax is '10%' <BR>Use the alias name 'taxPercentage'
