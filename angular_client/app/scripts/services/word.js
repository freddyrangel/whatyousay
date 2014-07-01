'use strict';

app.factory('Word', function($resource) {
  var word = $resource('/api/v1/words/:id');

  return word;
});
