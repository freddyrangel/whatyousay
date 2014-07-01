'use strict';

app.controller('WordsCtrl', function($scope, Word) {

  $scope.words = Word.query();

});
