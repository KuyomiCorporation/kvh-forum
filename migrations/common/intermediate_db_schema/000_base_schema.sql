 /*
 This file is auto-generated from the current state of the Discourse core database schema. Instead
 of editing it directly, please update the `schema.yml` configuration file and re-run the
 `generate_schema` script to update it.
*/

CREATE TABLE users (
  id INTEGER NOT NULL PRIMARY KEY,
  username TEXT NOT NULL,
  created_at DATETIME,
  name TEXT,
  last_seen_at DATETIME,
  admin BOOLEAN NOT NULL,
  trust_level INTEGER,
  approved BOOLEAN NOT NULL,
  approved_at DATETIME,
  date_of_birth DATE,
  moderator BOOLEAN,
  registration_ip_address TEXT,
  staged BOOLEAN,
  email TEXT,
  avatar_path TEXT,
  avatar_url TEXT,
  avatar_upload_id TEXT,
  bio TEXT,
  password TEXT,
  suspension TEXT,
  location TEXT,
  website TEXT,
  old_relative_url TEXT,
  sso_record TEXT,
  anonymized BOOLEAN,
  original_username TEXT,
  timezone TEXT,
  email_level INTEGER,
  email_messages_level INTEGER,
  email_digests BOOLEAN
);