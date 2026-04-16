/*
  Warnings:

  - Added the required column `pricePerHour` to the `tulpanos` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "tulpanos" ADD COLUMN     "mamaId" TEXT,
ADD COLUMN     "pricePerHour" INTEGER NOT NULL;

-- CreateTable
CREATE TABLE "_ClientTulpanos" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_ClientTulpanos_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateIndex
CREATE INDEX "_ClientTulpanos_B_index" ON "_ClientTulpanos"("B");

-- AddForeignKey
ALTER TABLE "tulpanos" ADD CONSTRAINT "tulpanos_mamaId_fkey" FOREIGN KEY ("mamaId") REFERENCES "mamas"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ClientTulpanos" ADD CONSTRAINT "_ClientTulpanos_A_fkey" FOREIGN KEY ("A") REFERENCES "clients"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ClientTulpanos" ADD CONSTRAINT "_ClientTulpanos_B_fkey" FOREIGN KEY ("B") REFERENCES "tulpanos"("id") ON DELETE CASCADE ON UPDATE CASCADE;
