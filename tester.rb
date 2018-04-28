# Solutions Ruby
# Problem 1
def solve_tree_a(tree_a)
  queue = [tree_a.root]
  solution = []
  while !queue.empty?
    current_node = queue.shift
    # should go from left to right visiting each node's children
    # assume we can call .left, .mid, .right on each node to specify
    solution << current_node
    queue << current_node.left if !current_node.left.nil? 
    queue << current_node.mid if !current_node.mid.nil? 
    queue << current_node.right if !current_node.right.nil?
  end
  solution.join(" ")
end


# Problem 2
class TMGoalTracker
  def initialize
    @teams = []
    @last_scored_team = ""
  end

  def add_team(team)
    @teams << team unless @teams.include? team
  end

  def score_for_team(team)
    team.score
    team.score if last_scored?(team)
    @last_scored_team = team
  end

  def loss_for_team(team)
    team.lose
  end

  def last_scored?(team)
    @last_scored_team == team
  end

  def display_scores
    result = ""
    @teams.each do |team|
      result += "team: #{team.score} "
    end
    puts result
  end
end

class Team
  def initialize
    @score = 0
  end

  def score
    @score += 1
  end

  def lose
    @score -= 1 unless @score == 0
  end
end