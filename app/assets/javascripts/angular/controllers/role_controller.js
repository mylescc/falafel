(function() {
  'use strict';

  function RoleController(Roles, $http) {
    this.showRole = function(index) {
      console.log('showing role ' + (index + 1));
      this.currentRole = this.roles[index];
    };

    this.saveRoleChanges = function() {
      $http({
        method: 'PATCH',
        url: '/roles/update',
        data: { roles: this.roles }
      })
      .then(function success(response) {
        console.log('success');
        console.log(response);
      }, function error(response) {
        console.log('error');
        console.log(response);
      });
    };

    this.openCalendar = function($event) {
      this.calendarStatus.opened = true;
    };

    this.roles = Roles;
    this.showRole(0);
    this.calendarStatus = {
      opened: false
    };
    this.availableMinDate = new Date();
    this.availableMaxDate = new Date(2020, 12, 31);
  };

  RoleController.$inject = ['Roles', '$http'];
  angular.module('Fused4').controller('RoleController', RoleController);
})();
