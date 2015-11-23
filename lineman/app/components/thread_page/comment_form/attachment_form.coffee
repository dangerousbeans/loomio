angular.module('loomioApp').directive 'attachmentForm', ->
  scope: {comment: '='}
  restrict: 'E'
  templateUrl: 'generated/components/thread_page/comment_form/attachment_form.html'
  replace: true
  controller: ($scope, $rootScope, $timeout, Records) ->
    $scope.upload = (files) ->
      for file in files
        $rootScope.$broadcast 'disableCommentForm'
        Records.attachments.upload(file, $scope.progress)
                           .then($scope.success)
                           .finally($scope.reset)

    $scope.selectFile = ->
      $timeout -> document.querySelector('.attachment-form__file-input').click()

    $scope.progress = (progress) ->
      $scope.percentComplete = Math.floor(100 * progress.loaded / progress.total)

    $scope.success = (data) ->
      _.each data.attachments, (attachment) ->
        $scope.comment.newAttachmentIds.push(attachment.id)

    $scope.reset = ->
      $scope.files = null
      $scope.percentComplete = 0
      $rootScope.$broadcast 'enableCommentForm'
    $scope.reset()
