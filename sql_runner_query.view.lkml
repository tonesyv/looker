view: stores_with_shops {
  derived_table: {
    sql: SELECT
        store_dimension.store_state  AS "store_dimension.store_state",
        COUNT(*) AS "store_dimension.count"
      FROM store.store_dimension  AS store_dimension

      GROUP BY 1
      ORDER BY 2 desc
      LIMIT 50
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: store_dimension_store_state {
    type: string
    sql: ${TABLE}."store_dimension.store_state" ;;
  }

  dimension: store_dimension_count {
    type: number
    sql: ${TABLE}."store_dimension.count" ;;
  }

  set: detail {
    fields: [store_dimension_store_state, store_dimension_count]
  }
}
