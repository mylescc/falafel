(function() {
  'use strict';

  function UserExperienceRolesController($scope) {
    $scope.secondaryActivitiesVisible = false;

    $scope.updateSecondaryActivities = function(){
      $scope.availableSecondaryActivities = $scope.secondaryActivityMap[$scope.selectedPrimaryActivity];
    }

    $scope.$watch('availableSecondaryActivities', function() {
      $scope.secondaryActivitiesVisible = !!$scope.availableSecondaryActivities;
    });

    $scope.$watch('selectedPrimaryActivity', function(){
      $scope.updateSecondaryActivities();
      $scope.otherPrimarySelected = $scope.selectedPrimaryActivity == 'Other...';
    });

    $scope.cancelOtherActivities = function(){
      $scope.otherPrimarySelected = false;
      $scope.selectedPrimaryActivity = '';
    };

  };

  UserExperienceRolesController.$inject = ['$scope'];
  angular.module('Fused4').controller('UserExperienceRolesController', UserExperienceRolesController);
})();
