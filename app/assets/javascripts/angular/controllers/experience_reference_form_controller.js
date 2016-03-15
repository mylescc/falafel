(function(){
  'use strict';

  function ExperienceReferenceFormController($scope, UserExperienceReference){
    $scope.currentFormState = "initial";

    $scope.init = function(referenceJson){
      $scope.reference = new UserExperienceReference(referenceJson);
      $scope.updateFormState();
    }

    $scope.updateFormState = function(){
      if($scope.reference.unknown())
        $scope.setFormState("unknown");
      else if($scope.reference.known())
        $scope.setFormState("known");
      else
        $scope.setFormState("initial");
    }

    $scope.setFormState = function(state){
      $scope.currentFormState = state;
    }

    $scope.formStateIs = function(state){
      return $scope.currentFormState == state;
    }

    $scope.cancelForm = function(){
      $scope.updateFormState();
    }

    $scope.save = function(){
      $scope.reference.persistWithExperience().then(function(reference){
        $scope.reference = reference;
        $scope.updateFormState();
      });
    }

    $scope.setNoExperience = function(){
      $scope.reference.setNoExperience().then(function(reference){
        $scope.reference = reference;
        $scope.updateFormState();
      });
    }
  }

  ExperienceReferenceFormController.$inject = ['$scope', 'UserExperienceReference'];
  angular.module('Fused4').controller('ExperienceReferenceFormController',
                                      ExperienceReferenceFormController);
})();
