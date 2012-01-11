CREATE TABLE "comments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(50) DEFAULT '', "comment" text, "commentable_id" integer, "commentable_type" varchar(255), "user_id" integer, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "fortunes" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "source" varchar(255), "body" text, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "provider" varchar(255), "uid" varchar(255), "name" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE INDEX "index_comments_on_commentable_id" ON "comments" ("commentable_id");
CREATE INDEX "index_comments_on_commentable_type" ON "comments" ("commentable_type");
CREATE INDEX "index_comments_on_user_id" ON "comments" ("user_id");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20111103181551');

INSERT INTO schema_migrations (version) VALUES ('20111103223559');

INSERT INTO schema_migrations (version) VALUES ('20111104113200');