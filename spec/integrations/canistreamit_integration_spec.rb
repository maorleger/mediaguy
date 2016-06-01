require 'rails_helper'

RSpec.feature 'canistreamit' do
  let(:client) { Canistreamit::Client.new }

  it 'works' do
    expect(client.search('999999999999')).to eq([])
  end

  it 'can return data for a valid series' do
    results = client.search('Seinfeld')
    expect(results[0]).to include('_id' => a_string_matching(/.*/))
  end

  it 'can return data for a valid movie name' do
    # expect an id to return stuff
    results = client.search('pulp fiction')
    expect(results[0]).to include('_id' => a_string_matching(/.*/))
  end

  it 'stream by default in availability' do
    results = client.search_and_query('goodfellas')[0]
    expect(results).to include("availability")
    expect(results["availability"]).to include("streaming")

  end

  it 'allows you to pass in multiple options' do
    results = client.search_and_query('goodfellas', ['streaming', 'rental', 'purchase', 'dvd'])[0]
    expect(results).to include("availability")
    expect(results["availability"]).to include("streaming")
    expect(results["availability"]).to include("rental")
    expect(results["availability"]).to include("purchase")
    expect(results["availability"]).to include("dvd")
  end
end
