class Api::V1::EventsController < ApplicationController
  before_action :set_issue
  def index
    render json: @issue.events
  end

  private

  def set_issue
    @issue = Issue.find(params[:id])
  end
end
