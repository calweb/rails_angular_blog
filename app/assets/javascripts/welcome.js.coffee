# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#= require_self
#= require_tree ./controllers/global
#= require_tree ./controllers/main
#= require_tree ./directives/global
#= require_tree ./directives/main
#= require_tree ./services/global
#= require_tree ./services/main
#= require_tree ./filters/global
#= require_tree ./filters/main

Blog = angular.module("Blog", ['ngRoute'])

Blog.config(['$routeProvider', ($routeProvider) ->
  # Route for /post
  $routeProvider.when('/posts/new', { templateUrl: '../assets/mainCreatePost.html', controller: 'CreatePostCtrl'})
  $routeProvider.when('/posts/:postId', { templateUrl: '../assets/mainPost.html', controller: 'PostCtrl'})
  $routeProvider.when('/posts/:postId/edit', { templateUrl: '../assets/mainEditPost.html', controller: 'EditPostCtrl'})
  $routeProvider.when('/posts/:postId/delete', { controller: 'DeletePostCtrl'})

  # Default route when there is nothing
  $routeProvider.otherwise({ templateUrl: '../assets/mainIndex.html', controller: 'IndexCtrl'})  
  
])

Blog.config(["$httpProvider", (provider) ->
  provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])
