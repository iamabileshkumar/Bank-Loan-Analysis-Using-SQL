-------------BANK LOAN ANALYSIS-----------

--Total Loan Application
SELECT COUNT(id) AS Total_Loan_Application
FROM Bank_Loan

--MTD Total Loan Application
SELECT COUNT(id) AS MTD_Total_Loan_Application
FROM Bank_Loan
WHERE MONTH(issue_date)=12

--PMTD Total Loan Application
SELECT COUNT(id) AS PMTD_Total_Loan_Application
FROM Bank_Loan
WHERE MONTH(issue_date)=11

--TOTAL FUNDED AMOUNT
SELECT SUM(loan_amount) AS TOTAL_FUNDED_AMOUNT
FROM Bank_Loan

--MTD TOTAL FUNDED AMOUNT
SELECT SUM(loan_amount) AS MTD_TOTAL_FUNDED_AMOUNT
FROM Bank_Loan
WHERE MONTH(issue_date)=12

--PMTD TOTAL FUNDED AMOUNT
SELECT SUM(loan_amount) AS PMTD_TOTAL_FUNDED_AMOUNT
FROM Bank_Loan
WHERE MONTH(issue_date)=11

--TOTAL RECEIVED AMOUNT
SELECT SUM(total_payment) AS TOTAL_RECEIVED_AMOUNT
FROM Bank_Loan

--MTD TOTAL RECEIVED AMOUNT
SELECT SUM(total_payment) AS MTD_TOTAL_RECEIVED_AMOUNT
FROM Bank_Loan
WHERE MONTH(issue_date)=12

--PMTD TOTAL RECEIVED AMOUNT
SELECT SUM(total_payment) AS PMTD_TOTAL_RECEIVED_AMOUNT
FROM Bank_Loan
WHERE MONTH(issue_date)=11

--Average Interest Rate 
select avg(int_rate)*100 as Avg_Interest_Rate
from Bank_Loan

--MTD Average Interest Rate 
select Avg(int_rate)*100 as MTD_Avg_Interest_Rate
from Bank_Loan
where MONTH(issue_date)=12

--PMTD Average Interest Rate 
select Avg(int_rate)*100 as PMTD_Avg_Interest_Rate
from Bank_Loan
where MONTH(issue_date)=11

--AVG DEBT_TO_INCOME (DTI)
SELECT AVG(dti)*100 as Avg_DebtToIncome
FROM Bank_Loan

--AVG MTD DEBT_TO_INCOME (DTI)
SELECT AVG(dti)*100 as MTD_Avg_DebtToIncome
FROM Bank_Loan
WHERE MONTH(issue_date)=12

--AVG PMTD DEBT_TO_INCOME (DTI)
SELECT AVG(dti)*100 as PMTD_Avg_DebtToIncome
FROM Bank_Loan
WHERE MONTH(issue_date)=11

--GOOD LOAN Application Percentage
SELECT (COUNT(ID)/cast((select count(id) 
						from Bank_Loan)
						as decimal(10,5)))*100 as GOOD_LOAN_Application_Percentage
FROM Bank_Loan
WHERE loan_status='Fully Paid' or loan_status='Current'

--GOOD LOAN Application
SELECT COUNT(ID) as GOOD_LOAN_Application
FROM Bank_Loan
WHERE loan_status='Fully Paid' or loan_status='Current'

--GOOD LOAN Funded Amount
SELECT SUM(loan_amount) as GOOD_LOAN_Funded_Amount
FROM Bank_Loan
WHERE loan_status='Fully Paid' or loan_status='Current'

--GOOD LOAN Received Amount
SELECT SUM(total_payment) as GOOD_LOAN_Received_Amount
FROM Bank_Loan
WHERE loan_status='Fully Paid' or loan_status='Current'

--Bad Loan Application Percentage
SELECT (COUNT(ID)/cast((select count(id) 
						from Bank_Loan)
						as decimal(10,5)))*100 as Bad_Loan_Application_Percentage
FROM Bank_Loan
WHERE loan_status='Charged Off'

--Bad Loan Application
SELECT COUNT(ID) as Bad_Loan_Application
FROM Bank_Loan
WHERE loan_status='Charged Off'

--Bad Loan Funded Amount
SELECT SUM(loan_amount) as Bad_Loan_Funded_Amount
FROM Bank_Loan
WHERE loan_status='Charged Off'

--Bad Loan Received Amount
SELECT SUM(total_payment) as Bad_Loan_Received_Amount
FROM Bank_Loan
WHERE loan_status='Charged Off'

--Loan Status
SELECT 
	loan_status,
	COUNT(id) as LoanCount,
	SUM(total_payment) as Total_Amount_Received,
	SUM(loan_amount) as Total_Funded_Amount,
	AVG(int_rate)*100 as Interest_Rate,
	AVG(dti)*100 as DTI
FROM Bank_Loan
GROUP BY loan_status

--Loan Status as MTD
SELECT 
	loan_status,
	SUM(total_payment) as MTD_Total_Amount_Received,
	SUM(loan_amount) as MTD_Total_Funded_Amount
FROM Bank_Loan
WHERE MONTH(issue_date)=12
GROUP BY loan_status

--BANK LOAN REPORT | OVERVIEW
--MONTH
SELECT 
	MONTH(issue_date) AS MONTH_NUMBER,
	DATENAME(MONTH,issue_date) AS MONTH_NAME,
	COUNT(ID) AS Total_Loan_Application,
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) as Total_Amount_Received
FROM Bank_Loan
GROUP BY MONTH(issue_date),DATENAME(MONTH,issue_date)
ORDER BY MONTH_NUMBER

--State
SELECT 
	address_state as State,
	COUNT(ID) AS Total_Loan_Application,
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) as Total_Amount_Received
FROM Bank_Loan
GROUP BY address_state
ORDER BY address_state

--Term
SELECT 
	term as Term,
	COUNT(ID) AS Total_Loan_Application,
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) as Total_Amount_Received
FROM Bank_Loan
GROUP BY term
ORDER BY term

--Employee Length
SELECT 
	emp_length as Employee_Length,
	COUNT(ID) AS Total_Loan_Application,
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) as Total_Amount_Received
FROM Bank_Loan
GROUP BY emp_length
ORDER BY emp_length

--Purpose
SELECT 
	purpose as Purpose,
	COUNT(ID) AS Total_Loan_Application,
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) as Total_Amount_Received
FROM Bank_Loan
GROUP BY purpose
ORDER BY purpose

--Home Ownership
SELECT 
	home_ownership as Home_Ownership,
	COUNT(ID) AS Total_Loan_Application,
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) as Total_Amount_Received
FROM Bank_Loan
GROUP BY home_ownership
ORDER BY home_ownership
