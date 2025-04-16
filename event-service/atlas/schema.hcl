table "events" {
  schema = schema.public
  column "id" {
    null = false
    type = bigint
  }
  column "name" {
    null = false
    type = text
  }
  primary_key {
    columns = [column.id]
  }
}

table "environments" {
  schema = schema.public
  column "id" {
    null = false
    type = bigint
    auto_increment = true
  }
  column "name" {
    null = false
    type = text
  }
  primary_key {
    columns = [column.id]
  }
}

table "event_environments" {
  schema = schema.public
  column "event_id" {
    null = false
    type = bigint
  }
  column "environment_id" {
    null = false
    type = bigint
  }
  foreign_key "event_fk" {
    columns = [column.event_id]
    ref_columns = [table.events.column.id]
    on_delete = NO_ACTION
    on_update = NO_ACTION
  }
  foreign_key "environment_fk" {
    columns = [column.environment_id]
    ref_columns = [table.environments.column.id]
    on_delete = NO_ACTION
    on_update = NO_ACTION
  }
}

table "nodes" {
    schema = schema.public
    column "id" {
      null = false
      type = bigint
      auto_increment = true
    }
    column "name" {
      null = true
      type = text
    }
    column "primary_ipv4" {
      null = true
      type = text
    }
    column "primary_ipv6" {
      null = true
      type = text
    }
    column "addresses" {
      type = sql("text[]")
    }
    column "labels" {
      type = sql("text[]")
    }
    column "raw" {
      null = true
      type = json
    }
    primary_key {
      columns = [column.id]
    }
}

table "event_nodes" {
  schema = schema.public
  column "event_id" {
    null = false
    type = bigint
  }
  column "node_id" {
    null = false
    type = bigint
  }
  foreign_key "event_fk" {
    columns = [column.event_id]
    ref_columns = [table.events.column.id]
    on_delete = NO_ACTION
    on_update = NO_ACTION
  }
  foreign_key "node_fk" {
    columns = [column.node_id]
    ref_columns = [table.nodes.column.id]
    on_delete = NO_ACTION
    on_update = NO_ACTION
  }
}

table "services" {
    schema = schema.public
    column "id" {
      null = false
      type = bigint
      auto_increment = true
    }
    column "name" {
      null = false
      type = text
    }
    column "pod_id" {
      null = true
      type = text
    }
    column "version" {
      null = true
      type = text
    }
    column "image" {
      null = true
      type = text
    }
    column "labels" {
      type = sql("text[]")
    }
    primary_key {
      columns = [column.id]
    }
}

table "event_services" {
  schema = schema.public
  column "event_id" {
    null = false
    type = bigint
  }
  column "service_id" {
    null = false
    type = bigint
  }
  foreign_key "event_fk" {
    columns = [column.event_id]
    ref_columns = [table.events.column.id]
    on_delete = NO_ACTION
    on_update = NO_ACTION
  }
  foreign_key "service_fk" {
    columns = [column.service_id]
    ref_columns = [table.services.column.id]
    on_delete = NO_ACTION
    on_update = NO_ACTION
  }
}

schema "public" {
  comment = "standard public schema"
}