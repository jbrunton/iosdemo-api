require 'spec_helper'

describe Task do
  before(:each) do
    @task = Task.create(:description => 'Some Task')
  end
  
  it "has a description" do
    expect(@task.description).to eq('Some Task')
  end
end
