const db = require('../config/db.config.js');
const User = db.user;

// Post a User
exports.create = (req, res) => {
  // Save User to MySQL database
    User.create({
        title: req.body.title,
        author: req.body.author,
        description: req.body.description,
        published: req.body.published,
    })
        .then(user => {
        // Send created user to client
        res.send(user);
        })
        .catch(err => {
        res.status(500).send('Error -> ' + err);
        });
};

// Fetch all User
exports.findAll = (req, res) => {
    User.findAll()
        .then(users => {
        // Send all User to Client
        res.send(users);
        console.log(users);
        })
        .catch(err => {
        res.status(500).send('Error -> ' + err);
        });
};

// Find a Customer by Id
exports.findById = (req, res) => {
    User.findById(req.params.userId)
        .then(user => {
          res.send(user);
        })
        .catch(err => {
          res.status(500).send('Error -> ' + err);
          console.log(err)
        });
};

// Update a User
exports.update = (req, res) => {
  var user = req.body;
  const id = req.params.userId;
  User.update(
    {
      title: req.body.title,
      author: req.body.author,
      description: req.body.description,
      published: req.body.published,
    },
    {
      where: {
        id: req.params.userId,
      },
    }
  )
    .then(() => {
      res.status(200).send(user);
    })
    .catch(err => {
      res.status(500).send('Error -> ' + err);
    });
};

// Delete a User by Id
exports.delete = (req, res) => {
  const id = req.params.userId;
  User.destroy({
    where: {id: id},
  })
    .then(() => {
      res.status(200).send('User has been deleted!');
    })
    .catch(err => {
      res.status(500).send('Fail to delete!');
    });
};
