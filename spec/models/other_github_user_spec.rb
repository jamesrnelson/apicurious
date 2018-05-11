require 'rails_helper'

describe OtherGithubUser do
  let(:attributes){
      {
        avatar_url: 'https://avatars3.githubusercontent.com/u/34174321?s=460&v=4',
        login: 'jamesrnelson'
      }
    }

    subject { OtherGithubUser.new(attributes) }
    context 'initialize' do
      it 'exists with valid attributes' do
        expect(subject.avatar).to eq('https://avatars3.githubusercontent.com/u/34174321?s=460&v=4')
        expect(subject.name).to eq('jamesrnelson')
      end
    end
  end
