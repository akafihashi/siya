-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Banner" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "key" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "subtitle" TEXT,
    "imageUrl" TEXT NOT NULL,
    "ctaText" TEXT NOT NULL DEFAULT 'Shop now',
    "ctaHref" TEXT NOT NULL DEFAULT '/',
    "active" BOOLEAN NOT NULL DEFAULT true,
    "startsAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "endsAt" DATETIME,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);
INSERT INTO "new_Banner" ("active", "createdAt", "ctaHref", "ctaText", "endsAt", "id", "imageUrl", "key", "startsAt", "subtitle", "title", "updatedAt") SELECT "active", "createdAt", "ctaHref", "ctaText", "endsAt", "id", "imageUrl", "key", "startsAt", "subtitle", "title", "updatedAt" FROM "Banner";
DROP TABLE "Banner";
ALTER TABLE "new_Banner" RENAME TO "Banner";
CREATE UNIQUE INDEX "Banner_key_key" ON "Banner"("key");
CREATE INDEX "Banner_key_active_idx" ON "Banner"("key", "active");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
