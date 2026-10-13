BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "pantry_item" ADD COLUMN "cost" double precision;
ALTER TABLE "pantry_item" ADD COLUMN "notes" text;
ALTER TABLE "pantry_item" ADD COLUMN "consumedAt" timestamp without time zone;
ALTER TABLE "pantry_item" ADD COLUMN "wastedAt" timestamp without time zone;

--
-- MIGRATION VERSION FOR savebite
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('savebite', '20261013012445737-add-pantry-details', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261013012445737-add-pantry-details', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20260824182259319', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260824182259319', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_idp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20260924105404509', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260924105404509', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20260924105232991', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260924105232991', "timestamp" = now();


COMMIT;
