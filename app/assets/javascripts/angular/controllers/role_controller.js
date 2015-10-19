(function() {
  'use strict';

  function RoleController() {
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

    //mocking an array of the 3 user roles
    this.roles = [{}, {}, {}];
    this.showRole(0);
    this.calendarStatus = {
      opened: false
    };
    this.availableMinDate = new Date();
    this.availableMaxDate = new Date(2020, 12, 31);
  };

  RoleController.$inject = [];
  angular.module('Fused4').controller('RoleController', RoleController);
})();
