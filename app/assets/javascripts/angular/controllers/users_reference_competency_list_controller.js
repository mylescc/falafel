(function(){
  'use strict';

  function UserReferenceCompetencyListController($scope, UserCompetencyReference){
    $scope.selectedCount = 0;
    $scope.selectDisabled = false;
    $scope.competencies = [];

    $scope.buildCompetencies = function(competencyStrings){
      angular.forEach(competencyStrings, function(competencyString){
        var competencyRef = new UserCompetencyReference(
          {
            reference_id: $scope.referenceId,
            competency: competencyString,
            selected: false
          }
        )
        $scope.competencies.push(competencyRef);
      });
    }

    $scope.updateSelectedCount = function(){
      var count = 0;
      angular.forEach($scope.competencies, function(competency){
        if(competency.selected){
          count ++
        }
      });
      $scope.selectedCount = count;
      $scope.setSelectState();
    }

    $scope.setSelectState = function(){
      $scope.selectDisabled = $scope.selectedCount > 5;
    }
  }

  UserReferenceCompetencyListController.$inject = ["$scope", "UserCompetencyReference"];
  angular.module('Fused4').controller('UserReferenceCompetencyListController', UserReferenceCompetencyListController);

})();
