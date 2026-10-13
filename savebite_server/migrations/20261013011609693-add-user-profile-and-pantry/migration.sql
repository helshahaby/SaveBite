BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "pantry_item" (
    "id" bigserial PRIMARY KEY,
    "userId" uuid NOT NULL,
    "name" text NOT NULL,
    "category" text NOT NULL,
    "quantity" double precision NOT NULL,
    "unit" text NOT NULL,
    "storageType" text NOT NULL,
    "purchaseDate" timestamp without time zone NOT NULL,
    "expirationDate" timestamp without time zone NOT NULL,
    "status" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "pantry_user_status_idx" ON "pantry_item" USING btree ("userId", "status");
CREATE INDEX "pantry_expiration_idx" ON "pantry_item" USING btree ("expirationDate");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "user_profile" (
    "id" bigserial PRIMARY KEY,
    "authUserId" uuid NOT NULL,
    "fullName" text NOT NULL,
    "role" text NOT NULL,
    "phoneNumber" text,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "user_profile_auth_user_idx" ON "user_profile" USING btree ("authUserId");


--
-- MIGRATION VERSION FOR savebite
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('savebite', '20261013011609693-add-user-profile-and-pantry', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261013011609693-add-user-profile-and-pantry', "timestamp" = now();

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
