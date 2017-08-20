var app = angular.module('moduleMain');
var apiRoute = '/api/profiles';
var objectName = 'Profile';

app.factory(objectName, ['$resource', function($resource) {
  return $resource(apiRoute + '/:id.json', { id: '@id' }, {
    update: { method: 'PUT' },
    search: {
      method: 'GET',
      isArray: true,
      url: apiRoute + '/search.json',
      params: {
        query: '@query'
      }
    },
    delete: {
      action: 'destroy',
      method: 'DELETE',
      url: apiRoute + '/:id.json',
      params: {
        id: '@id'
      }
    },
    sort: {
      action: 'index',
      method: 'GET',
      isArray: true,
      url: apiRoute + '.json',
      params: {
        sort_by: '@sort_by',
        order: '@order'
      }
    }
  });
}]);
