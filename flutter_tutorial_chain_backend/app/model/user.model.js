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
		userName: Sequelize.STRING,
		password: Sequelize.STRING
	});

	return Book;
}