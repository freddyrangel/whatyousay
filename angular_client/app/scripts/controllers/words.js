'use strict';

app.controller('WordsCtrl', function($scope, Word) {

  $scope.words = Word.query();
  console.log($scope.words);

  //$scope.submitWord = function() {
    //Word.save($scope.word, function(ref){
      //$scope.words.push(ref);
      //console.log(ref);
      //$scope.word = {};
    //});
  //};

  //$scope.deleteWord = function(wordId) {
    //Word.delete({id: wordId}, function() {
      //delete $scope.words[wordId];
    //});
  //};
});
