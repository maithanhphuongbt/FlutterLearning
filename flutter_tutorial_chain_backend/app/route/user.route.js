module.exports = function (app) {

    const user = require('../controller/user.controller.js');

    // Create a new User
    app.post('/api/user/create', user.create);

    // Retrieve all Users
    app.get('/api/users', user.findAll);

    // Retrieve a single User by Id
    app.get('/api/user/:userId', user.findById);

    // Update a User with Id
    app.put('/api/user/:userId', user.update);

    // Delete a User with Id
    app.delete('/api/user/:userId', user.delete);

    // Login

    app.post('/api/user/authenticate', user.authenticate)
}