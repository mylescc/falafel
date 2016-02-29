(function(){
  'use strict';

  function ExperienceReferenceFormController($scope, UserExperienceReference){
    $scope.currentFormState = "initial";

    $scope.init = function(referenceJson){
      $scope.reference = new UserExperienceReference(referenceJson);
      $scope.updateFormState();
    }

    $scope.updateFormState = function(){
      if($scope.reference.isNoKnowledge())
        $scope.setFormState("noKnowledge");
      else if($scope.reference.isKnown())
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
      $scope.reference.save().then(function(reference){
        $scope.reference = reference;
        $scope.updateFormState();
      });
    }

    $scope.delete = function(){
      $scope.reference.expertise = undefined;
      $scope.save();
    }
  }

  ExperienceReferenceFormController.$inject = ['$scope', 'UserExperienceReference'];
  angular.module('Fused4').controller('ExperienceReferenceFormController',
                                      ExperienceReferenceFormController);
})();
