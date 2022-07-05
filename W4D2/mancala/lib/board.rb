class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player_1 = name1
    @player_2 = name2
    @cups = Array.new(14) { Array.new }
    self.place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups[0..5].map { |cup| cup.push(:stone, :stone, :stone, :stone) }
    @cups[7..12].map { |cup| cup.push(:stone, :stone, :stone, :stone) }
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 13
    raise "Starting cup is empty" if @cups[0].empty?
  end

  def make_move(start_pos, current_player_name)
    num_stones = @cups[start_pos].length
    @cups[start_pos].clear
    current_pos = start_pos
    while num_stones > 0
      current_pos += 1
      current_pos = 0 if current_pos > 13
      if current_pos == 6 || current_pos == 13
        if current_player_name == @player_1
          @cups[6] << :stone
        else
          @cups[13] << :stone
        end
      else
        @cups[current_pos] << :stone
      end
      num_stones -= 1
    end

    render
    next_turn(current_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all? { |cup| cup.empty? } ||
    @cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    player_1_score = @cups[6].count
    player_2_score = @cups[13].count

    if player_1_score > player_2_score
      return @player_1
    elsif player_2_score > player_1_score
      return @player_2
    else
      return :draw
    end
  end
end
