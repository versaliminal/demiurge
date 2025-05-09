-- name: GetService :one
SELECT * FROM services
WHERE id = $1 LIMIT 1;

-- name: ListServices :many
SELECT * FROM services
ORDER BY name;

-- name: CreateService :one
INSERT INTO services (
  name, pod_id, version, image, labels
) VALUES (
  $1, $2, $3, $4, $5
)
RETURNING *;

-- name: DeleteService :exec
DELETE FROM services
WHERE id = $1;