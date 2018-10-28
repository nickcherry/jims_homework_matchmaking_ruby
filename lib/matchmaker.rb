class Matchmaker
  attr_reader :player_connections, :num_teams, :min_team_size, :max_team_size

  def initialize(player_connections, num_teams: 3, min_team_size: 1, max_team_size: nil)
    @player_connections = player_connections
    @num_teams = num_teams
    @min_team_size = min_team_size
    @max_team_size = max_team_size
  end

  def generate_teams
    # If we don't have enough valid players to fill the required slots, return nil.
    return nil if num_teams * min_team_size > valid_players.count

    # Evenly distribute ("round-robin" style) the valid players across teams.
    valid_players.each_with_index.each_with_object([]) do |(player, index), teams|
      # Find or initialize a team for the current player index.
      team = teams[index % num_teams] ||= []

      # If the team hasn't exceeded the max team size, add the player to the team.
      team << player if max_team_size.nil? || team.size < max_team_size
    end
  end

  private

  def valid_players
    @valid_players ||= player_connections
      .reject { |connection| connection[1] == 0 } # Filter out bad connections
      .map    { |connection| connection[0] } # Pluck player name
  end
end
