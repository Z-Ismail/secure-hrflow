{{ config(materialized='view') }}

select
    cast(EmployeeNumber as int) as employee_id,
    Attrition,
    Age,
    Department,
    JobRole,
    Gender,
    MaritalStatus,
    Education,
    BusinessTravel,
    cast(MonthlyIncome as int) as monthly_income,
    cast(YearsAtCompany as int) as years_at_company,
    cast(YearsInCurrentRole as int) as years_in_role,
    cast(PercentSalaryHike as int) as salary_hike_percent
from dbo.employee_attrition
