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
   
  describe "POST create" do
    it "increases the number of Sponsors by 1" do
      expect{ post :create, params: { topic_id: my_topic.id,
        sponsor: { title: RandomData.random_sentence,
        body: RandomData.random_paragraph, price: rand(1..100) } }
      }.to change(Sponsor,:count).by(1)
    end

    it "assigns the new sponsor to @sponsor" do
      post :create, params: { topic_id: my_topic.id, sponsor: {
        title: RandomData.random_sentence, body: RandomData.random_paragraph,
        price: rand(1..100)} }
      expect(assigns(:sponsor)).to eq Sponsor.last
    end

    it "redirects to the new sponsor" do
      post :create, params: { topic_id: my_topic.id, sponsor: {
        title: RandomData.random_sentence, body: RandomData.random_paragraph,
        price: rand(1..100)} }
      expect(response).to redirect_to [my_topic, Sponsor.last]
    end
  end


  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

end
