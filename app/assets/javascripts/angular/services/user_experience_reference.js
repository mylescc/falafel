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
        return new UserExperienceReference(result.data)
      });
    }

    UserExperienceReference.prototype.update = function(){
      return $http({
        method: 'PUT',
        url: '/user_experience_references/' + this.id + '.json',
        data: this
      }).then(function(result){
        return new UserExperienceReference(result.data)
      });
    }

    UserExperienceReference.prototype.saveOrUpdate = function(){
      if(this.id)
        return this.update();
      else
        return this.save();
    }

    UserExperienceReference.prototype.persistWithExperience = function(){
      this.referee_has_experience = true;
      return this.saveOrUpdate()
    }

    UserExperienceReference.prototype.setNoExperience = function(){
      this.referee_has_experience = false;
      this.expertise = undefined;
      return this.saveOrUpdate()
    }

    UserExperienceReference.prototype.isNew = function(){
      return this.id == undefined && this.expertise == undefined;
    }

    UserExperienceReference.prototype.unknown = function(){
      return this.id != undefined && !this.referee_has_experience;
    }

    UserExperienceReference.prototype.known = function(){
      return this.id != undefined && this.referee_has_experience;
    }

    return UserExperienceReference;
  }]);

})()
