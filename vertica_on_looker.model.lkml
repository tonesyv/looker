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


explore: store_sales_fact {
  join: store_dimension {
    type: left_outer
    sql_on: ${store_sales_fact.store_key} = ${store_dimension.store_key} ;;
    relationship: many_to_one
  }

  join:customer_dimension {
    type: left_outer
    sql_on: ${store_sales_fact.customer_key} = ${customer_dimension.customer_key} ;;
    relationship: many_to_one
  }

  join:employee_dimension {
    type: left_outer
    sql_on: ${store_sales_fact.employee_key} = ${employee_dimension.employee_key} ;;
    relationship: many_to_one
  }

  join:product_dimension {
    type: left_outer
    sql_on: ${store_sales_fact.product_key} = ${product_dimension.product_key} AND
      ${store_sales_fact.product_version} = ${product_dimension.product_version};;
    relationship: many_to_one
  }


  join: date_dimension  {
    type: left_outer
    sql_on: ${store_sales_fact.date_key} =${date_dimension.date_key} ;;
    relationship: many_to_one

  }

  join: vendor_dimension {
    type: left_outer
    sql_on: ${store_orders_fact.vendor_key} = ${vendor_dimension.vendor_key};;
    relationship: many_to_one

  }

  join: inventory_fact {
    type: left_outer
    sql_on: ${store_orders_fact.product_key} = ${inventory_fact.product_key} AND
      ${store_orders_fact.product_version} = ${inventory_fact.product_version};;
    relationship: many_to_one

  }

  join: warehouse_dimension{
    type: left_outer
    sql_on: ${inventory_fact.warehouse_key} = ${warehouse_dimension.warehouse_key};;
    relationship: many_to_one

  }

  join: store_orders_fact  {
    type: left_outer
    sql_on: ${store_sales_fact.product_key} = ${store_orders_fact.product_key} AND
     ${store_sales_fact.product_version} = ${store_orders_fact.product_version}
   /*
   AND ${store_sales_fact.store_key} = ${store_orders_fact.store_key} AND
      ${store_sales_fact.employee_key} = ${store_orders_fact.employee_key}
    */
    ;;
    relationship: many_to_one

  }
}

explore: store_dimension {
 join: store_sales_fact {
   type: left_outer
  sql_on: ${store_sales_fact.store_key} = ${store_dimension.store_key} ;;
  relationship: many_to_one
  }
}

explore: customer_dimension {
  join: store_sales_fact {
    type: left_outer
    sql_on: ${store_sales_fact.customer_key} = ${customer_dimension.customer_key} ;;
    relationship: many_to_one
 }
  join: store_dimension {
    type: left_outer
    sql_on: ${store_dimension.store_key} = ${store_sales_fact.store_key}  ;;
    relationship: many_to_one
  }
}
explore: employee_dimension {
  hidden: yes
}
