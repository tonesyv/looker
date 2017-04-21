view: online_sales_fact {
  sql_table_name: online_sales.online_sales_fact ;;

  dimension: call_center_key {
    type: number
    sql: ${TABLE}.call_center_key ;;
  }

  dimension: cost_dollar_amount {
    type: number
    sql: ${TABLE}.cost_dollar_amount ;;
  }

  dimension: customer_key {
    type: number
    sql: ${TABLE}.customer_key ;;
  }

  dimension: gross_profit_dollar_amount {
    type: number
    sql: ${TABLE}.gross_profit_dollar_amount ;;
  }

  dimension: net_dollar_amount {
    type: number
    sql: ${TABLE}.net_dollar_amount ;;
  }

  dimension: online_page_key {
    type: number
    sql: ${TABLE}.online_page_key ;;
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

  dimension: sale_date_key {
    type: number
    sql: ${TABLE}.sale_date_key ;;
  }

  dimension: sales_dollar_amount {
    type: number
    sql: ${TABLE}.sales_dollar_amount ;;
  }

  dimension: sales_quantity {
    type: number
    sql: ${TABLE}.sales_quantity ;;
  }

  dimension: ship_date_key {
    type: number
    sql: ${TABLE}.ship_date_key ;;
  }

  dimension: ship_dollar_amount {
    type: number
    sql: ${TABLE}.ship_dollar_amount ;;
  }

  dimension: shipping_key {
    type: number
    sql: ${TABLE}.shipping_key ;;
  }

  dimension: transaction_type {
    type: string
    sql: ${TABLE}.transaction_type ;;
  }

  dimension: warehouse_key {
    type: number
    sql: ${TABLE}.warehouse_key ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
