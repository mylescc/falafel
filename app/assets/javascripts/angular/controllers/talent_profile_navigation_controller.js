(function() {
  "use strict";

  function TalentProfileNavigationController($scope, $http, ProfileValidationSummary, $q){
    $scope.loadProfileValidation = function(){
      ProfileValidationSummary.load().then(function(result){
        $scope.profileValidationSummary = result;
      });
    };

    $scope.loadProfileValidation();

    $scope.$on("profileUpdated", function(){
      $scope.loadProfileValidation();
    });
  }

  TalentProfileNavigationController.$inject = ["$scope", "$http", "ProfileValidationSummary", "$q"];
  angular.module('Fused4').controller("TalentProfileNavigationController", TalentProfileNavigationController);
})();


