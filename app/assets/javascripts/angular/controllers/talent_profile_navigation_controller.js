(function(){
  'use strict';

  angular.module('Fused4').factory('ProfileValidationSummary', ['$http', function($http){

    function ProfileValidationSummary(data){
      for(var attr in data){
        this[attr] = data[attr];
      }
    };

    ProfileValidationSummary.load = function(){
      return $http({
        method: "GET",
        url: "/validate_profile.json"
      }).then(function(result){
        return new ProfileValidationSummary(result.data);
      });
    }

    ProfileValidationSummary.prototype.forSection = function(section_name){
      var section_result;
      angular.forEach(this.results, function(result){
        if(result.section_name == section_name){
          section_result = result;
        }
      });
      return section_result;
    }

    ProfileValidationSummary.prototype.sectionValid = function(section_name){
      var section_result = this.forSection(section_name);
      return section_result == undefined ? true : section_result.valid;
    }

    return ProfileValidationSummary;

  }]);

})();

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


