'use strict';

app.controller('NavCtrl', function($scope, $location, Word) {

  $scope.word = {};

  $scope.submitWord = function() {
    Word.save($scope.word, function(ref){
      //$scope.words.push(ref);
      $scope.words = Word.query();
      console.log(ref);
      $scope.word = {};
    });
  };
});


