(function(){
  'use strict';

  angular.module('Fused4').factory('Competency', ['$http', function($http){

    function Competency(){};

    Competency.saveList = function(competencies){
      var current_rank = 0;
      return $http({
        method: 'POST',
        url: '/competencies/save_list.json',
        data: competencies.map(function(c){
          c.rank = ++current_rank;
          return c;
        })
      });
    }

    return Competency;
  }]);

})()
