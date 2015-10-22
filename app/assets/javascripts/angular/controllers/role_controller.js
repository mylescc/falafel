(function() {
  'use strict';

  function RoleController(Roles, $http) {
    this.showRole = function(index) {
      console.log('showing role ' + (index + 1));
      this.currentRole = this.roles[index];
    };

    this.saveRoleChanges = function() {
      console.log('saving roles')
      console.log(this.roles)
    };

    this.openCalendar = function($event) {
      this.calendarStatus.opened = true;
    };

    console.log(Roles);
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
