require 'rails_helper'

RSpec.describe "When user is logs in" do

  context "it authorizes through Github" do

    before { logged_in_as_user }

    it "can see a list of all its repos" do
      VCR.use_cassette('user_can_see_all_repos') do
        visit repos_path

        expect(current_path).to .eq('/repos')

        expect(page).to have_selector(".user-repo", count: 15)

        within first(".user-repo") do
          expect(page).to have_selector(".user-repo-name")
          expect(page).to have_selector(".user-repo-language")
        end
      end
    end
  end
end
