module Users
  class CreateUserInteractor
    include Interactor

    def call
      context.message = 'user_create.success'
      context.errors = []
      context.user = User.create(first_name: context.first_name,
                                 last_name: context.last_name,
                                 username: context.username)
      unless context.user
        context.fail!(message: 'user_create.failure', errors: ['Unable to create a new user.'])
      end
    end
  end
end
