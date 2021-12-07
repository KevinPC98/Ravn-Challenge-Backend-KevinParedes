const { Router } = require("express");
const router = Router();

const { getAuthors, getAuthorById } = require("../controllers/index");

router.get("/autor", getAuthors);
router.get("/autor/:id", getAuthorById);

module.exports = router;