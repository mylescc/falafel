(function() {
  'use strict';

  function CompetenciesController($scope, Competency){
    $scope.userCompetencies = [];
    $scope.availableCompetencies = [];

    $scope.userCompetenciesOptions = {
      connectWith: '.competencies-container',
      stop: function(e, ui){
        $scope.save()
      }
    }

    $scope.availableCompetenciesOptions = {
      connectWith: '.competencies-container',
      update: function(e, ui){
        $scope.checkOnlySixCompetencies(e, ui)
      },
      stop: function(e, ui){
        $scope.save()
      }
    }

    $scope.save = function(){
      Competency.saveList($scope.userCompetencies)
    }

    $scope.checkOnlySixCompetencies = function(e, ui){
      if($scope.userCompetencies.length > 5)
        ui.item.sortable.cancel();
    }

  }

  CompetenciesController.$inject = ['$scope', 'Competency'];
  angular.module('Fused4').controller('CompetenciesController', CompetenciesController);
})();
