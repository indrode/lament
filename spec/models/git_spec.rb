require 'spec_helper'
require File.join(ROOT, 'models/git.rb')

describe Git do
  let(:git)     { Git.new("repo-user", "super-repo") }
  let(:session) { stub("session", timeout: 0) }

  describe "creates a new instance" do
    it "that stores git repo user" do
      git.git_user.should == "repo-user"
    end
    
    it "that stores git repo name" do
      git.git_repo.should == "super-repo"
    end
  end
end