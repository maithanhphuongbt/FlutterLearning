module.exports = (sequelize, Sequelize) => {
	const Book = sequelize.define('content', {
		id: {
			type: Sequelize.INTEGER,
			primaryKey: true
		},
		author: Sequelize.STRING,
		publish_date: Sequelize.STRING,
		title: Sequelize.STRING,
		description: Sequelize.STRING,
		content: Sequelize.STRING,
		num_like: Sequelize.STRING,
		num_vote: Sequelize.STRING,
		comment: Sequelize.STRING,
		image_description: Sequelize.STRING,
		image_hot_trend: Sequelize.STRING,
		image_top_trend: Sequelize.STRING
	});

	return Book;
}