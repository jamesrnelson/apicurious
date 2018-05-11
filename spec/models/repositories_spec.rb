require 'rails_helper'

describe Repositories do
  subject { Repositories.new('jamesrnelson', ENV['github_api_key'], '/repos') }

  context 'initialize' do
    it 'exists with a valid arguments' do
      expect(subject).to be_a Repositories
    end
  end

  context "instance methods" do
    context "#user_repos" do
      it "returns a collection of repos" do
        VCR.use_cassette("Repositories#user_repos") do
          expect(subject.user_repos.count).to eq(30)
          expect(subject.user_repos.first).to be_a Repo
        end
      end
    end
  end
end
