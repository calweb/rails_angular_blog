#= require_self
#= require_tree ./controllers/main
#= require_tree ./services/main

angular
  .module("Blog", ['ngRoute'])
  .config(['$routeProvider', function($routeProvider) {
  // Route for /post
  $routeProvider
    .when('/posts/new', {
      templateUrl: '../assets/mainCreatePost.html',
      controller: 'CreatePostCtrl'
      })
    .when('/posts/:postId', {
      templateUrl: '../assets/mainPost.html',
      controller: 'PostCtrl'
      })
    .when('/posts/:postId/edit', {
      templateUrl: '../assets/mainEditPost.html',
      controller: 'EditPostCtrl'
      })
    .when('/posts/:postId/delete', {
      controller: 'DeletePostCtrl'
      })

  // Default route when there is nothing
    .otherwise({
      templateUrl: '../assets/mainIndex.html',
      controller: 'IndexCtrl'
      });

}])
.config(["$httpProvider", function(provider) {
    provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
}]);
