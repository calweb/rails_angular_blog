this.EditPostCtrl = function($scope, $location, postData, $q, $routeParams) {
  $scope.data = {
    postData: postData.data,
    currentPost: {
      title: "Loading...",
      content: ""
    }
  };
  $scope.data.postId = $routeParams.postId;
  $scope.formData = {
    editPostTitle: '',
    editPostContent: '',
    editPostId: $routeParams.postId
  };
  $scope.prepPostData = function() {
    var post;
    post = _.findWhere(postData.data.posts, {
      id: parseInt($scope.data.postId)
    });
    $scope.data.currentPost.title = post.title;
    $scope.data.currentPost.content = post.content;
    $scope.formData.editPostTitle = post.title;
    return $scope.formData.editPostContent = post.content;
  };
  $scope.editPost = function() {
    postData.editPost($scope.formData);
    return $scope.returnBack();
  };
  $scope.returnBack = function() {
    return $location.url('/');
  };
  this.deferred = $q.defer();
  this.deferred.promise.then($scope.prepPostData);
  return postData.loadPosts(this.deferred);
};

this.EditPostCtrl.$inject = ['$scope', '$location', 'postData', '$q', '$routeParams'];
