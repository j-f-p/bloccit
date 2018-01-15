require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  let(:my_question) { Question.create!(
    title: RandomData.random_question, body: RandomData.random_paragraph,
    resolved: [false, true].sample ) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    
    it "assigns [my_question] to @questions" do
      get :index
      expect(assigns(:questions)).to eq([my_question])
    end
  end

  describe "GET #show" do
     it "returns http success" do
       get :show, params: { id: my_question.id }
       expect(response).to have_http_status(:success)
     end
     
     it "renders the #show view" do
       get :show, params: { id: my_question.id }
       expect(response).to render_template :show
     end
 
     it "assigns my_question to @question" do
       get :show, params: { id: my_question.id }
       expect(assigns(:question)).to eq(my_question)
     end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end
    
    it "instantiates @question" do
      get :new
      expect(assigns(:question)).not_to be_nil
    end
  end
  
  describe "POST create" do
    it "increases the number of Question by 1" do
      expect{ post :create, params: { question:
             { title: RandomData.random_question,
                 body: RandomData.random_paragraph,
                 resolved: [false, true].sample }
        } }.to change(Question,:count).by(1)
    end

    it "assigns the new post to @question" do
      post :create, params: { question: { title: RandomData.random_question, 
        body: RandomData.random_paragraph, resolved: [false, true].sample } }
      expect(assigns(:question)).to eq Question.last
    end

    it "redirects to the new question" do
      post :create, params: { question: { title: RandomData.random_question,
        body: RandomData.random_paragraph, resolved: [false, true].sample } }
      expect(response).to redirect_to Question.last
    end
  end
  
  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { id: my_question.id }
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #edit view" do
      get :edit, params: { id: my_question.id }
      expect(response).to render_template :edit
    end
    
    it "assigns question to be updated to @question" do
      get :edit, params: { id: my_question.id }
      
      question_instance = assigns(:question)
      
      expect(question_instance.id).to eq my_question.id
      expect(question_instance.title).to eq my_question.title
      expect(question_instance.body).to eq my_question.body
      expect(question_instance.resolved).to eq my_question.resolved
    end
  end

end
