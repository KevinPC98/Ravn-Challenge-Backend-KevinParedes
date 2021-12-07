const { Router } = require("express");
const router = Router();

const { getAuthors, getAuthorById, getTopAuthors, getTopAuthorsByCount } = require("../controllers/index");

router.get("/autor", getAuthors);
router.get("/autor/:id", getAuthorById);
router.get("/top/autor", getTopAuthors);
router.get("/top/autor/:count", getTopAuthorsByCount);

module.exports = router;