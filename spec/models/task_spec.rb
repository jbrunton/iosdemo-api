require 'spec_helper'

describe Task do
  let (:task) { create(:task, :description => 'Some Task') }
  
  it "has a description" do
    expect(task.description).to eq('Some Task')
  end
end
