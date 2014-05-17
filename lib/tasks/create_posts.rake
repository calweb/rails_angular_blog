task create_posts: :environment do
  Post.create({
    title: "Title 1",
    content: "THis is some post content.",
    author: "Nick",
    post_date: DateTime.current()  
  })

  Post.create({
    title: "Title 2",
    content: "THis is some more post content.",
    author: "Jenny",
    post_date: DateTime.current()  
  })
end