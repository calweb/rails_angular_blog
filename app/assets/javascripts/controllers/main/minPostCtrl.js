this.PostCtrl = function($scope, $location, $routeParams, postData, $q) {
  $scope.data = {
    postData: postData.data,
    currentPost: {
      title: "Loading...",
      content: ""
    }
  };
  $scope.data.postId = $routeParams.postId;
  $scope.returnBack = function() {
    return $location.url('/');
  };
  $scope.editPost = function() {
    return $location.url("/posts/" + $scope.data.postId + "/edit");
  };
  $scope.deletePost = function() {
    postData.deletePost($scope.data.postId);
    return $location.url('/');
  };
  $scope.prepPostData = function() {
    var post;
    post = _.findWhere(postData.data.posts, {
      id: parseInt($scope.data.postId)
    });
    $scope.data.currentPost.title = post.title;
    return $scope.data.currentPost.content = post.content;
  };
  this.deferred = $q.defer();
  this.deferred.promise.then($scope.prepPostData);
  return postData.loadPosts(this.deferred);
};

this.PostCtrl.$inject = ['$scope', '$location', '$routeParams', 'postData', '$q'];
