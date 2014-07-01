'use strict';

app.factory('Word', function($resource) {
  var words = $resource('/api/v1/words/:id');

  return words;
});
