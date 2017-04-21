view: inventory_fact {
  sql_table_name: public.inventory_fact ;;

  dimension: date_key {
    type: number
    sql: ${TABLE}.date_key ;;
  }

  dimension: product_key {
    type: number
    sql: ${TABLE}.product_key ;;
  }

  dimension: product_version {
    type: number
    sql: ${TABLE}.product_version ;;
  }

  dimension: qty_in_stock {
    type: number
    sql: ${TABLE}.qty_in_stock ;;
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
