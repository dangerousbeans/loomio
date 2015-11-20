angular.module('loomioApp').directive 'upload', ->
  scope: { attachment: '='}
  restrict: 'E'
  templateUrl: 'generated/components/upload/upload.html'
  replace: true
  controller: ($scope, $rootScope) ->
    $scope.destroy = ->
      $rootScope.$broadcast('attachmentRemoved', $scope.attachment.id)
      $scope.attachment.destroy()
