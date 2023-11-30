 /*
 This file is auto-generated from the current state of the Discourse core database schema. Instead
 of editing it directly, please update the `schema.yml` configuration file and re-run the
 `generate_schema` script to update it.
*/

CREATE TABLE categories (
  id INTEGER NOT NULL PRIMARY KEY,
  name TEXT NOT NULL,
  color TEXT NOT NULL,
  created_at DATETIME NOT NULL,
  slug TEXT NOT NULL,
  description TEXT,
  text_color TEXT NOT NULL,
  read_restricted BOOLEAN NOT NULL,
  position INTEGER,
  parent_category_id INTEGER,
  about_topic_title TEXT,
  old_relative_url TEXT,
  existing_id INTEGER,
  permissions JSON_TEXT,
  logo_upload_id TEXT,
  tag_group_ids JSON_TEXT
);

CREATE TABLE groups (
  id INTEGER NOT NULL PRIMARY KEY,
  name TEXT NOT NULL,
  full_name TEXT,
  visibility_level INTEGER NOT NULL,
  messageable_level INTEGER,
  mentionable_level INTEGER,
  members_visibility_level INTEGER NOT NULL,
  description TEXT
);

CREATE TABLE posts (
  id INTEGER NOT NULL PRIMARY KEY,
  user_id INTEGER,
  topic_id INTEGER NOT NULL,
  post_number INTEGER NOT NULL,
  raw TEXT NOT NULL,
  created_at DATETIME NOT NULL,
  like_count INTEGER NOT NULL,
  reply_to_post_id TEXT,
  original_raw TEXT,
  upload_ids JSON_TEXT,
  old_relative_url TEXT,
  accepted_answer BOOLEAN,
  small_action TEXT,
  whisper BOOLEAN,
  placeholders JSON_TEXT
);

CREATE INDEX posts_by_topic_post_number ON posts (topic_id, post_number);

CREATE TABLE topics (
  id INTEGER NOT NULL PRIMARY KEY,
  title TEXT NOT NULL,
  created_at DATETIME NOT NULL,
  views INTEGER NOT NULL,
  user_id INTEGER,
  category_id INTEGER,
  visible BOOLEAN NOT NULL,
  closed BOOLEAN NOT NULL,
  archived BOOLEAN NOT NULL,
  pinned_at DATETIME,
  subtype TEXT,
  pinned_globally BOOLEAN NOT NULL,
  pinned_until DATETIME,
  old_relative_url TEXT,
  private_message TEXT
);

CREATE TABLE uploads (
  id INTEGER NOT NULL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  filename TEXT NOT NULL,
  relative_path TEXT,
  type TEXT,
  data BLOB
);

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