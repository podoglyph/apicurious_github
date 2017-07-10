require 'rails_helper'

describe GithubService do
  attr_reader :service, :user

  before(:each) do
    @user = stub_omniauth
    #@service = GithubService.new(user)
  end

  describe ".initialize" do

    it "receives user object" do
      service = GithubService.new(user)
      expect(service).to be_a GithubService
    end

  end

  describe '#repos' do
    it 'finds all user repos' do
      VCR.use_cassette('github.repos') do
        repos = GithubService.repos(user)
        repo  = repos.first
        expect(repos.count).to eq(20)
        expect(repo[:first_name]).to eq('Liz')
        expect(repo[:last_name]).to eq('Cheney')
      end
    end
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: 'github',
      uid: "12345678",
      info: {
        nickname: "podoglyph",
        name: "Petey",
        image: "https://avatars3.githubusercontent.com/u/8197693?v=3"
      },
      extra: {
        raw_info: {
          login: "podoglyph",
          public_repos: 33,
          following: 33,
          followers: 33
        },
      },
      credentials: {
        token: ENV["GITHUB_ACCESS_TOKEN"]
      }
    })
  end

end
