'use strict';
var app = angular
  .module('angularApp', [
    'ngCookies',
    'ngResource',
    'ngSanitize',
    'ngRoute'
  ])
  .config(function ($routeProvider, $locationProvider) {
    $locationProvider.html5Mode(true);
    $routeProvider
      .when('/', {
        templateUrl: '/views/words.html',
        controller: 'WordsCtrl'
      })
      .when('/words/new', {
        templateUrl: '/views/newword.html',
        controller: 'NewWordCtrl'
      })
      .when('/words/:id', {
        templateUrl: '/views/showword.html',
        controller: 'WordViewCtrl'
      })
      .otherwise({
        redirectTo: '/'
      });
  });
