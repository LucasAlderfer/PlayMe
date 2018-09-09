class Player
  attr_reader :name, :id

  def initialize(name_id_array)
    @name = name_id_array[0]
    @id = name_id_array[1]
  end

end
