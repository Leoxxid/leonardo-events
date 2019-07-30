class Api::V1::IssuesController < ApplicationController
  def create
    event = JSON.parse(request.body.read)
    issue = ::Api::V1::Issues::CreateService.new(event).call

    if issue.success
      render json: '', status: :created
    else
      render json: issue.errors, status: :unprocessable_entity
    end
  end
end
