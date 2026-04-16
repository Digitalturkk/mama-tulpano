/*
  Warnings:

  - You are about to drop the column `createdAt` on the `tulpanos` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "tulpanos" DROP COLUMN "createdAt",
ADD COLUMN     "expirience" INTEGER,
ADD COLUMN     "photoUrl" TEXT;

-- CreateTable
CREATE TABLE "mamas" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "mamas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "clients" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "yearsOfLoyalty" INTEGER,

    CONSTRAINT "clients_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "mamas_phone_key" ON "mamas"("phone");

-- CreateIndex
CREATE UNIQUE INDEX "mamas_email_key" ON "mamas"("email");

-- CreateIndex
CREATE UNIQUE INDEX "clients_phone_key" ON "clients"("phone");

-- CreateIndex
CREATE UNIQUE INDEX "clients_email_key" ON "clients"("email");
