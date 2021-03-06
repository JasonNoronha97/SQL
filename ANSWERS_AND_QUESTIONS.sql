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

SELECT
    customer_id|| ' ' ||    customer_name|| ' ' ||    gender|| ' ' ||    marital_status UNIQUE_REF_STRING
FROM
    customer_personal_info
ORDER BY customer_id DESC;

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

SELECT
    customer_id,
    account_no,
    CONCAT(SUBSTR(customer_id,-3),SUBSTR(account_no,-4)) PASSCODE    
FROM
    account_info;

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
    d.reference_acc_name
FROM
    customer_reference_info d,
    customer_personal_info c
WHERE
    c.customer_id = d.customer_id
    AND
    d.relation='FRIEND';

--10.*Write a query to display the customer id, account number and interest amount in the below format with INTEREST_AMT as alias name
-- Sort the result based on the INTEREST_AMT in ascending order.  <BR/>Example: 
--$5<BR/>Hint: Need to prefix $ to interest amount and round the result without decimals.

SELECT
    account_info.customer_id,
    account_info.account_no,
    CONCAT('$',(account_info.interest / 100 * account_info.initial_deposit) ) AS INTEREST_AMT
FROM
    account_info
ORDER BY (account_info.interest / 100 * account_info.initial_deposit); -- USE Formula in ORDER_BY Clause to arrange output...


--11.*Write a query which will display the customer id, customer name, account no, account type, activation date,
-- bank name whose account willnull be activated on '10-APR-2012'

SELECT
    g.customer_id,
    g.customer_name,
    h.account_no,
    h.account_type,
    h.activation_date,
    i.ifsc_code
FROM
    account_info h,
    customer_personal_info g,
    bank_info i
WHERE
    g.customer_id = h.customer_id
    AND i.ifsc_code = h.ifsc_code AND h.activation_date='10-APR-12';

--12.*Write a query which will display account number, customer id, customer name, bank name, branch name, ifsc code
--, citizenship, interest and initial deposit amount of all the customers.

SELECT
    k.account_no,
    k.customer_id,
    k.interest,
    k.initial_deposit,
    j.customer_name,
    j.citizenship,
    l.bank_name,
    l.branch_name,
    l.ifsc_code
FROM
    account_info k,
    customer_personal_info j,
    bank_info l
WHERE
    j.customer_id = k.customer_id
    AND l.ifsc_code = k.ifsc_code;
    
--13.*Write a query which will display customer id, customer name, date of birth, guardian name, contact number,
-- mail id and reference account holder's name of the customers who has submitted the passport as an identification document.

SELECT
    m.customer_id,
    m.date_of_birth,
    m.customer_name,
    m.contact_no,
    m.guardian_name,
    m.mail_id,
    n.reference_acc_name
FROM
    customer_reference_info n,
    customer_personal_info m
WHERE
    m.customer_id = n.customer_id AND m.identification_doc_type='PASSPORT';

--14.*Write a query to display the customer id, customer name, account number, account type, initial deposit, 
--interest who have deposited maximum amount in the bank.

SELECT
    q.customer_id,
    q.customer_name,
    r.account_no,
    r.account_type,
    r.interest,
    r.initial_deposit,
    s.bank_name
FROM
    account_info r,
    customer_personal_info q,
    bank_info s
WHERE
    q.customer_id = r.customer_id
    AND s.ifsc_code = r.ifsc_code 
    AND r.initial_deposit=(SELECT MAX(r.initial_deposit) FROM account_info r);

--15.*Write a query to display the customer id, customer name, account number, account type, interest, bank name 
--and initial deposit amount of the customers who are getting maximum interest rate.

SELECT
    t.customer_id,
    t.customer_name,
    u.account_no,
    u.account_type,
    u.interest,
    u.initial_deposit*u.interest/100 AS INTEREST_AMT,
    v.bank_name
FROM
    account_info u,
    customer_personal_info t,
    bank_info v
WHERE
    t.customer_id = u.customer_id
    AND v.ifsc_code = u.ifsc_code
    AND u.initial_deposit*u.interest/100=(SELECT MAX(u.initial_deposit*u.interest/100) FROM account_info u);

--16.Write a query to display the customer id, customer name, account no, bank name, contact no 
--and mail id of the customers who are from BANGALORE.

SELECT
    w.customer_id,
    w.customer_name,
    w.contact_no,
    w.mail_id,
    x.account_no,
    y.bank_name
