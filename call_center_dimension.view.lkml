view: call_center_dimension {
  sql_table_name: online_sales.call_center_dimension ;;

  dimension: call_center_key {
    type: number
    sql: ${TABLE}.call_center_key ;;
  }

  dimension: cc_address {
    type: string
    sql: ${TABLE}.cc_address ;;
  }

  dimension: cc_city {
    type: string
    sql: ${TABLE}.cc_city ;;
  }

  dimension: cc_class {
    type: string
    sql: ${TABLE}.cc_class ;;
  }

  dimension_group: cc_closed {
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
    sql: ${TABLE}.cc_closed_date ;;
  }

  dimension: cc_employees {
    type: number
    sql: ${TABLE}.cc_employees ;;
  }

  dimension: cc_hours {
    type: string
    sql: ${TABLE}.cc_hours ;;
  }

  dimension: cc_manager {
    type: string
    sql: ${TABLE}.cc_manager ;;
  }

  dimension: cc_name {
    type: string
    sql: ${TABLE}.cc_name ;;
  }

  dimension_group: cc_open {
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
    sql: ${TABLE}.cc_open_date ;;
  }

  dimension: cc_region {
    type: string
    sql: ${TABLE}.cc_region ;;
  }

  dimension: cc_state {
    type: string
    sql: ${TABLE}.cc_state ;;
  }

  measure: count {
    type: count
    drill_fields: [cc_name]
  }
}
