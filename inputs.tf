variable project_id {
  type = string
}

variable boolorgpols {
  description = "boolean org policies to enable"
  type        = list(string)
}

variable listorgpols {
  description = "allow all / deny all org policies to enable"
  type        = list(string)
}
