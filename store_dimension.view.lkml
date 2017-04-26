view: store_dimension {
  sql_table_name: store.store_dimension ;;

  dimension: annual_shrinkage {
    type: number
    sql: ${TABLE}.annual_shrinkage ;;
  }

  dimension: financial_service_type {
    type: string
    sql: ${TABLE}.financial_service_type ;;
  }

  dimension_group: first_open {
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
    sql: ${TABLE}.first_open_date ;;
  }

  dimension: floor_plan_type {
    type: string
    sql: ${TABLE}.floor_plan_type ;;
  }

  dimension: foot_traffic {
    type: number
    sql: ${TABLE}.foot_traffic ;;
  }

  dimension_group: last_remodel {
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
    sql: ${TABLE}.last_remodel_date ;;
  }

  dimension: monthly_rent_cost {
    type: number
    sql: ${TABLE}.monthly_rent_cost ;;
  }

  dimension: number_of_employees {
    type: number
    sql: ${TABLE}.number_of_employees ;;
  }

  dimension: photo_processing_type {
    type: string
    sql: ${TABLE}.photo_processing_type ;;
  }

  dimension: selling_square_footage {
    type: number
    sql: ${TABLE}.selling_square_footage ;;
  }

  dimension: store_address {
    type: string
    sql: ${TABLE}.store_address ;;
  }

  dimension: store_city {
    type: string
    sql: ${TABLE}.store_city ;;
    drill_fields: [store_name, store_address]
  }

  dimension: store_key {
    type: number
    sql: ${TABLE}.store_key ;;
  }

  dimension: store_name {
    type: string
    sql: ${TABLE}.store_name ;;
  }

  dimension: store_number {
    type: number
    sql: ${TABLE}.store_number ;;
  }

  dimension: store_region {
    type: string
    sql: ${TABLE}.store_region ;;
    drill_fields: [store_state, store_city]
  }

  dimension: store_state {
    type: string
    sql: ${TABLE}.store_state ;;
    drill_fields: [store_city, store_address]
    map_layer_name: us_states
  }

  dimension: total_square_footage {
    type: number
    sql: ${TABLE}.total_square_footage ;;
  }

  measure: count {
    type: count
    drill_fields: [store_state, store_city, store_name, store_key]
  }

  measure: count_by_state {
    type: count


  }
}
