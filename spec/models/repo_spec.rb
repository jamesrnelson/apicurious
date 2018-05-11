require 'rails_helper'

describe Repo do
  let(:attributes){
      {
        owner: {
        login: 'joeschmoe'
        },
        description: 'a repository',
        name: 'apicurious',
        language: 'ruby',
        stargazers_count: '100',
        forks_count: '1000'
      }
    }

    subject { Repo.new(attributes) }
    context 'initialize' do
      it 'exists with valid attributes' do
        expect(subject.owner).to eq('joeschmoe')
        expect(subject.description).to eq('a repository')
        expect(subject.name).to eq('apicurious')
        expect(subject.language).to eq('ruby')
        expect(subject.stargazers_count).to eq('100')
        expect(subject.forks_count).to eq('1000')
      end
    end
  end
