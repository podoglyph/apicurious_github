require 'rails_helper'

RSpec.describe "When user is logs in" do

  context "it authorizes through Github" do

    # before { logged_in_as_user }
    before(:each) do
      stub_omniauth
    end

    it "can see a list of all its repos" do
      VCR.use_cassette('user_can_see_all_repos') do
        visit repos_path

        expect(current_path).to eq('/repos')
        expect(page).to have_selector(".user-repo", count: 15)

        within first(".user-repo") do
          expect(page).to have_selector(".user-repo-name")
          expect(page).to have_selector(".user-repo-language")
        end
      end
    end

    def stub_omniauth
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
        provider: 'github',
        uid: "12345678",
        extra: {
          raw_info: {
            name: "Jimbo",
            login: "podoglyph",
          }
        },
        credentials: {
          token: ENV["GITHUB_ACCESS_TOKEN"],
        }
      })
    end

  end
end
