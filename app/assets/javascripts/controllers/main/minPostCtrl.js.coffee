@PostCtrl = ($scope, $location, $routeParams, postData, $q) ->
  $scope.data = 
    postData: postData.data
    currentPost:
      title: "Loading..."
      content: ""

  $scope.data.postId = $routeParams.postId

  $scope.returnBack = ->
    $location.url('/')

  $scope.editPost = ->
    $location.url("/posts/#{$scope.data.postId}/edit" )

  $scope.deletePost = ->
    postData.deletePost($scope.data.postId)
    $location.url('/')

  $scope.prepPostData = ->
    post = _.findWhere(postData.data.posts, { id: parseInt($scope.data.postId)})
    $scope.data.currentPost.title = post.title
    $scope.data.currentPost.content = post.content

  @deferred = $q.defer()
  @deferred.promise.then($scope.prepPostData)

  postData.loadPosts(@deferred)

@PostCtrl.$inject = ['$scope', '$location', '$routeParams', 'postData', '$q']