view: store_orders_fact {
  sql_table_name: store.store_orders_fact ;;

  dimension_group: date_delivered {
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
    sql: ${TABLE}.date_delivered ;;
  }

  dimension_group: date_ordered {
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
    sql: ${TABLE}.date_ordered ;;
  }

  dimension_group: date_shipped {
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
    sql: ${TABLE}.date_shipped ;;
  }

  dimension: employee_key {
    type: number
    sql: ${TABLE}.employee_key ;;
  }

  dimension_group: expected_delivery {
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
    sql: ${TABLE}.expected_delivery_date ;;
  }

  dimension: order_number {
    type: number
    sql: ${TABLE}.order_number ;;
  }

  dimension: overstock_ceiling {
    type: number
    sql: ${TABLE}.overstock_ceiling ;;
  }

  dimension: product_key {
    type: number
    sql: ${TABLE}.product_key ;;
    drill_fields: [product.product_description]
  }

  dimension: product_version {
    type: number
    sql: ${TABLE}.product_version ;;
  }

  dimension: quantity_delivered {
    type: number
    sql: ${TABLE}.quantity_delivered ;;
  }

  dimension: quantity_in_stock {
    type: number
    sql: ${TABLE}.quantity_in_stock ;;
  }

  dimension: quantity_ordered {
    type: number
    sql: ${TABLE}.quantity_ordered ;;
    drill_fields: [customer.customer_key, customer.customer_type]
  }

  dimension: reorder_level {
    type: number
    sql: ${TABLE}.reorder_level ;;
    drill_fields: [custumer_dimension.customer_key]
  }

  dimension: shipper_name {
    type: string
    sql: ${TABLE}.shipper_name ;;
  }

  dimension: shipping_cost {
    type: number
    sql: ${TABLE}.shipping_cost ;;
  }

  dimension: store_key {
    type: number
    sql: ${TABLE}.store_key ;;
  }

  dimension: total_order_cost {
    type: number
    sql: ${TABLE}.total_order_cost ;;
  }

  dimension: unit_price {
    type: number
    sql: ${TABLE}.unit_price ;;
  }

  dimension: vendor_key {
    type: number
    sql: ${TABLE}.vendor_key ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure:  total_shipping_cost {
    type: sum
    sql: ${shipping_cost};;
    value_format_name: usd
  }

  measure: liftetime_orders {
    type: count_distinct
    sql: ${quantity_ordered} ;;
    drill_fields: [date_ordered_date]

  }
  measure: reorders {
    type: count_distinct
    sql: ${reorder_level} ;;
    drill_fields: [customer_dimension.customer_key]
  }

  measure: quantity_pr_customer {
    type: count_distinct
    sql: ${quantity_ordered} ;;
    drill_fields: [customer_dimension.customer_key]
  }
}
