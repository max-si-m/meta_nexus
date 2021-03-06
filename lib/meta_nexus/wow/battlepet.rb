class MetaNexus::Wow::BattlePet < MetaNexus::Wow

  attr_accessor :breed_id, :level, :quality_id

  # Find BattlePet ability in Battle.net WoW Api
  #
  # Required arguments:
  # id      - ability id
  #
  # Example:
  #   battlepet = MetaNexus::Wow::BattlePet
  #   battlepet.ability(640)
  # Response in Hash:
  #   {"id"=>640, "name"=>"Toxic Smoke", "icon"=>"spell_shadow_plaguecloud", "cooldown"=>0, "rounds"=>1, "petTypeId"=>9, "isPassive"=>false, "hideHints"=>false}
  #

  # Find BattlePet species in Battle.net WoW Api
  #
  # Required arguments:
  # id      - species id
  #
  # Example:
  #   battlepet = MetaNexus::Wow::BattlePet
  #   battlepet.species(258)
  # Response in Hash:
  #   {"speciesId"=>258, "petTypeId"=>9, "creatureId"=>42078, "name"=>"Mini Thor", ... }
  #

  # Find BattlePet stats in Battle.net WoW Api
  #
  # Required arguments:
  # id       - battle pet id
  #
  # Optional arguments:
  #
  # breed_id - Breed id
  # quality_id - Quality id
  # level - Level
  #
  # Example:
  #   battlepet = MetaNexus::Wow::BattlePet
  #   battlepet.stats(258)
  # Response in Hash:
  #   {"speciesId"=>258, "breedId"=>3, "petQualityId"=>1, "level"=>25, "health"=>1338, "power"=>261, "speed"=>193}
  #


  [:ability, :species].each do |type|
    define_singleton_method(type.to_sym) do |id|
      call_url = "#{client.url}/battlePet/#{type.to_s}/#{id}?locale=#{MetaNexus.config.locale}&apikey=#{MetaNexus.config.api_key}"
      MetaNexus::Api.call_api(call_url)
    end
  end

  def self.stats(id, **args)
    call_url = "#{client.url}/battlePet/stats/#{id}?"
    call_url += "level=#{args[:level]}&" if args[:level]
    call_url += "breedId=#{args[:breed_id]}&" if args[:breed_id]
    call_url += "qualityId=#{args[:quality_id]}&" if args[:quality_id]
    call_url += "locale=#{MetaNexus.config.locale}&apikey=#{MetaNexus.config.api_key}"
    MetaNexus::Api.call_api(call_url)
  end
end
