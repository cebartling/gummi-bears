module Types
  class CommentType < Types::BaseObject
    field :post, Types::PostType, null: true
  end
end
