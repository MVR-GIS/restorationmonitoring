-- Bounded local copy of a single RF feature class, not the production schema.
CREATE SCHEMA rf;
CREATE TABLE rf.dataset_snapshot (snapshot_id VARCHAR PRIMARY KEY, source_class VARCHAR NOT NULL, source_sha256 VARCHAR NOT NULL, source_name VARCHAR NOT NULL);
CREATE TABLE rf.revetment (snapshot_id VARCHAR NOT NULL REFERENCES rf.dataset_snapshot(snapshot_id), restorfeatidpk BIGINT NOT NULL, feature_name VARCHAR, project_id VARCHAR, program_uid VARCHAR, restorfeatstatus VARCHAR, umrrtype VARCHAR, umrrsubtype VARCHAR, geometry GEOMETRY, geometry_crs VARCHAR, geometry_note VARCHAR NOT NULL, PRIMARY KEY(snapshot_id, restorfeatidpk));
-- Isolated example: synthetic coordinates are never assigned to real features.
CREATE TABLE rf.spatial_demo (demo_id INTEGER PRIMARY KEY, description VARCHAR NOT NULL, geometry GEOMETRY NOT NULL, crs_note VARCHAR NOT NULL);
