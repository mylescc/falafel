(function() {
  'use strict';

  function RoleController() {
    console.log('controller init');
  };

  RoleController.$inject = [];
  angular.module('Fused4').controller('RoleController', RoleController);
})();
