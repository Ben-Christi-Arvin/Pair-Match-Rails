# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users_attributes = [
        {
            name: 'Patsy',
            profile_pic: "https://stroseschool.stroselions.net/wp-content/uploads/2018/04/profile-blank-reva.png",
            project_link: "https://github.com/explore",
            focus: "All things Elixir"
        },
        {
            name: 'Paul',
            profile_pic: "https://stroseschool.stroselions.net/wp-content/uploads/2018/04/profile-blank-reva.png",
            project_link: "https://github.com/explore",
            focus: "Python Scripting for Stock Automation"
        },
        {
            name: 'Peter',
            profile_pic: "https://stroseschool.stroselions.net/wp-content/uploads/2018/04/profile-blank-reva.png",
            project_link: "https://github.com/explore",
            focus: "Ruby on Rails"
        },
        {
            name: 'Pen',
            profile_pic: "https://stroseschool.stroselions.net/wp-content/uploads/2018/04/profile-blank-reva.png",
            project_link: "https://github.com/explore",
            focus: "React and Javascript"
        }
      ]
users_attributes.each do |attributes|
  User.create(attributes)
end
