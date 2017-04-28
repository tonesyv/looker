view: employee_dimension {
  sql_table_name: public.employee_dimension ;;

  dimension: annual_salary {
    type: number
    sql: ${TABLE}.annual_salary ;;
  }

  dimension: courtesy_title {
    type: string
    sql: ${TABLE}.courtesy_title ;;
  }

  dimension: employee_age {
    type: number
    sql: ${TABLE}.employee_age ;;
  }

  dimension: employee_city {
    type: string
    sql: ${TABLE}.employee_city ;;

  }

  dimension: employee_first_name {
    type: string
    sql: ${TABLE}.employee_first_name ;;
  }

  dimension: employee_gender {
    type: string
    sql: ${TABLE}.employee_gender ;;
  }

  dimension: employee_key {
    primary_key: yes
    type: number
    sql: ${TABLE}.employee_key ;;
  }

  dimension: employee_last_name {
    type: string
    sql: ${TABLE}.employee_last_name ;;
  }


  dimension: employee_middle_initial {
    type: string
    sql: ${TABLE}.employee_middle_initial ;;
  }

  dimension: name {
    sql: CONCAT(${TABLE}.employee_first_name,' ', ${TABLE}.employee_last_name) ;;
  }

  dimension: employee_region {
    type: string
    sql: ${TABLE}.employee_region ;;
    drill_fields: [employee_state, employee_city]
  }

  dimension: employee_state {
    type: string
    sql: ${TABLE}.employee_state ;;
    drill_fields: [employee_city, employee_street_address]
    map_layer_name: us_states
  }

  dimension: employee_street_address {
    type: string
    sql: ${TABLE}.employee_street_address ;;
  }

  dimension_group: hire {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql: ${TABLE}.hire_date ;;
  }

  dimension: hourly_rate {
    type: number
    sql: ${TABLE}.hourly_rate ;;
  }

  dimension: job_title {
    type: string
    sql: ${TABLE}.job_title ;;
  }

  dimension: reports_to {
    type: number
    sql: ${TABLE}.reports_to ;;
  }

  dimension: salaried_flag {
    type: number
    sql: ${TABLE}.salaried_flag ;;
  }

  dimension: vacation_days {
    type: number
    sql: ${TABLE}.vacation_days ;;
  }

  dimension: employee_age_tier {
    type: tier
    tiers: [0,18, 25, 35, 45,55,65]
    style: integer
    sql: ${employee_age} ;;
  }

  measure: count {
    type: count
    drill_fields: [employee_last_name, employee_first_name]
  }


}
