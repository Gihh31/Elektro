import { Prisma, PrismaClient } from "@prisma/client";
import { Request, Response } from "express";

const prisma = new PrismaClient();

interface Produto {
    Nome: string;
    Categoria: string;
    Preco: number;
    Caracteristicas: string;
    Foto: string;
    Avaliacao: string;
}

class ProductController {
    public async create(req: Request, res: Response) {

        try {
            const { Nome, Preco, Categoria, Caracteristicas, Foto, Avaliacao } = req.body;

            const { id } = req.params;

            let Inputproduto: Prisma.ProdutoCreateInput = {
                Nome: Nome,
                Preco: Preco,
                Categoria: Categoria,
                Caracteristicas: Caracteristicas,
                Foto: Foto,
                Avaliacao: Avaliacao,
                usuario: {
                    connect: {
                        id: Number(id),
                    },
                },
            };

            const novo_produto = await prisma.produto.create({
                data: Inputproduto,
            });

            return res.status(201).json({
                message: "Produto criado com sucesso",
                produto: novo_produto,
            });
        }
        catch (error: any) {
            return res.status(500).json(error);

        }
    }

    public async read(req: Request, res: Response) {

        try {

            const { id } = req.params;

            const produto_achado = await prisma.produto.findUnique({
                where: {
                    id: Number(id)
                },

                select: {
                    Nome: true,
                    Preco: true,
                    Categoria: true,
                    Caracteristicas: true,
                    Foto: true,
                    Avaliacao: true,
                    usuario: false,
                }
            });

            if (!produto_achado) {
                return res.status(404).json({ message: "Produto não encontrado" });
            }

            return res.status(200).json(produto_achado);
        }
        catch (error) {
            return res.status(500).json({
                messageError: "Erro ao procurar o produto desejado.",
                error: error,
            });
        }
    }

    public async readAll(req: Request, res: Response) {

        try {
            const achados = await prisma.produto.findMany({
                select: {
                    id: true,
                    Nome: true,
                    Preco: true,
                    Categoria: true,
                    Caracteristicas: true,
                    Foto: true,
                    Avaliacao: true,
                    usuario: false,
                },
            });
            return res.status(200).json(achados);
        }
        catch (error) {
            return res.status(500).json({
                messageError: "Erro ao encontrar os produtos",
                error: error,
            });
        }
    }

    public async update(req: Request, res: Response) {

        try {
            const { id } = req.params;

            const { Nome, Preco, Categoria, Caracteristicas, Foto, Avaliacao } = req.body;

            let productInput: Prisma.ProdutoUpdateInput = {
                Nome: Nome,
                Preco: Preco,
                Categoria: Categoria,
                Caracteristicas: Caracteristicas,
                Foto: Foto,
                Avaliacao: Avaliacao,
            };

            const updatedProduto = await prisma.produto.update({
                where: { id: Number(id), },
                data: productInput,
            });

            if (updatedProduto) {
                const produto = await prisma.produto.findUnique({
                    where: {
                        id: Number(id),
                    },
                });
                return res.status(201).json(produto);
            }

            else {
                return res.status(404).json({ error: "Produto não encontrado" });
            }
        }

        catch (error: any) {
            console.log(error);
            res.status(500).json({ error: error })
        }
    }

    public async destroy(req: Request, res: Response) {

        try {
            const { id } = req.params;
            const produto_deletado = await prisma.produto.delete({
                where: { id: Number(id) }
            })

            if (produto_deletado) {
                res.status(200).json(produto_deletado);
            }
            else {
                return res.status(404).json({ error: "Produto não encontrado" });
            }
        }

        catch (error: any) {
            res.status(500).json({ error: error });
        }

    }

}

export default new ProductController();