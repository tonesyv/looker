view: store_sales_fact {
  sql_table_name: store.store_sales_fact ;;

  dimension: cost_dollar_amount {
    type: number
    value_format_name: usd
    sql: ${TABLE}.cost_dollar_amount/100  ;;
  }

  dimension: customer_key {
    type: number
    sql: ${TABLE}.customer_key ;;
  }

  dimension: date_key {
    type: number
    sql: ${TABLE}.date_key ;;
  }

  dimension: employee_key {
    type: number
    sql: ${TABLE}.employee_key ;;
  }

  dimension: gross_profit_dollar_amount {
    type: number
    value_format_name: usd
    sql: ${TABLE}.gross_profit_dollar_amount/100  ;;
  }

  dimension: pos_transaction_number {
    type: number
    sql: ${TABLE}.pos_transaction_number ;;
  }

  dimension: product_key {
    type: number
    sql: ${TABLE}.product_key ;;
  }


  dimension: product_version {
    type: number
    sql: ${TABLE}.product_version ;;
  }

  dimension: promotion_key {
    type: number
    sql: ${TABLE}.promotion_key ;;
  }

  dimension: sales_dollar_amount {
    type: number
    value_format_name: usd
    sql: ${TABLE}.sales_dollar_amount/100 ;;

  }

  dimension: sales_quantity {
    type: number
    sql: ${TABLE}.sales_quantity ;;
  }

  dimension: store_key {
    type: number
    sql: ${TABLE}.store_key ;;
  }

  dimension: tender_type {
    type: string
    sql: ${TABLE}.tender_type ;;
  }

  dimension: transaction_time {
    type: string
    sql: ${TABLE}.transaction_time ;;
  }

  dimension: transaction_type {
    type: string
    sql: ${TABLE}.transaction_type ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure:  total_sales_amount {
    type: sum
    sql: ${sales_dollar_amount};;
    value_format_name: usd
    drill_fields: [store_key, product_key, product_version]
  }

  measure:  total_cost_amount {
    type: sum
    sql: ${cost_dollar_amount};;
    value_format_name: usd
    drill_fields: [store_key, product_key, product_version]
  }
  measure:  total_profit {
    type: sum
    sql: ${gross_profit_dollar_amount};;
    value_format_name: usd
    drill_fields: [store_key, product_key, product_version]
  }





}
