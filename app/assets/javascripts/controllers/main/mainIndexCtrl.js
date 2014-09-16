this.IndexCtrl = function($scope, $location, $http, postData) {
  $scope.title = "My Blog";
  $scope.data = postData.data;
  postData.loadPosts(null);
  $scope.viewPost = function(postId) {
    return $location.url('/posts/' + postId);
  };
  return $scope.navNewPost = function() {
    return $location.url('/posts/new');
  };
};

this.IndexCtrl.$inject = ['$scope', '$location', '$http', 'postData'];
