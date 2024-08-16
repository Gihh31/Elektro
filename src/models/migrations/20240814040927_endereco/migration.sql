/*
  Warnings:

  - Added the required column `Bairro` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `CEP` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Cidade` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Estado` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Logradouro` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Numero` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Rua` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "User" ADD COLUMN     "Bairro" TEXT NOT NULL,
ADD COLUMN     "CEP" INTEGER NOT NULL,
ADD COLUMN     "Cidade" TEXT NOT NULL,
ADD COLUMN     "Estado" TEXT NOT NULL,
ADD COLUMN     "Logradouro" TEXT NOT NULL,
ADD COLUMN     "Numero" INTEGER NOT NULL,
ADD COLUMN     "Rua" TEXT NOT NULL;
