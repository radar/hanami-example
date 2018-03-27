module Web::Controllers::SignIn
  class Perform
    include Web::Action

    def call(params)
      transaction = Web::Transactions::Users::SignIn.new
      transaction.(params[:user]) do |result|
        result.success do |user|
          sign_in(user)

          flash[:notice] = "You have signed in successfully."
          redirect_to '/'
        end

        result.failure do
          flash[:alert] = "Invalid email or password."
        end
      end
    end
  end
end
