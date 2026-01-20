proc sql; 
create table  &zbior._score as 
select indataset.*  
, case 
when app_number_of_children < 0.5 then 104.0 
when 0.5 <= app_number_of_children  and  app_number_of_children < 1.5 then 94.0 
when 1.5 <= app_number_of_children  and  app_number_of_children < 2.5 then 87.0 
when 2.5 <= app_number_of_children then 55.0 
else 104.0 end as PSC_app_number_of_children 
 
, case 
when act_ccss_n_loan < 1.5 then 104.0 
when 1.5 <= act_ccss_n_loan  and  act_ccss_n_loan < 2.5 then 71.0 
when 2.5 <= act_ccss_n_loan  and  act_ccss_n_loan < 5.5 then 38.0 
when 5.5 <= act_ccss_n_loan then 5.0 
else 104.0 end as PSC_act_ccss_n_loan 
 
, case 
when act_cins_n_loans_hist < 1.5 then 104.0 
when 1.5 <= act_cins_n_loans_hist  and  act_cins_n_loans_hist < 3.5 then 83.0 
when 3.5 <= act_cins_n_loans_hist  and  act_cins_n_loans_hist < 6.5 then 70.0 
when 6.5 <= act_cins_n_loans_hist then 62.0 
else 104.0 end as PSC_act_cins_n_loans_hist 
 
, case 
when 2.5 <= act_ccss_maxdue then 104.0 
when act_ccss_maxdue is null then 88.0 
when 1.5 <= act_ccss_maxdue  and  act_ccss_maxdue < 2.5 then 53.0 
when act_ccss_maxdue < 0.5 then 32.0 
when 0.5 <= act_ccss_maxdue  and  act_ccss_maxdue < 1.5 then 25.0 
else 104.0 end as PSC_act_ccss_maxdue 
 
, case 
when 0.5 <= act3_n_arrears_days then 104.0 
when act3_n_arrears_days < 0.5 then 52.0 
else 104.0 end as PSC_act3_n_arrears_days 
 
, case 
when app_char_job_code in ('Owner company') then 104.0 
when app_char_job_code in ('Permanent') then 87.0 
when app_char_job_code in ('Retired') then 74.0 
else 104.0 end as PSC_app_char_job_code 
 
/* , 1/(1+exp(-(-0.03543243472916371*(0.0+ calculated PSC_app_number_of_children+ calculated PSC_act_ccss_n_loan+ calculated PSC_act_cins_n_loans_hist+ calculated PSC_act_ccss_maxdue+ calculated PSC_act3_n_arrears_days+ calculated PSC_app_char_job_code)+(14.184327396156098)))) as PD */ 
 
, 0.0 
+ calculated PSC_app_number_of_children + calculated PSC_act_ccss_n_loan + calculated PSC_act_cins_n_loans_hist + calculated PSC_act_ccss_maxdue + calculated PSC_act3_n_arrears_days + calculated PSC_app_char_job_code  as SCORECARD_POINTS 
 
from &zbior as indataset; 
quit; 
