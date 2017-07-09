require 'rails_helper'

RSpec.describe "User logs in using github" do
  context "they authorize app to access github" do

    before(:each) do
      stub_omniauth
    end

    it "they click login link" do
      VCR.use_cassette("github_service.login") do
        visit root_path

        within('.container') do
          click_on "Sign in"
        end

        expect(page.status_code).to be(200)

        within('.navbar-nav.navbar-right') do
          expect(page).to have_content("Sign out")
        end
      end
    end

    it "they click logout link" do
      VCR.use_cassette("github_service.logout") do
        visit root_path

        within('.container') do
          click_on "Sign in"
        end

        within('.navbar') do
          click_on "Sign out"
        end

        expect(page.status_code).to be(200)
        expect(page).not_to have_content("Sign out")
        expect(page).to have_content("Sign in")
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
        name: "Jimbo",
        image: "https://avatars3.githubusercontent.com/u/8197693?v=3"
      },
      extra: {
        raw_info: {
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
