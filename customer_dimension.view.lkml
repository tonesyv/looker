view: customer_dimension {
  sql_table_name: public.customer_dimension ;;

  dimension: annual_income {
    type: number
    sql: ${TABLE}.annual_income ;;
  }

  dimension: customer_address {
    type: string
    sql: ${TABLE}.customer_address ;;
  }

  dimension: customer_age {
    type: number
    sql: ${TABLE}.customer_age ;;
    drill_fields: [,customer_city, customer_state]
  }

  dimension: customer_city {
    type: string
    sql: ${TABLE}.customer_city ;;

    drill_fields: [customer_address]
  }

  dimension: customer_gender {
    type: string
    sql: ${TABLE}.customer_gender ;;
    drill_fields: [customer_name, customer_state]
  }

  dimension: customer_key {
    primary_key: yes
    type: number
    sql: ${TABLE}.customer_key ;;
    drill_fields: [customer_type]
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}.customer_name ;;
    drill_fields: [customer_name, customer_age, customer_address, customer_city, customer_gender, customer_since_year]
  }

  dimension: customer_region {
    type: string
    sql: ${TABLE}.customer_region ;;
    drill_fields: [customer_city, customer_state, customer_since_year]
  }

  dimension_group: customer_since {
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
    sql: ${TABLE}.customer_since ;;
  }

  dimension: customer_state {
    type: string
    sql: ${TABLE}.customer_state ;;
    drill_fields: [customer_city, customer_address]
    map_layer_name: us_states
  }

  dimension: customer_type {
    type: string
    sql: ${TABLE}.customer_type ;;
  }

  dimension: deal_size {
    type: number
    sql: ${TABLE}.deal_size ;;
  }

  dimension: deal_stage {
    type: string
    sql: ${TABLE}.deal_stage ;;
  }

  dimension: household_id {
    type: number
    sql: ${TABLE}.household_id ;;
  }

  dimension: largest_bill_amount {
    type: number
    sql: ${TABLE}.largest_bill_amount ;;
  }

  dimension_group: last_deal_update {
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
    sql: ${TABLE}.last_deal_update ;;
  }

  dimension: marital_status {
    type: string
    sql: ${TABLE}.marital_status ;;
  }

  dimension: number_of_children {
    type: number
    sql: ${TABLE}.number_of_children ;;
  }

  dimension: occupation {
    type: string
    sql: ${TABLE}.occupation ;;
  }

  dimension: store_membership_card {
    type: number
    sql: ${TABLE}.store_membership_card ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: customer_age_tier {
    type: tier
    tiers: [0,10, 20, 30, 40,50,60, 70, 80, 90, 100]
    style: integer # the default value, could be excluded
    sql: ${customer_age} ;;
  }

  dimension: customer_annual_income_tier {
    type: tier
    tiers: [10000, 50000, 100000, 150000, 200000, 250000, 300000, 350000, 400000, 450000, 500000, 550000, 600000, 650000, 700000, 750000, 800000, 850000, 900000, 950000, 1000000 ]
    style: integer # the default value, could be excluded
    sql: ${annual_income} ;;
    value_format: "$0"
  }

  measure: count {
    type: count
    drill_fields: [customer_name, customer_state]
  }




}
