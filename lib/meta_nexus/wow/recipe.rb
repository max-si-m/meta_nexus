class MetaNexus::Wow::Recipe < MetaNexus::Wow

  # Find recipe info in Battle.net WoW Api
  # Required arguments:
  # id      - recipe id
  #
  # Example:
  #   recipe = MetaNexus::Wow::Recipe
  #   recipe.find('33994')
  # Response in Hash:
  #   {"id"=>33994, "name"=>"Precise Strikes", "profession"=>"Enchanting", "icon"=>"spell_holy_greaterheal"}
  #

  def self.find(id)
    call_url = "#{client.url}/recipe/#{id}?locale=#{MetaNexus.config.locale}&apikey=#{MetaNexus.config.api_key}"
    MetaNexus::Api.call_api(call_url)
  end
end
