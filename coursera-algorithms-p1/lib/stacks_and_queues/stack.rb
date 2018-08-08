class StackWithMax

  def initialize(data = nil)
    @main = data || []
    @track = initialize_track(data) || []
  end

  def push(n)
    main.push(n)
    return true if push_track(n)
  end

  def pop
    track.pop
    main.pop
  end

  def max
    track.last
  end

  private

  def push_track(n)
    if n > main.last
      track << n
    else
      track << main.last
    end
  end

  def initialize_track(data)
    result = []
    current_max = data[0]
    data.each do |n|
      current_max = n if n > current_max
      result << current_max
    end
    result
  end

  attr_accessor :main
  attr_accessor :track
end
