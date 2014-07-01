'use strict';

app.controller('WordViewCtrl', function($scope, $routeParams, Word){
  $scope.word = Word.get({id: $routeParams.id});
});
