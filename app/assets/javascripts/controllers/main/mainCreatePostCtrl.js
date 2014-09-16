angular.module('Blog')
  .controller("CreatePostCtrl", [
  '$scope',
  '$location',
  'postData',
  function ($scope, $location, postData) {
    $scope.data = postData.data;
    postData.loadPosts(null);
    $scope.formData = {
      newPostTitle: '',
      newPostContent: ''
    };
    $scope.returnBack = function() {
      return $location.url('/');
    };
    $scope.createPost = function() {
      postData.createPost($scope.formData);
      return $scope.returnBack();
    };
    return $scope.clearPost = function() {
      $scope.formData.title = '';
      return $scope.formData.content = '';
    };
  }]);
