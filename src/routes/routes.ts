import { Router } from "express";
import Product_Controller from "../controllers/produtos_controllers";
import UsuarioController from "../controllers/user_controller";

const router = Router();

router.post("/produto/:id", Product_Controller.create);
router.get("/produto-achado/:id", Product_Controller.read);
router.get("/produtos-achados", Product_Controller.readAll);
router.put("/produto-atualizado/:id", Product_Controller.update);
router.delete("/produto-excluido/:id", Product_Controller.destroy);

router.post("/user", UsuarioController.create);
router.get("/todos-usuarios", UsuarioController.readAll);
router.get("/usuario-encontrado/:id", UsuarioController.read);
router.put("/usuario-atualizado/:id", UsuarioController.update);
router.delete("/usuario-excluido/:id", UsuarioController.destroy);

export default router;