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
    
    ProfileValidationSummary.prototype.sectionHasRecommendations = function(section_name){
      var section_result = this.forSection(section_name);
      return section_result == undefined ? false : section_result.recommendations.length > 0;
    }

    return ProfileValidationSummary;

  }]);

})();
