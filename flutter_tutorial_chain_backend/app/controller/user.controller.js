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
      console.log(err);
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

exports.authenticate = (req, res) => {
  // console.log(req.body.userName);
  User.findOne({
    where: {userName: req.body.userName},
  }).then(function(user) {
    console.log(user);
      if (!user) {
        data = {
          meta: {
            status: 'fail',
            message: 'Login Failure: Invalid user name',
          },
        };
        res.status(401).send(data);
        // console.log('User not found.');
      } else {
        User.findOne({
          where: {password: req.body.password}
        }).then(function(user) {
            if (user) {
              data = {
                meta: {
                  status: 'success',
                  message: 'Login success',
                },
              };
              res.json(data);
              console.log('success');
            } else {
              data = {
                meta: {
                  status: 'fail',
                  message: 'Login Failure: Invalid password',
                },
              };
              res.json(data);
              console.log('fail');
            }
          })
          .catch(err => {
            res.status(500).send('Error -> ' + err);
            console.log(err);
          }
        );
      }
    })
    .catch(err => {
      res.status(500).send('Error -> ' + err);
      console.log(err);
    });
};