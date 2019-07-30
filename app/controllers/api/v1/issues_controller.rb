class Api::V1::IssuesController < ApplicationController
  def create
    event = JSON.parse(request.body.read)
    issue = ::Api::V1::Issues::CreateService.new(event)
  end
end
