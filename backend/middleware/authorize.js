const authorize = (role) => {
  return (req, res, next) => {
    if (req.user && req.user.role === role) {
      return next();
    }
    res.status(403);
    throw new Error("Not authorized for this action");
  };
};

module.exports = authorize;
