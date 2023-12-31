const { sign, verify } = require("jsonwebtoken");

const createToken = (id, loginAs) => {
  const secretKey = "your-secret-key"; // Replace this with your actual secret key
  const accessToken = sign({ id, loginAs }, secretKey);
  return accessToken;
};
const validateToken = (req, res, next) => {
  const accessToken = req.cookies["accessToken"];

  // console.log(req.cookies);
  if (!accessToken) {
    return res
      .status(400)
      .json({ status: "failed", message: "user not authenticated" });
  }

  try {
    const validToken = verify(accessToken, process.env.JWT_SECRET);
    if (validToken) {
      req.id = validToken.id;
      req.loginAs = validToken.loginAs;
      // console.log(validToken);
      return next();
    }
  } catch (err) {
    res
      .status(400)
      .json({ status: "failed", err, message: "user not authenticated" });
  }
};
module.exports = { createToken, validateToken };
