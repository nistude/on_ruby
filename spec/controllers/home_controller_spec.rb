require 'spec_helper'

describe HomeController do

  describe "GET :index" do
    before { get :index }

    it "should render the :index template" do
      response.should render_template(:index)
    end
  end

end
