class GithubService

  def initialize(filter = {})
    @filter = filter
    @conn = Faraday.new(url: "https://api.github.com")
  end

  def get_user_repos
    response = conn.get "/api/alt-fuel-stations/v1/nearest.json", default_filter.merge(filter)

    #?api_key=#{ENV['nrel_api_key']}&location=#{zip}&limit=10&radius=6&fuel_type=ELEC,LPG"

    JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
  end

  def self.find_nearest(filter)
    new(filter).find_nearest
  end

  private
    attr_reader :filter, :conn

    def default_filter
      {
        api_key: ENV['nrel_api_key'],
        limit: 10,
        radius: 6,
        fuel_type: "ELEC, LPG"
      }
    end

end
