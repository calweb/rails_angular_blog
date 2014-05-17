@CreatePostCtrl = ($scope, $location, postData) ->
  $scope.data = postData.data
  postData.loadPosts(null)

  $scope.formData = 
    newPostTitle: ''
    newPostContent: ''

  $scope.returnBack = ->
    $location.url('/')

  $scope.createPost = ->
    postData.createPost($scope.formData)
    $scope.returnBack()

  $scope.clearPost = ->
    $scope.formData.title = ''
    $scope.formData.content = ''


@CreatePostCtrl.$inject = ['$scope', '$location', 'postData']

