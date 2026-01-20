proc sql; 
create table  &zbior._score as 
select indataset.*  
, case 
when 48.5 <= act_age  and  act_age < 55.5 then 27.0 
when act_age < 48.5 then 45.0 
when 55.5 <= act_age  and  act_age < 80.5 then 52.0 
when 80.5 <= act_age then 70.0 
else 27.0 end as PSC_act_age 
 
, case 
when 0.801 <= act_cc then 27.0 
when 0.523 <= act_cc  and  act_cc < 0.801 then 71.0 
when act_cc < 0.352 then 77.0 
when 0.352 <= act_cc  and  act_cc < 0.523 then 96.0 
else 27.0 end as PSC_act_cc 
 
, case 
when app_number_of_children < 0.5 then 27.0 
when 0.5 <= app_number_of_children  and  app_number_of_children < 1.5 then 51.0 
when 1.5 <= app_number_of_children  and  app_number_of_children < 2.5 then 66.0 
when 2.5 <= app_number_of_children then 111.0 
else 27.0 end as PSC_app_number_of_children 
 
, case 
when act_ccss_n_statC < 1.5 then 27.0 
when 1.5 <= act_ccss_n_statC  and  act_ccss_n_statC < 5.5 then 38.0 
when 5.5 <= act_ccss_n_statC  and  act_ccss_n_statC < 9.5 then 79.0 
when 9.5 <= act_ccss_n_statC then 130.0 
else 27.0 end as PSC_act_ccss_n_statC 
 
, case 
when 7.5 <= act12_n_arrears then 27.0 
when 5.5 <= act12_n_arrears  and  act12_n_arrears < 7.5 then 43.0 
when 4.5 <= act12_n_arrears  and  act12_n_arrears < 5.5 then 56.0 
when act12_n_arrears < 4.5 then 67.0 
else 27.0 end as PSC_act12_n_arrears 
 
, case 
when app_char_job_code in ('Owner company') then 27.0 
when app_char_job_code in ('Permanent') then 40.0 
when app_char_job_code in ('Retired') then 56.0 
else 27.0 end as PSC_app_char_job_code 
 
/* , 1/(1+exp(-(-0.034679224495386775*(0.0+ calculated PSC_act_age+ calculated PSC_act_cc+ calculated PSC_app_number_of_children+ calculated PSC_act_ccss_n_statC+ calculated PSC_act12_n_arrears+ calculated PSC_app_char_job_code)+(11.971645480193441)))) as PD */ 
 
, 0.0 
+ calculated PSC_act_age + calculated PSC_act_cc + calculated PSC_app_number_of_children + calculated PSC_act_ccss_n_statC + calculated PSC_act12_n_arrears + calculated PSC_app_char_job_code  as SCORECARD_POINTS 
 
from &zbior as indataset; 
quit; 
