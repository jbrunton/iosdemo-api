require 'spec_helper'

describe TasksController do
  describe "GET tasks" do
    let(:task) { Task.create(:description => 'Some Task') }

    it "assigns @tasks" do
      get :index
      expect(assigns(:tasks)).to eq([task])
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end
  
  describe "GET task" do
    let(:task) { Task.create(:description => 'Some Task') }

    it "assigns the requested contact to @task" do
      get :show, id: task
      assigns(:task).should eq(task)
    end

    it "renders the :show template" do
      get :show, id: task
      expect(response).to render_template(:show)
    end
  end
  
  describe "POST create" do
    it "creates a new task" do
      expect(Task).to receive(:new).
        with('description' => 'Some Task').
        and_call_original

      post :create, :task => { :description => 'Some Task' }
    end
    
    context "when the task saves successfully" do
      it "creates a new record" do
        post :create, :task => { :description => 'Some Task' }
        expect(Task.where(:description => 'Some Task').size).to eq(1)
      end
      
      it "redirects to the page for that task" do
        post :create, :task => { :description => 'Some Task' }
        response.should redirect_to(Task.last)
      end
    end

    context "when the task fails to save" do
      it "renders the new template" do
        post :create, :task => { :description => '' }
        response.should render_template(:new)
      end
    end
  end
  
  # describe "POST create" do
  #   let(:user) { create(:user) }
  # 
  #   before do
  #     sign_in user
  #   end
  # 
  #   it "builds a new bleat" do
  #     subject.current_user.bleats.should_receive(:build).
  #       with("content" => "Howdy!")
  #     post :create, :bleat => { :content => "Howdy!" }
  #   end
  # 
  #   context "when the bleat saves successfully" do
  #     it "redirects to the user's profile" do
  #       post :create, :bleat => { :content => "Howdy!" }
  #       response.should redirect_to(subject.current_user)
  #     end
  #   end
  # 
  #   context "when the bleat fails to save" do
  #     it "renders the new template" do
  #       post :create, :bleat => { :content => "" }
  #       response.should render_template("new")
  #     end
  #   end
  # end
end
