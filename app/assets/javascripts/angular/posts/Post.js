var app = angular.module('moduleMain');

app.factory('Post', ['$resource', function($resource) {
  var apiRoute = '/api/posts';

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
    follow: {
      action: 'follow',
      method: 'PUT',
      url: apiRoute + '/follow.json',
      params: {
        profile: '@profile'
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
