(function(){
  'use strict';

  angular.module('Fused4').factory('UserCompetencyReference', 
                                   ['$http', function($http){

    function UserCompetencyReference(data){
      for(var attr in data){
        this[attr] = data[attr];
      }
    }

    UserCompetencyReference.prototype.toggleSelected = function(){
      this.selected = !this.selected;
      console.log("save this mofo");
    }

    // UserCompetencyReference.prototype.save = function(){
    //   return $http({
    //     method: 'POST',
    //     url: '/user_competency_references.json',
    //     data: this
    //   }).then(function(result){
    //     return new UserCompetencyReference(result.data)
    //   });
    // }

    // UserCompetencyReference.prototype.update = function(){
    //   return $http({
    //     method: 'PUT',
    //     url: '/user_competency_references/' + this.id + '.json',
    //     data: this
    //   }).then(function(result){
    //     return new UserCompetencyReference(result.data)
    //   });
    // }

    return UserCompetencyReference;
  }]);

})()
