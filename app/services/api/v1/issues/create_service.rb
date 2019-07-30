class Api::V1::Issues::CreateService
  attr_accessor :success, :errors

  def initialize(params = {})
    @params = params
    @issue = @params['issue'].slice('number', 'title')
    @event = @params.slice('action', 'state', 'locked')
  end

  def call
    ActiveRecord::Base.transaction do
      issue = Issue.find_by(number: @issue['number']) ||
              Issue.create!(@issue.deep_symbolize_keys)
      Event.create!(
        @event.deep_symbolize_keys.merge(issue: issue)
      )
      self.success = true
      self
    end
  rescue ActiveRecord::RecordInvalid => e
    self.success = false
    self.errors = { errors: e }
    self
  end
end
