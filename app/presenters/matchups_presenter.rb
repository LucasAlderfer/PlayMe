class MatchupsPresenter

  def initialize(array_data, array_ids)
    @data = array_data
    @ids = array_ids
  end

  def data
    array_of_hashes = @data.inject([]) do |new_array, hero_array|
      new_array << hero_array.to_h
      new_array
    end
    array_of_hashes
  end

  def ids
    @ids
  end

end
