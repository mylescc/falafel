(function() {
  'use strict';

  function CompetenciesController($scope, Competency){
    $scope.userCompetencies = [];

    $scope.loadCompetencies = function(){
      Competency.query().then(function(results){
        $scope.userCompetencies = results.data;
      });
    }();

    $scope.sortableOptions = {
      stop: function(){
        Competency.saveAll($scope.userCompetencies)
      }
    }
  }

  CompetenciesController.$inject = ['$scope', 'Competency'];
  angular.module('Fused4').controller('CompetenciesController', CompetenciesController);
})();
