var app = angular.module('moduleMain');

app.controller('PostsCtrl', function($scope, Post, toastr) {
  var Object = Post;
  $scope.editing = {};
  $scope.sorting = { sort_by: 'title', order: 'asc' };

  // LOAD LIST
  (function () {
    Object.query(
      function(list) {
        $scope.list = list;
      },
      function(error) {
        toastr.error("Erro ao obter a lista.");
      }
    );
  })();

  $scope.addObject = function() {
    if (!valid()) { return false; }

    Object.save($scope.object,
      function(response, _headers) {
        $scope.list.push(response);
        toastr.success('Registro criado com sucesso!');
        location.reload();
      },
      function(response) {
        toastr.alert('Errors: ' + response.data.errors.join('. '));
      }
    );

    $scope.object = {};
  };

  $scope.filterObjects = function() {
    Object.search({query: $scope.search},
      function(response, _headers) {
        $scope.list = response;
      }
    );
  };

  $scope.toggleForm = function(object) {
    if (object.id === $scope.editing.id) {
      return 'form';
    }
    else {
      return 'row';
    }
  };

  $scope.editObject = function(object) {
    $scope.editing = angular.copy(object);
  };

  $scope.updateObject = function(index) {
    Object.update($scope.editing,
      function(response, _headers) {
        $scope.list[index] = angular.copy($scope.editing);
        $scope.hideForm();
        toastr.success('Atualizado com sucesso!');
      },
      function(response) {
        toastr.alert('Errros: ' + reponse.data.errors.join('. '));
      }
    );
  };

  $scope.hideForm = function() {
    $scope.editing = {};
  };

  $scope.destroyObject = function(object, index) {
    Object.delete(object,
      function(response, _headers) {
        $scope.list.splice(index, 1);
        toastr.success('Registro removido com sucesso!');
      }
    );
  };

  $scope.follow = function(profile){
    Object.follow({ profile: profile },
      function(response, _headers) {
        toastr.success('Você está senguindo ' + response + '!');
        location.reload();
      }
    );
  };

  $scope.sortObjects = function(sort_by, order) {
    if ($scope.sorting.sort_by == sort_by) {
      order = (order == 'asc' ? 'desc' : 'asc');
    } else if ($scope.sorting.sort_by != sort_by) {
      order = 'asc';
    }
    Object.sort({ sort_by: sort_by, order: order },
      function(response, _headers) {
        $scope.list = response;
        $scope.sorting = {
          sort_by: sort_by,
          order: order
        }
      }
    );
  };

  $scope.following = function(profile, follower){
    for(var i = 0; i < follower.length; i++){
      if(follower[i].follower_id == profile){
        return true
      }
    }

    return false;
  };

  $scope.updateArrowOrder = function() {
    $scope.order = $scope.sorting.order == 'asc' ? 'up' : 'down';
  };

  $scope.updateArrowOrder();

  $scope.$watch('sorting.order', function(oldVal, newVal) {
    $scope.updateArrowOrder();
  });

  valid = function() {
    return !!$scope.object && !!$scope.object.title;
  };

  $scope.redirectShow = function(url){
    menu(url);
  };
});
