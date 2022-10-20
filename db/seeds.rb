User.create!(
  email: 'admin@test.com',
  password: 'password',
  password_confirmation: 'password',
  name: 'Admin User',
  roles: 'admin'
)

User.create!(
  email: 'stuartwilson94@gmail.com',
  password: 'Mofesto7A$$',
  password_confirmation: 'Mofesto7A$$',
  name: 'Stuart Wilson',
  roles: 'admin'
)

puts '2 Admin user created'

User.create!(
  email: 'test@test.com',
  password: 'password',
  password_confirmation: 'password',
  name: 'regular User',
  roles: 'user'
)

User.create!(
  email: 'testing@test.com',
  password: 'password',
  password_confirmation: 'password',
  name: 'Sandbox User',
  roles: 'testing'
)

3.times do |topic|
  Topic.create!(title: "Topic #{topic}")
end

puts "3 Topics created"

10.times do |blog|
  Blog.create!(
    title: "My blog Post #{blog + 1}",
    body: 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Saepe minima quas quasi expedita! At, quia. Facere, quia quaerat at consequatur ab pariatur animi omnis est! Lorem ipsum dolor sit, amet consectetur adipisicing elit. Iure earum sequi error rerum recusandae unde possimus neque dolor. Quam iure esse recusandae voluptas, inventore odit hic laudantium? Rem, fuga maiores?',
    topic_id: Topic.last.id
  )
end

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill + 1}",
    percent_utilized:15,
    badge: "https://unsplash.it/250/250?image=#{rand(0..1084)}"
  )
end

8.times do |portfolio_item|
  img_number = rand(0..1084)
  Portfolio.create!(
    title: "Portfolio title: #{portfolio_item + 1}",
    subtitle: "Ruby on Rails",
    body: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Est aperiam vitae, cupiditate ipsam soluta, necessitatibus consectetur omnis asperiores ex neque sunt quis magni possimus repudiandae perferendis, accusantium ab velit laborum modi! Corrupti sed nisi nihil?",
    main_image: "https://via.placeholder.com/600x400",
    thumb_image: "https://via.placeholder.com/350x200"
  )
end

1.times do |portfolio_item|
  img_number = rand(0..1084)
  Portfolio.create!(
    title: "Portfolio title: #{portfolio_item + 1}",
    subtitle: "Angular",
    body: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Est aperiam vitae, cupiditate ipsam soluta, necessitatibus consectetur omnis asperiores ex neque sunt quis magni possimus repudiandae perferendis, accusantium ab velit laborum modi! Corrupti sed nisi nihil?",
    main_image: "https://via.placeholder.com/600x400",
    thumb_image: "https://via.placeholder.com/350x200"
  )
end

puts "9 portfolio items created"

3.times do |technology|
  Portfolio.last.technologies.create!(
    name: "Technology #(technology)"
  )
end

puts "3 technologies created"