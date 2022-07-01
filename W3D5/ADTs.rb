class Stack
    def initialize
      @stack = []
    end

    def push(el)
      @stack << el
    end

    def pop
      @stack.pop
    end

    def peek
      @stack[-1]
    end
end

# stack = Stack.new
# stack.push(1)
# stack.push(2)
# stack.push(3) 
# p stack # => stack = [1,2,3]
# p stack.peek # => 3
# stack.pop
# stack.pop
# p stack # => stack = [1]

class Queue
    def initialize
        @queue = []
    end

    def enqueue(el)
        @queue << (el)
    end

    def dequeue
        @queue.shift
    end

    def peek
        @queue.first
    end
end

# queue = Queue.new
# queue.enqueue(1)
# queue.enqueue(2)
# queue.enqueue(3) 
# p queue # => queue = [1,2,3]
# p queue.peek # => 1
# queue.dequeue
# queue.dequeue
# p queue # => queue = [3]

class Map
    def initialize
        @map = []
    end

    def set(key, value)
        if get(key) != nil
            @map.each do |k|
                if k[0] == key
                    k[1] = value
                end
            end
        else
            @map << [key, value]
        end
    end

    def get(key)
        @map.each do |k|
            if k[0] == key
                return k[1]
            end
        end
        return nil
    end

    def delete(key)
        if get(key) != nil
            @map.each_with_index do |k, i|
                if k[0] == key
                    @map.delete_at(i)
                end
            end
        else
            puts "Key doesn't exist."
        end
    end

    def show
        p @map
    end
end

# map = Map.new
# map.set(1,2)
# map.set(3,4)
# map.show # map = [[1,2], [3,4]]
# ele = map.get(1)
# p ele # => 2
# map.delete(2) # => "Key doesn't exist"
# map.delete(1) 
# map.show # map = [[3,4]]
# map.set(3,7)
# map.show # map = [[3,7]]