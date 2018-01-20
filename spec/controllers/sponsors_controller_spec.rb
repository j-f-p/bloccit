require 'rails_helper'

RSpec.describe SponsorsController, type: :controller do
  let(:my_topic) { Topic.create!(name:  RandomData.random_sentence,
   description: RandomData.random_paragraph) }

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, params: { topic_id: my_topic.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new, params: { topic_id: my_topic.id }
      expect(response).to render_template :new
    end

    it "instantiates @sponsor" do
      get :new, params: { topic_id: my_topic.id }
      expect(assigns(:sponsor)).not_to be_nil
    end

  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

end
