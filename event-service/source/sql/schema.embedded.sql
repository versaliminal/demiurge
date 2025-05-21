CREATE TABLE "environments"
  (
     "id"   INTEGER PRIMARY KEY,
     "name" TEXT NOT NULL
  );

CREATE TABLE "events"
  (
     "id"   INTEGER PRIMARY KEY,
     "name" TEXT NOT NULL
  );

CREATE TABLE "event_environments"
  (
     "event_id"       BIGINT NOT NULL,
     "environment_id" BIGINT NOT NULL,
     CONSTRAINT "environment_fk" FOREIGN KEY ("environment_id") REFERENCES
     "environments" ("id") ON UPDATE no action ON DELETE no action,
     CONSTRAINT "event_fk" FOREIGN KEY ("event_id") REFERENCES "events"
     ("id") ON UPDATE no action ON DELETE no action
  );

CREATE TABLE "nodes"
  (
     "id"           INTEGER PRIMARY KEY,
     "name"         TEXT NULL,
     "primary_ipv4" TEXT NULL,
     "primary_ipv6" TEXT NULL,
     "addresses"    TEXT[] NOT NULL,
     "labels"       TEXT[] NOT NULL,
     "raw"          JSON NULL
  );

CREATE TABLE "event_nodes"
  (
     "event_id" BIGINT NOT NULL,
     "node_id"  BIGINT NOT NULL,
     CONSTRAINT "event_fk" FOREIGN KEY ("event_id") REFERENCES "events"
     ("id") ON UPDATE no action ON DELETE no action,
     CONSTRAINT "node_fk" FOREIGN KEY ("node_id") REFERENCES "nodes" (
     "id") ON UPDATE no action ON DELETE no action
  );

CREATE TABLE "services"
  (
     "id"      INTEGER PRIMARY KEY,
     "name"    TEXT NOT NULL,
     "pod_id"  TEXT NULL,
     "version" TEXT NULL,
     "image"   TEXT NULL,
     "labels"  TEXT[] NOT NULL
  );

CREATE TABLE "event_services"
  (
     "event_id"   BIGINT NOT NULL,
     "service_id" BIGINT NOT NULL,
     CONSTRAINT "event_fk" FOREIGN KEY ("event_id") REFERENCES "events"
     ("id") ON UPDATE no action ON DELETE no action,
     CONSTRAINT "service_fk" FOREIGN KEY ("service_id") REFERENCES
     "services" ("id") ON UPDATE no action ON DELETE no action
  );  