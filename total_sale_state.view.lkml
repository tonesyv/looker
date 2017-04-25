view: total_sale_state {
  derived_table: {
    sql: select store.store_dimension.store_state, SUM(store.store_sales_fact.sales_dollar_amount)
      from store.store_dimension

      inner join store.store_sales_fact
      on store.store_dimension.store_key = store.store_sales_fact.store_key

      group by store.store_dimension.store_state

      order by SUM(store.store_sales_fact.sales_dollar_amount) desc;
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: store_state {
    type: string
    sql: ${TABLE}.store_state ;;
  }

  dimension: sum {
    type: number
    sql: ${TABLE}.SUM ;;
  }

  set: detail {
    fields: [store_state, sum]
  }
}
