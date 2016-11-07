require 'rspec'
require 'rspec/its'
require_relative '../team_players.rb'

describe "Player" do

  context "check results" do
    player1 = Player.new("Bob", 13, 5); 
    player2 = Player.new("Jim", 15, 4.5)
    player3 = Player.new("Mike", 21, 5) ;
    player4 = Player.new("Joe", 14, 5)
    player5 = Player.new("Scott", 16, 3)

    red_team = Team.new("Red")
    red_team.add_players(player1, player2, player3, player4, player5) # (splat)

    elig_players = red_team.select {|player| (14..20) === player.age }.reject {|player| player.skill_level < 4.5}
    it "igual a dos"  do
      expect(elig_players.size).to be==2
    end

  end

  context "verificando propiedades de instancia de Player" do
    subject(:player) { Player.new("Victor", 16, 10) }

    it "missing name" do
      is_expected.to respond_to(:name)
    end

    it "missing age" do
      is_expected.to respond_to(:age)
    end

    it "missing skill_level" do
      is_expected.to respond_to(:skill_level)
    end

  end

  context "verificando propiedades de clase Team" do
    subject(:class) { Team }

    it "missing teams_quantity" do
      is_expected.to respond_to(:teams_quantity)
    end
    
  end

  context "verificando propiedades de instancia Team" do
    subject(:class) { Team.new("red") }

    it "missing unlimited numbers" do
      is_expected.to respond_to(:add_players).with_unlimited_arguments
    end
  end
end
