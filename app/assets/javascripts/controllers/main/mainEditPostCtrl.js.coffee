@EditPostCtrl = ($scope, $location, postData, $q, $routeParams) ->
  $scope.data = 
    postData: postData.data
    currentPost:
      title: "Loading..."
      content: ""

  $scope.data.postId = $routeParams.postId

  $scope.formData = 
    editPostTitle: ''
    editPostContent: ''
    editPostId: $routeParams.postId

  $scope.prepPostData = ->
    post = _.findWhere(postData.data.posts, { id: parseInt($scope.data.postId)})
    $scope.data.currentPost.title = post.title
    $scope.data.currentPost.content = post.content
    $scope.formData.editPostTitle = post.title
    $scope.formData.editPostContent = post.content

  $scope.editPost = ->
    postData.editPost($scope.formData)
    $scope.returnBack()

  $scope.returnBack = ->
    $location.url('/')

  @deferred = $q.defer()
  @deferred.promise.then($scope.prepPostData)
  postData.loadPosts(@deferred)

@EditPostCtrl.$inject = ['$scope', '$location', 'postData', '$q', '$routeParams']