FROM
    account_info x,
    customer_personal_info w,
    bank_info y
WHERE
    w.customer_id = x.customer_id
    AND y.ifsc_code = x.ifsc_code 
    AND w.address LIKE '%BANGALORE';


--17.Write a query which will display customer id, bank name, branch name, ifsc code, registration date, 
--activation date of the customers whose activation date is in the month of march (March 1'st to March 31'st).

SELECT
    z.customer_id,
    bb.bank_name,
    bb.branch_name,
    bb.ifsc_code,
    aa.registration_date 
FROM
    account_info aa,
    customer_personal_info z,
    bank_info bb
WHERE
    z.customer_id = aa.customer_id
    AND bb.ifsc_code = aa.ifsc_code
    AND EXTRACT(MONTH from aa.activation_date)=3;

--18.Write a query which will calculate the interest amount and display it along with customer id, customer name, 
--account number, account type, interest, and initial deposit amount.<BR>Hint :Formula for interest amount, 
--calculate: ((interest/100) * initial deposit amt) with column name 'interest_amt' (alias)

SELECT
    cc.customer_id,
    cc.customer_name,
    dd.account_no,
    dd.account_type,
    dd.interest,
    dd.initial_deposit,
        (dd.interest/100*dd.initial_deposit) AS INTEREST_AMT
FROM
    account_info dd,
    customer_personal_info cc
WHERE
    cc.customer_id = dd.customer_id;

--19.Write a query to display the customer id, customer name, date of birth, guardian name, contact number, 
--mail id, reference name who has been referenced by 'RAGHUL'.

SELECT
    ee.customer_id,
    ee.date_of_birth,
    ee.customer_name,
    ee.contact_no,
    ee.guardian_name,
    ee.mail_id,
    ff.reference_acc_name
FROM
    customer_reference_info ff,
    customer_personal_info ee
WHERE
    ee.customer_id = ff.customer_id
    AND ff.reference_acc_name='RAGHUL';

--20."Write a query which will display the customer id, customer name and contact number with ISD code of 
--all customers in below mentioned format.  Sort the result based on the customer id in descending order. 
--<BR>Format for contact number is :  
--<br/> ""+91-3digits-3digits-4digits""
--<br/> Example: +91-924-234-2312
--<br/> Use ""CONTACT_ISD"" as alias name."

SELECT
    customer_personal_info.customer_id,
    customer_personal_info.customer_name,
    customer_personal_info.contact_no,
    '+91-' || SUBSTR(customer_personal_info.contact_no,0,3) 
    || '-' || SUBSTR(customer_personal_info.contact_no,4,3) 
    || '-' || SUBSTR(customer_personal_info.contact_no,7,4) 
    AS CONTACT_ISD 
FROM
    customer_personal_info;

--21.Write a query which will display account number, account type, customer id, customer name, date of birth, guardian name, 
--contact no, mail id , gender, reference account holders name, reference account holders account number, registration date, 
--activation date, number of days between the registration date and activation date with alias name "NoofdaysforActivation", 
--bank name, branch name and initial deposit for all the customers.

SELECT
    ii.account_no,    ii.account_type,    ii.customer_id,    gg.customer_name,    gg.date_of_birth,
    gg.guardian_name,    hh.reference_acc_name,  hh.reference_acc_no,  
    ii.registration_date,    ii.activation_date,    ii.activation_date - ii.registration_date AS NoofdaysforActivation,
    ii.initial_deposit,    gg.gender,    gg.contact_no,    
    gg.mail_id,    jj.bank_name,    jj.branch_name
FROM
    customer_reference_info hh,    customer_personal_info gg,    account_info ii,    bank_info jj
WHERE
    gg.customer_id = hh.customer_id
    AND gg.customer_id = ii.customer_id
    AND jj.ifsc_code = ii.ifsc_code;

--22."Write a query which will display customer id, customer name,  guardian name, identification doc type,
-- reference account holders name, account type, ifsc code, bank name and current balance for the customers 
--who has only the savings account. 
--<br/>Hint:  Formula for calculating current balance is add the intital deposit amount and interest
-- and display without any decimals. Use ""CURRENT_BALANCE"" as alias name."

SELECT
    a.customer_id,    a.customer_name,    a.guardian_name,    a.identification_doc_type,
    b.reference_acc_name,    c.account_type,    d.ifsc_code,
    d.bank_name, c.interest/100*c.initial_deposit as "CURRENT BALANCE"
