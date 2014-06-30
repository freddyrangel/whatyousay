'use strict';

app.controller('WordsCtrl', function($scope, Word) {
  $scope.word = {};
  $scope.words = [];

  $scope.submitWord = function(){
    Word.save($scope.word, function(ref){
      $scope.words[ref.name] = $scope.word;
      $scope.word = {};
    });
  };

  $scope.deleteWord = function(wordId) {
    Word.delete({id: wordId}, function() {
      delete $scope.words[wordId];
    });
  };
});
