require 'spec_helper'

describe MetaNexus::Wow::Realm do
  skip 'succesfully get realm statuses info', :vcr do
    realm = MetaNexus::Wow::Realm
    realm_status = realm.status
    # TODO: figure out how to test this HUGE json response.
  end
end
