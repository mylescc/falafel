(function() {
  'use strict';

  function RoleController() {
    this.showRole = function(index) {
      console.log('showing role ' + (index + 1));
      this.currentRole = this.roles[index];
    };

    this.submitRole = function(role) {
      console.log('submit role called');
      console.log(role);
    };

    //mocking an array of the 3 user roles
    this.roles = [{}, {}, {}];
    this.showRole(0);
  };

  RoleController.$inject = [];
  angular.module('Fused4').controller('RoleController', RoleController);
})();
