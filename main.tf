resource "newrelic_one_dashboard" "dynamicdashboard" {
  for_each    = var.dashboard
  name        = each.value.name
  permissions = each.value.permissions

  page {
    name = each.value.pagename

    dynamic "widget_pie" {
      for_each = each.value.widgetpie
      content {
        title  = widget_pie.value.title
        row    = widget_pie.value.row
        column = widget_pie.value.column
        height = widget_pie.value.height
        width  = widget_pie.value.width
        nrql_query {
          query = widget_pie.value.query
        }
      }
    }

    dynamic "widget_bar" {
      for_each = each.value.widgetbar
      content {
        title  = widget_bar.value.title
        row    = widget_bar.value.row
        column = widget_bar.value.column
        height = widget_bar.value.height
        width  = widget_bar.value.width
        nrql_query {
          query = widget_bar.value.query
        }
      }
    }
  }
}
