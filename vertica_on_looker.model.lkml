connection: "verticadb"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }

explore: store_dimension {
  join: store_sales_fact {
    type: left_outer
    sql_on: ${store_dimension.store_key} = ${store_sales_fact.store_key} ;;
    relationship: many_to_one
   }
  }

  explore: customer_dimension {
    join:store_sales_fact {
      type: left_outer
      sql_on: ${store_sales_fact.customer_key} = ${customer_dimension.customer_key} ;;
      relationship: many_to_one
    }

    join:store_dimension {
      type: left_outer
      sql_on: sql_on: ${store_dimension.store_key} = ${store_sales_fact.store_key} ;;
      relationship: many_to_one
    }
  }

explore: store_sales_fact {
  join: store_dimension {
    type: left_outer
    sql_on: ${store_sales_fact.store_key} = ${store_dimension.store_key} ;;
    relationship: many_to_one
  }
}


explore:  total_sale_state {}
