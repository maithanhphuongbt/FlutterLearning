module.exports = function (app) {

    const book = require('../controller/book.controller.js');

    // Create a new Book
    app.post('/api/book/create', book.create);

    // Retrieve all Books
    app.get('/api/books', book.findAll);

    // Retrieve a single Book by Id
    app.get('/api/book/:bookId', book.findById);

    // Update a Book with Id
    app.put('/api/book/:bookId', book.update);

    // Delete a Book with Id
    app.delete('/api/book/:bookId', book.delete);
}