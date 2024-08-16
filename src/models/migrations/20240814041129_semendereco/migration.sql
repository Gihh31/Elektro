/*
  Warnings:

  - You are about to drop the column `Bairro` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `CEP` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `Cidade` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `Estado` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `Logradouro` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `Numero` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `Rua` on the `User` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "User" DROP COLUMN "Bairro",
DROP COLUMN "CEP",
DROP COLUMN "Cidade",
DROP COLUMN "Estado",
DROP COLUMN "Logradouro",
DROP COLUMN "Numero",
DROP COLUMN "Rua";
