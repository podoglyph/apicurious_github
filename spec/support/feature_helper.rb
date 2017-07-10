module FeatureHelpers
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
          public_repos: 33,
          following: 33,
          followers: 33,
          login: "podoglyph"
        },
      },
      credentials: {
        token: ENV["GITHUB_ACCESS_TOKEN"]
      }
    })
  end
end
