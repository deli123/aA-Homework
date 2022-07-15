# Find the longest fish in O(n^2) time. 
# Do this by comparing all fish lengths to all other fish lengths
def sluggish_octopus(arr)
    longest = arr.first
    arr.each do |ele|
        arr.each do |ele2|
            if ele2.length > ele.length
                longest = ele2
            end
        end
    end
    longest
end

# Find the longest fish in O(n log n) time
def dominant_octopus(arr)
    arr.sort_by { |ele| ele.length }.last
end

# Find the longest fish in O(n) time. 
# The octopus can hold on to the longest fish that you have found so far while stepping through the array only once.
def clever_octopus(arr)
    longest = arr.first
    arr.each { |ele| longest = ele if ele.length > longest.length }
    longest
end

# arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'] # => "fiiiissshhhhhh"
# p sluggish_octopus(arr)
# p dominant_octopus(arr)
# p clever_octopus(arr)


# Given a tile direction, iterate through a tiles array to return the tentacle number (tile index) the octopus must move. 
# This should take O(n) time.
def slow_dance(direction, tiles)
    tiles.each_with_index { |tile, i| return i if tile == direction }
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", 
                "left",  "left-up" ]
# p slow_dance("up", tiles_array)
# p slow_dance("right-down", tiles_array)


def fast_dance(direction, tiles)
    tiles[direction]
end

tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

p fast_dance("up", tiles_hash)
p fast_dance("right-down", tiles_hash)
