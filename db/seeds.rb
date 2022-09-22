3.times do |topic|
  Topic.create!(title: "Topic #{topic}")
end

puts "3 Topics created"

10.times do |blog|
  Blog.create!(
    title: "My blog Post #{blog + 1}",
    body: "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Saepe minima quas quasi expedita! At, quia. Facere, quia quaerat at consequatur ab pariatur animi omnis est! Lorem ipsum dolor sit, amet consectetur adipisicing elit. Iure earum sequi error rerum recusandae unde possimus neque dolor. Quam iure esse recusandae voluptas, inventore odit hic laudantium? Rem, fuga maiores?",
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
    main_image: "https://unsplash.it/600/400?image=#{img_number}",
    thumb_image: "https://unsplash.it/350/250?image=#{img_number}"
  )
end

1.times do |portfolio_item|
  img_number = rand(0..1084)
  Portfolio.create!(
    title: "Portfolio title: #{portfolio_item + 1}",
    subtitle: "Angular",
    body: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Est aperiam vitae, cupiditate ipsam soluta, necessitatibus consectetur omnis asperiores ex neque sunt quis magni possimus repudiandae perferendis, accusantium ab velit laborum modi! Corrupti sed nisi nihil?",
    main_image: "https://unsplash.it/600/400?image=#{img_number}",
    thumb_image: "https://unsplash.it/350/250?image=#{img_number}"
  )
end

puts "9 portfolio items created"

3.times do |technology|
  Portfolio.last.technologies.create!(
    name: "Technology #(technology)"
  )
end

puts "3 technologies created"