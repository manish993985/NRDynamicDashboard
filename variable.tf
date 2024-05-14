variable "dashboard" {
  type = map(object({
    name        = string
    permissions = string
    pagename    = string
    widgetpie = map(object({
      title  = string
      row    = number
      column = number
      width  = number
      height = number
      query  = string

    }))
    widgetbar = map(object({
      title  = string
      row    = number
      column = number
      width  = number
      height = number
      query  = string

    }))
  }))
}