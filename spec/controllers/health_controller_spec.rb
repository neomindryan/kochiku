require 'spec_helper'

describe HealthController do

  describe "#build_history_by_worker" do
    it "should render worker health page" do
      get :build_history_by_worker
      expect(response).to be_success
    end
  end
end
