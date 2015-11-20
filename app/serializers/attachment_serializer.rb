class AttachmentSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :filename, :filetype, :filesize, :original, :thread, :thumb, :created_at, :is_an_image?

  has_one :comment, serializer: CommentSerializer
  has_one :author, serializer: UserSerializer, root: 'users'
end
