var app = angular.module('moduleMain', ['ngRoute', 'ngResource', 'toastr', 'ngBootbox']).
config(function (toastrConfig, $locationProvider) {
  angular.extend(toastrConfig, {
    autoDismiss: false,
    containerId: 'toast-container',
    maxOpened: 0,
    newestOnTop: true,
    positionClass: 'toast-bottom-right',
    preventDuplicates: false,
    preventOpenDuplicates: false,
    target: 'body'
  });

  $locationProvider.hashPrefix('');
});
