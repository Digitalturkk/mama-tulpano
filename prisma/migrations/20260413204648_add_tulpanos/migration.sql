-- CreateTable
CREATE TABLE "Tulpano" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "breastSize" VARCHAR(3) NOT NULL,
    "phone" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Tulpano_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Tulpano_phone_key" ON "Tulpano"("phone");

-- CreateIndex
CREATE UNIQUE INDEX "Tulpano_email_key" ON "Tulpano"("email");
