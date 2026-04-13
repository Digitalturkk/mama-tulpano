/*
  Warnings:

  - You are about to drop the `Tulpano` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "Tulpano";

-- CreateTable
CREATE TABLE "tulpanos" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "breastSize" VARCHAR(3) NOT NULL,
    "phone" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "tulpanos_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "tulpanos_phone_key" ON "tulpanos"("phone");

-- CreateIndex
CREATE UNIQUE INDEX "tulpanos_email_key" ON "tulpanos"("email");
