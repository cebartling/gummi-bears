module Users
  class UpdateUserInteractor
    include Interactor

    def call
      context.message = 'user_update.success'
      context.errors = []
      context.user = User.find(context.id)
      unless context.user.nil?
        attributes = {
          first_name: context.first_name.nil? ? context.user.first_name : context.first_name,
          last_name: context.last_name.nil? ? context.user.last_name : context.last_name
        }
        unless context.user.update(attributes)
          context.fail!(user: nil, message: 'user_update.failure', errors: context.user.errors)
        end
      else
        context.fail!(user: nil, message: 'user_update.failure', errors: ["Unable to find user by ID: #{context.id}"])
      end
    end

  end
end
