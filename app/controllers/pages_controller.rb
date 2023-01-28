class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if user_signed_in?
      # @patient = User.find(params[:patient_id])
      user = User.find(current_user.id)
      if Result.where(user_id: user.id).exists?
        @last_result = Result.where(user_id: user.id).last.next_test_date
      else
        @last_result = nil
      end
    end
  end

end
