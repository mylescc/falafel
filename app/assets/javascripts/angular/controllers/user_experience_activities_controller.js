(function() {
  'use strict';

  function UserExperienceActivitiesController($scope) {

    $scope.$watch('selectedPrimaryActivity', function(value) {
      $scope.updateSecondaryActivities();
      $scope.updatePrimaryVisibilities();
      $scope.updateSecondaryVisibilities();
      $scope.updateButtonEnabled(value);
    });

    $scope.updateSecondaryActivities = function(){
      $scope.availableSecondaryActivities = $scope.secondaryActivityMap[$scope.selectedPrimaryActivity];
    }

    $scope.$watch('selectedSecondaryActivity', function(value){
      $scope.updateSecondaryVisibilities();
    });

    $scope.updatePrimaryVisibilities = function(){
      var selectedValue = $scope.selectedPrimaryActivity;
      $scope.otherPrimaryVisible = selectedValue == 'Other...' 
    }

    $scope.updateSecondaryVisibilities = function(){
      var otherVal = 'Other...'
      var selectedValue = $scope.selectedSecondaryActivity;
      var otherSelected = selectedValue == otherVal || $scope.selectedPrimaryActivity == otherVal;
      $scope.secondaryActivitiesVisible = !!$scope.availableSecondaryActivities && !otherSelected; 
      $scope.otherSecondaryVisible = otherSelected;
    }

    $scope.cancelOtherPrimaryActivity = function(){
      $scope.selectedPrimaryActivity = '';
    }

    $scope.cancelOtherSecondaryActivity = function(){
      $scope.selectedSecondaryActivity = '';
    }

    $scope.updateButtonEnabled = function(selectedPrimaryValue){
      $scope.buttonEnabled = !!selectedPrimaryValue
    }
  };

  UserExperienceActivitiesController.$inject = ['$scope'];
  angular.module('Fused4').controller('UserExperienceActivitiesController', UserExperienceActivitiesController);
})();
