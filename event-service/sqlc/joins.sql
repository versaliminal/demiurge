-- name: GetEventContextSummary :one
select
	events.id,
    events.name,
    environments.id,
    environments.name,
    nodes.id,
    nodes.name,
    nodes.primary_ipv4,
    nodes.primary_ipv6,
    services.id,
    services.name,
    services.pod_id
from
    events
    left join event_environments
    	on event_environments.event_id = events.id
    left join event_nodes
    	on event_nodes.event_id = events.id
    left join event_services
    	on event_services.event_id = events.id
    inner join environments
    	on event_environments.environment_id = environments.id
    inner join nodes
    	on event_nodes.id = nodes.id
    inner join services
    	on event_services = services.id
where
    events.id = $1;