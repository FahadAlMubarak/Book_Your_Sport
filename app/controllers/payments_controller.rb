class PaymentsController < ApplicationController

  def new
    @order = current_user.bookings.where(status: 'pending').find(params[:order_id])
  end
end
