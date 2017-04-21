view: product_dimension {
  sql_table_name: public.product_dimension ;;

  dimension: average_competitor_price {
    type: number
    sql: ${TABLE}.average_competitor_price ;;
  }

  dimension: category_description {
    type: string
    sql: ${TABLE}.category_description ;;
  }

  dimension: department_description {
    type: string
    sql: ${TABLE}.department_description ;;
  }

  dimension: diet_type {
    type: string
    sql: ${TABLE}.diet_type ;;
  }

  dimension: discontinued_flag {
    type: number
    sql: ${TABLE}.discontinued_flag ;;
  }

  dimension: fat_content {
    type: number
    sql: ${TABLE}.fat_content ;;
  }

  dimension: highest_competitor_price {
    type: number
    sql: ${TABLE}.highest_competitor_price ;;
  }

  dimension: lowest_competitor_price {
    type: number
    sql: ${TABLE}.lowest_competitor_price ;;
  }

  dimension: package_size {
    type: string
    sql: ${TABLE}.package_size ;;
  }

  dimension: package_type_description {
    type: string
    sql: ${TABLE}.package_type_description ;;
  }

  dimension: product_cost {
    type: number
    sql: ${TABLE}.product_cost ;;
  }

  dimension: product_description {
    type: string
    sql: ${TABLE}.product_description ;;
  }

  dimension: product_key {
    type: number
    sql: ${TABLE}.product_key ;;
  }

  dimension: product_price {
    type: number
    sql: ${TABLE}.product_price ;;
  }

  dimension: product_version {
    type: number
    sql: ${TABLE}.product_version ;;
  }

  dimension: shelf_depth {
    type: number
    sql: ${TABLE}.shelf_depth ;;
  }

  dimension: shelf_height {
    type: number
    sql: ${TABLE}.shelf_height ;;
  }

  dimension: shelf_width {
    type: number
    sql: ${TABLE}.shelf_width ;;
  }

  dimension: sku_number {
    type: string
    sql: ${TABLE}.sku_number ;;
  }

  dimension: weight {
    type: number
    sql: ${TABLE}.weight ;;
  }

  dimension: weight_units_of_measure {
    type: string
    sql: ${TABLE}.weight_units_of_measure ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
