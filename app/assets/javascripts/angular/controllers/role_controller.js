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
        data: { roles: formatForSubmit(this.roles) }
      })
      .then(function success(response) {
        console.log('success');
        console.log(response);
        this.roles = response.data.roles;
      }.bind(this), function error(response) {
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


    function formatForSubmit(roles) {
      roles.forEach(function(role) {
        if (!!role.position) {
          role.position = parseInt(role.position)
        }
      });
      return roles;
    }

    function prepData() {
      this.roles.forEach(function(role) {
        role.position = !role.position ? "" : role.position.toString();
      });
    };
    prepData.bind(this)();
  };

  RoleController.$inject = ['Roles', '$http'];
  angular.module('Fused4').controller('RoleController', RoleController);
})();
