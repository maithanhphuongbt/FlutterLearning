module.exports = (sequelize, Sequelize) => {
	const Book = sequelize.define('user', {
		id: {
			type: Sequelize.STRING,
			primaryKey: true
		},
		name: Sequelize.STRING,
		address: Sequelize.STRING,
		phone: Sequelize.STRING,
		email: Sequelize.STRING,
	});

	return Book;
}