-- name: GetEnvironment :one
SELECT * FROM environments
WHERE id = $1 LIMIT 1;

-- name: ListEnvironments :many
SELECT * FROM environments
ORDER BY name;

-- name: CreateEnvironment :one
INSERT INTO environments (
  name
) VALUES (
  $1
)
RETURNING *;

-- name: DeleteEnvironment :exec
DELETE FROM environments
WHERE id = $1;