require 'rspec'
require_relative '../../lib/matchmaker'

RSpec.configure do |config|
  config.color = true
end

describe Matchmaker do
  let(:matchmaker) { Matchmaker.new(player_connections, matchmaker_options) }

  let(:matchmaker_options) {
    {
      num_teams: num_teams,
      min_team_size: min_team_size,
      max_team_size: max_team_size,
    }.delete_if { |_, value| value.nil? }
  }

  let(:player_connections) {
    [
      ['a', 1],
      ['b', 0],
      ['c', 1],
      ['d', 1],
      ['e', 1],
      ['f', 1],
    ]
  }

  def assert_teams
    expect(matchmaker.generate_teams).to eq(expected_result)
  end

  describe 'Midterm Example 1' do
    let(:num_teams) { 1 }
    let(:min_team_size) { 1 }
    let(:max_team_size) { 1 }
    let(:expected_result) { [['a']] }

    it 'should distribute the players accordingly' do
      assert_teams
    end
  end

  describe 'Midterm Example 2' do
    let(:num_teams) { 2 }
    let(:min_team_size) { 1 }
    let(:max_team_size) { 1 }
    let(:expected_result) { [['a'], ['c']] }

    it 'should distribute the players accordingly' do
      assert_teams
    end
  end

  describe 'Midterm Example 3' do
    let(:num_teams) { 2 }
    let(:min_team_size) { 1 }
    let(:max_team_size) { 2 }
    let(:expected_result) { [['a', 'd'], ['c', 'e']] }

    it 'should distribute the players accordingly' do
      assert_teams
    end
  end

  describe 'Midterm Example 4' do
    let(:num_teams) { 2 }
    let(:min_team_size) { 3 }
    let(:max_team_size) { nil }
    let(:expected_result) { nil }

    it 'should distribute the players accordingly' do
      assert_teams
    end
  end

  describe 'Midterm Example 5' do
    let(:num_teams) { 6 }
    let(:min_team_size) { 1 }
    let(:max_team_size) { nil }
    let(:expected_result) { nil }

    it 'should distribute the players accordingly' do
      assert_teams
    end
  end

  describe 'Midterm Example 5' do
    let(:num_teams) { 1 }
    let(:min_team_size) { 1 }
    let(:max_team_size) { nil }
    let(:expected_result) { [['a', 'c', 'd', 'e', 'f']] }

    it 'should distribute the players accordingly' do
      assert_teams
    end
  end
end