FROM
    customer_reference_info b,
    customer_personal_info a,
    account_info c,
    bank_info d
WHERE
    a.customer_id = b.customer_id
    AND a.customer_id = c.customer_id
    AND d.ifsc_code = c.ifsc_code
    AND c.account_type='SAVINGS';

--23."Write a query which will display the customer id, customer name, account number, account type, interest, initial deposit;
-- <br/>check the initial deposit,<br/> if initial deposit is 20000 then display ""high"",<br/> if initial deposit is 16000 display 'moderate'
--,<br/> if initial deposit is 10000 display 'average', <br/>if initial deposit is 5000 display 'low', <br/>if initial deposit is 0 display
-- 'very low' otherwise display 'invalid' and sort by interest in descending order.<br/>
--Hint: Name the column as ""Deposit_Status"" (alias). 
--<br/>Strictly follow the lower case for strings in this query."

SELECT
    account_info.customer_id,    CUSTOMER_NAME,    account_no,    account_type,    interest,    initial_deposit,
    CASE initial_deposit 
        WHEN 20000  THEN    'high'
        WHEN 16000  THEN    'moderate'
        WHEN 10000  THEN    'average'
        WHEN 5000   THEN    'low'   
        WHEN 0      THEN    'very low'   
        ELSE                'invalid' END
FROM
    account_info,    CUSTOMER_PERSONAL_INFO
WHERE
    account_info.customer_id = CUSTOMER_PERSONAL_INFO.customer_id
ORDER BY interest DESC;

--24."Write a query which will display customer id, customer name,  account number, account type, bank name, ifsc code, initial deposit amount
-- and new interest amount for the customers whose name starts with ""J"". 
--<br/> Hint:  Formula for calculating ""new interest amount"" is 
--if customers account type is savings then add 10 % on current interest amount to interest amount else display the current interest amount.
-- Round the new interest amount to 2 decimals.<br/> Use ""NEW_INTEREST"" as alias name for displaying the new interest amount.
--
--<br/>Example, Assume Jack has savings account and his current interest amount is 10.00, then the new interest amount is 11.00 i.e (10 + (10 * 10/100)). 

SELECT
    account_info.customer_id,    CUSTOMER_NAME,    account_no,    account_type,    BANK_NAME,    account_info.ifsc_code,    initial_deposit,
    CASE
        WHEN account_type = 'SAVINGS'
           THEN ((INTEREST/100)*INITIAL_DEPOSIT)+((INTEREST/100)*INITIAL_DEPOSIT*10/100)
    ELSE
           ((INTEREST/100)*INITIAL_DEPOSIT)
    END  NEW_INTEREST
FROM
    account_info,    CUSTOMER_PERSONAL_INFO,    BANK_INFO
WHERE 
    account_info.IFSC_CODE = BANK_INFO.IFSC_CODE AND
    account_info.customer_id = CUSTOMER_PERSONAL_INFO.customer_id AND 
    CUSTOMER_NAME LIKE 'J%';

--25.Write query to display the customer id, customer name, account no, initial deposit, tax percentage as calculated below.
--<BR>Hint: <BR>If initial deposit = 0 then tax is '0%'<BR>If initial deposit &lt;= 10000 then tax is '3%' 
--<BR>If initial deposit &gt; 10000 and initial deposit &lt; 20000 then tax is '5%' <BR>If initial deposit &gt;= 20000 and
-- initial deposit&lt;=30000 then tax is '7%' <BR>If initial deposit &gt; 30000 then tax is '10%' <BR>Use the alias name 'taxPercentage'

SELECT
    account_info.customer_id,    CUSTOMER_NAME,    account_no,    initial_deposit,
    CASE
        WHEN initial_deposit = 0            THEN '0%'       
        WHEN initial_deposit <= 10000       THEN '3%'     
        WHEN initial_deposit > 10000 AND initial_deposit<20000      THEN '3%'     
        WHEN initial_deposit >=20000 AND initial_deposit<=30000     THEN '7%'     
        WHEN initial_deposit > 30000        THEN '10%'
    END taxPercentage
FROM
    account_info,    CUSTOMER_PERSONAL_INFO
WHERE
    account_info.customer_id = CUSTOMER_PERSONAL_INFO.customer_id;