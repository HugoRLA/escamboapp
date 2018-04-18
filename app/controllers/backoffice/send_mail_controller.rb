class Backoffice::SendMailController < ApplicationController

  def edit
    @admin = Admin.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def create
    AdminMailer.send_message(current_admin, params[:'recipient-name'],params[:'subject-text'],params[:'message-text'])
    respond_to do |format|
      format.js
    end
  end
end
