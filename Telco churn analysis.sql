use Telco_churn

--Overall Churn Rate  
select Churn ,count(*) as Total_Customer , 
Round(Count(*) * 100 / sum(count(*)) over(),2) as Percentage
from telco_churn group by churn;


--Churn by Contract
select contract , count(*) as Total ,
sum(case when Churn = 'Yes' then 1 else 0 end) as Churn_count
from telco_churn group by contract;


--High Risk Segment
select contract ,
Round(AVG(MonthlyCharges),2) as Avg_monthly_charges 
from telco_churn where Churn='yes' group by Contract;

--Tenure Based Analysis
select case when tenure < 12 then '0-12' 
when tenure < 24 then '12-24' else '+24' end as Tenure_group,
COUNT(*) as Total_customers, SUM(case when churn='yes' then 1 else 0 end ) as Churned
from telco_churn group by case when tenure <12 then '0-12' 
when tenure <24 then '12-24' else '+24' end;