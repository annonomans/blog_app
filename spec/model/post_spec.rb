require 'rails_helper'

RSpec.describe Post, type: :model do
  it "ensures the presence of title" do
      post = Post.new(title: "").save
      expect(post).to eq(false)
  end

  it "is not valid without a content" do 
     post = Post.new(content: nil)
     expect(post).to_not be_valid
  end
end