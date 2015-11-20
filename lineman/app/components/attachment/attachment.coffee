angular.module('loomioApp').directive 'attachment', ->
  scope: { attachment: '=', style: '@'}
  restrict: 'E'
  templateUrl: 'generated/components/attachment/attachment.html'
  replace: true
  controller: ($scope, $rootScope) ->
    $scope.destroy = ->
      $rootScope.$broadcast('attachmentRemoved', $scope.attachment.id)
      $scope.attachment.destroy()

    $scope.location = ->
      $scope.attachment[$scope.style]
