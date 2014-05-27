class HealthController < ApplicationController

  def build_history_by_worker
    history_depth = params[:count] || 2000
    build_attempts = BuildAttempt.order('id DESC').limit(history_depth)

    @workers = {}
    build_attempts.each do |attempt|
      if @workers.has_key? attempt.builder
        @workers[attempt.builder] << attempt.state
      else
        @workers[attempt.builder] = [attempt.state]
      end
    end
  end
end  
