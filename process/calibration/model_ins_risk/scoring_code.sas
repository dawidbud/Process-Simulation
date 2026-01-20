proc sql; 
create table  &zbior._score as 
select indataset.*  
, case 
when 1.19 <= act_cc then 173.0 
when 0.855 <= act_cc  and  act_cc < 1.19 then 206.0 
when 0.266 <= act_cc  and  act_cc < 0.855 then 222.0 
when act_cc < 0.266 then 238.0 
else 173.0 end as PSC_act_cc 
 
, case 
when 12414.0 <= app_loan_amount then 173.0 
when 8886.0 <= app_loan_amount  and  app_loan_amount < 12414.0 then 191.0 
when 4986.0 <= app_loan_amount  and  app_loan_amount < 8886.0 then 210.0 
when app_loan_amount < 4986.0 then 225.0 
else 173.0 end as PSC_app_loan_amount 
 
, case 
when 1.5 <= act_cins_n_loan then 173.0 
when act_cins_n_loan < 1.5 then 271.0 
else 173.0 end as PSC_act_cins_n_loan 
 
, case 
when 1.5 <= act_cins_n_statB then 173.0 
when 0.5 <= act_cins_n_statB  and  act_cins_n_statB < 1.5 then 205.0 
when act_cins_n_statB is null then 224.0 
when act_cins_n_statB < 0.5 then 240.0 
else 173.0 end as PSC_act_cins_n_statB 
 
, case 
when app_char_job_code in ('Contract') then 173.0 
when app_char_job_code in ('Owner company') then 226.0 
when app_char_job_code in ('Retired') then 244.0 
when app_char_job_code in ('Permanent') then 249.0 
else 173.0 end as PSC_app_char_job_code 
 
, case 
when app_char_marital_status in ('Divorced') then 173.0 
when app_char_marital_status in ('Widowed') then 198.0 
when app_char_marital_status in ('Maried') then 200.0 
else 173.0 end as PSC_app_char_marital_status 
 
/* , 1/(1+exp(-(-0.034655541712896504*(0.0+ calculated PSC_act_cc+ calculated PSC_app_loan_amount+ calculated PSC_act_cins_n_loan+ calculated PSC_act_cins_n_statB+ calculated PSC_app_char_job_code+ calculated PSC_app_char_marital_status)+(44.751425448551515)))) as PD */ 
 
, 0.0 
+ calculated PSC_act_cc + calculated PSC_app_loan_amount + calculated PSC_act_cins_n_loan + calculated PSC_act_cins_n_statB + calculated PSC_app_char_job_code + calculated PSC_app_char_marital_status  as SCORECARD_POINTS 
 
from &zbior as indataset; 
quit; 
