module Users
  class CreateUser
    include Interactor

    def call
      context.user = User.create(first_name: context.first_name,
                                 last_name: context.last_name,
                                 username: context.username)
      unless context.user
        context.fail!(message: 'user_create.failure')
      end
    end
  end
end
