package main_test

import (
	"context"
	"database/sql"
	"demiurge/event-service/events_db"
	_ "embed"
	"fmt"
	"testing"

	"github.com/stretchr/testify/assert"
	_ "modernc.org/sqlite"
)

//go:embed sql/schema.embedded.sql
var ddl string

func TestMain(t *testing.T) {
	t.Log("Testing main")
	ctx := context.Background()

	db, err := sql.Open("sqlite", ":memory:")
	assert.NoError(t, err, "Failed to open DB")

	// create tables
	_, err = db.ExecContext(ctx, ddl)
	assert.NoError(t, err, "Failed to create db context")

	queries := events_db.New(db)
	event_in, err := queries.CreateEvent(ctx, "test-event")
	assert.NoError(t, err, fmt.Sprintf("Could not create event: %s", err))
	event_out, err := queries.GetEvent(ctx, event_in.ID)
	assert.NoError(t, err, fmt.Sprintf("Could not query event: %s", err))
	assert.Equal(t, event_in, event_out, fmt.Sprintf("Events are not the same: %+v %+v", event_in, event_out))
	fmt.Printf("Retrieved event: %+v\n", event_out)
}
