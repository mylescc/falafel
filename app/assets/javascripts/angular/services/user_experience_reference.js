(function(){
  'use strict';

  angular.module('Fused4').factory('UserExperienceReference', 
                                   ['$http', function($http){

    function UserExperienceReference(data){
      for(var attr in data){
        this[attr] = data[attr];
      }
    }

    UserExperienceReference.prototype.save = function(){
      return $http({
        method: 'POST',
        url: '/user_experience_references.json',
        data: this
      }).then(function(result){
        return new UserExperienceReference(result.data);
      });
    }

    UserExperienceReference.prototype.update = function(){
      return $http({
        method: 'PUT',
        url: '/user_experience_references/' + this.id + '.json',
        data: this
      });
    }

    UserExperienceReference.prototype.isNew = function(){
      return this.id == undefined && this.expertise == undefined;
    }
    
    UserExperienceReference.prototype.isNoKnowledge = function(){
      return this.id != undefined && this.expertise == undefined;
    }

    UserExperienceReference.prototype.isKnown = function(){
      return this.id != undefined && this.expertise != undefined;
    }

    return UserExperienceReference;
  }]);

})()
