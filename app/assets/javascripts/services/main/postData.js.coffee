angular.module('Blog').factory('postData', ['$http', ($http) ->
  postData =
    data:
      posts: [
        {
          title: "temporar",
          content: "temporary"
        }
      ]
    isLoaded: false

  postData.loadPosts = (deferred) ->
    if postData.isLoaded == false
      $http.get("/posts.json").success( (data) ->
        postData.data.posts = data
        postData.isLoaded = true
        console.log("Successfully loaded posts.")
        if deferred
          deferred.resolve()
      ).error( ->
        console.log("Failure to load posts.")
        if deferred
          deferred.reject("Failed to load posts.")
      )
    else
      if deferred
        deferred.resolve()

  postData.createPost = (newPost) ->
    data = 
      post: 
        title: newPost.newPostTitle
        content: newPost.newPostContent
    $http.post('/posts.json', data).success( (data) ->
      postData.data.posts.push(data)
      console.log('Successfully created post.')
    ).error( ->
      console.log('Failed to create new post')
    )

    return true

  postData.editPost = (editPost) ->
    data =
      post:
        title: editPost.editPostTitle
        content: editPost.editPostContent
        id: editPost.editPostId
    $http.put("/posts/#{editPost.editPostId}.json", data).success( (data) ->
      post = _.findWhere(postData.data.posts, { id: parseInt(editPost.editPostId)})
      post.title = data.title
      post.content = data.content
      console.log('Successfully edited post.')
    ).error( ->
      console.log('Failed to edit new post')
    )
    return true

  postData.deletePost = (postId) ->
    data =
      post:
        id: postId
    $http.delete("/posts/#{postId}.json", data).success( (data) ->
      postData.data.posts = _.without(postData.data.posts, _.findWhere(postData.data.posts, {id: parseInt(postId)}))
      console.log('Successfully deleted post.')
    ).error( ->
      console.log('Failed to delete post.')
    )

    return true



  return postData

])