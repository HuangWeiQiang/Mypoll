# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.post([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.post(name: 'Luke', movie: movies.first)
Role.create(name: 'admin')
Role.create(name: 'user')
admin_user = User.new(
										 email: 'admin@admin.com',
                     password: 'admin000',
                     password_confirmation: 'admin000'
)
admin_user.save!
admin_user.add_role :admin