'use strict';

app.controller('NewWordCtrl', function($scope, $location, Word) {

  $scope.word = {};

  $scope.submitWord = function() {
    Word.save($scope.word, function(){
      $scope.word = {};
    });
  };
});


