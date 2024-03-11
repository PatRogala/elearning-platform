# frozen_string_literal: true

# Do not inherit from ActiveJob. All jobs use Sidekiq
class ApplicationJob
  include Sidekiq::Worker

  sidekiq_options backtrace: true
end
