{{ config(materialized='table') }}

with base as (
    select
        department,
        jobrole,
        gender,
        attrition,
        cast(monthly_income as float) as monthly_income,
        cast(age as float) as age,
        cast(years_at_company as float) as years_at_company
    from {{ ref('stg_employee_attrition') }}
),

summary as (
    select
        department,
        jobrole,
        gender,
        count(*) as total_employees,
        sum(case when attrition = 'Yes' then 1 else 0 end) as attrition_count,
        round(100.0 * sum(case when attrition = 'Yes' then 1 else 0 end) / count(*), 2) as attrition_rate_percent,
        avg(monthly_income) as avg_monthly_income,
        avg(age) as avg_age,
        avg(years_at_company) as avg_tenure
    from base
    group by department, jobrole, gender
)

select * from summary
