import { Prisma, PrismaClient } from "@prisma/client";
import { Request, Response } from "express";
import auth from "../config/auth";

const prisma = new PrismaClient();

class UsuarioController {
    public async create(req: Request, res: Response) {
        try {
            const { Nome, CPF, Email, senha } = req.body;
            const { hash, salt } = auth.generatePassword(senha);

            let UsuarioInput: Prisma.UserCreateInput = {
                Nome: Nome,
                CPF: CPF,
                Email: Email,
                Hash: hash,
                Salt: salt,

            }

            const novousuario = await prisma.user.create({
                data: UsuarioInput
            });

            return res.status(201).json(novousuario);
        }
        catch (error: any) {
            return res.status(500).json({
                error: error,
            })
        }
    }

    public async readAll(req: Request, res: Response) {
        try {
            const todosUsers = await prisma.user.findMany({
                select: {
                    Nome: true,
                    CPF: false,
                    Email: true,
                    Hash: false,
                    Salt: false,
                }
            })

            return res.status(201).json(todosUsers)
        }
        catch (error: any) {
            return res.status(500).json({ error: error })
        }
    }

    public async read(req: Request, res: Response) {
        try {
            const { id } = req.params;
            const usuario = await prisma.user.findUnique({
                where: {
                    id: Number(id)
                },

                select: {
                    Nome: true,
                    CPF: false,
                    Email: true,
                    Hash: false,
                    Salt: false,
                }
            })

            return res.status(201).json(usuario)
        }

        catch (error: any) {
            return res.status(500).json({ error: error })
        }
    }

    public async update(req: Request, res: Response) {
        try {
            const { id } = req.params;
            const { Nome, CPF, Email } = req.body;

            let UserInput: Prisma.UserUpdateInput = {
                Nome: Nome,
                CPF: CPF,
                Email: Email,
            }

            const usuario_atualizado = await prisma.user.update({
                data: UserInput,
                where: {
                    id: Number(id)
                }
            })

            return res.status(201).json(usuario_atualizado)
        }
        catch (error: any) {
            return res.status(500).json({ error: error })
        }
    }

    public async destroy(req: Request, res: Response) {
        try {
            const { id } = req.params;
            const usuario_deletado = await prisma.user.delete({
                where: {
                    id: Number(id)
                }
            })
            return res.status(201).json(usuario_deletado)
        }

        catch (error: any) {
            return res.status(500).json({ error: error })
        }
    }
}

export default new UsuarioController();