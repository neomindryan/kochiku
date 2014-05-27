class HealthController < ApplicationController

  def index
    build_attempts = BuildAttempt.take(2000)

    @workers = {}
    build_attempts.each do |attempt|
      if @workers.has_key? attempt.builder
        @workers[attempt.builder] += [attempt.state]
      else
        @workers[attempt.builder] = [attempt.state]
      end
    end
  end
end  
