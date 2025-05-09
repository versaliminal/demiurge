-- name: GetNode :one
SELECT * FROM nodes
WHERE id = $1 LIMIT 1;

-- name: ListNodes :many
SELECT * FROM nodes
ORDER BY name;

-- name: CreateNode :one
INSERT INTO nodes (
  name, primary_ipv4, primary_ipv6, addresses, labels, raw
) VALUES (
  $1, $2, $3, $4, $5, $6
)
RETURNING *;

-- name: DeleteNode :exec
DELETE FROM nodes
WHERE id = $1;