-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "Nome" TEXT[],
    "CPF" INTEGER NOT NULL,
    "Email" TEXT[],
    "Hash" TEXT[],
    "Salt" TEXT[],
    "CuponsId" INTEGER NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Produto" (
    "id" SERIAL NOT NULL,
    "Nome" TEXT[],
    "Categoria" TEXT[],
    "Preco" INTEGER NOT NULL,
    "Caracteristicas" TEXT[],
    "Foto" TEXT[],
    "Avaliacao" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "usuarioId" INTEGER NOT NULL,

    CONSTRAINT "Produto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cupons" (
    "id" SERIAL NOT NULL,
    "Codigo" TEXT[],
    "Desconto" INTEGER NOT NULL,
    "Validade" TIMESTAMP(3) NOT NULL,
    "Regras" TEXT[],

    CONSTRAINT "Cupons_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Carrinho" (
    "usuarioId" SERIAL NOT NULL,

    CONSTRAINT "Carrinho_pkey" PRIMARY KEY ("usuarioId")
);

-- CreateTable
CREATE TABLE "Favoritos" (
    "usuarioId" SERIAL NOT NULL,

    CONSTRAINT "Favoritos_pkey" PRIMARY KEY ("usuarioId")
);

-- CreateTable
CREATE TABLE "ProdutoCarrinho" (
    "usuarioId" SERIAL NOT NULL,
    "produtoId" INTEGER NOT NULL,

    CONSTRAINT "ProdutoCarrinho_pkey" PRIMARY KEY ("usuarioId","produtoId")
);

-- CreateTable
CREATE TABLE "_CuponsToUser" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_CarrinhoToCupons" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_FavoritosToProduto" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "User_CPF_key" ON "User"("CPF");

-- CreateIndex
CREATE UNIQUE INDEX "User_Email_key" ON "User"("Email");

-- CreateIndex
CREATE UNIQUE INDEX "Cupons_Codigo_key" ON "Cupons"("Codigo");

-- CreateIndex
CREATE UNIQUE INDEX "_CuponsToUser_AB_unique" ON "_CuponsToUser"("A", "B");

-- CreateIndex
CREATE INDEX "_CuponsToUser_B_index" ON "_CuponsToUser"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CarrinhoToCupons_AB_unique" ON "_CarrinhoToCupons"("A", "B");

-- CreateIndex
CREATE INDEX "_CarrinhoToCupons_B_index" ON "_CarrinhoToCupons"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_FavoritosToProduto_AB_unique" ON "_FavoritosToProduto"("A", "B");

-- CreateIndex
CREATE INDEX "_FavoritosToProduto_B_index" ON "_FavoritosToProduto"("B");

-- AddForeignKey
ALTER TABLE "Produto" ADD CONSTRAINT "Produto_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Carrinho" ADD CONSTRAINT "Carrinho_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Favoritos" ADD CONSTRAINT "Favoritos_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProdutoCarrinho" ADD CONSTRAINT "ProdutoCarrinho_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "Carrinho"("usuarioId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProdutoCarrinho" ADD CONSTRAINT "ProdutoCarrinho_produtoId_fkey" FOREIGN KEY ("produtoId") REFERENCES "Produto"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CuponsToUser" ADD CONSTRAINT "_CuponsToUser_A_fkey" FOREIGN KEY ("A") REFERENCES "Cupons"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CuponsToUser" ADD CONSTRAINT "_CuponsToUser_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CarrinhoToCupons" ADD CONSTRAINT "_CarrinhoToCupons_A_fkey" FOREIGN KEY ("A") REFERENCES "Carrinho"("usuarioId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CarrinhoToCupons" ADD CONSTRAINT "_CarrinhoToCupons_B_fkey" FOREIGN KEY ("B") REFERENCES "Cupons"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FavoritosToProduto" ADD CONSTRAINT "_FavoritosToProduto_A_fkey" FOREIGN KEY ("A") REFERENCES "Favoritos"("usuarioId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FavoritosToProduto" ADD CONSTRAINT "_FavoritosToProduto_B_fkey" FOREIGN KEY ("B") REFERENCES "Produto"("id") ON DELETE CASCADE ON UPDATE CASCADE;
