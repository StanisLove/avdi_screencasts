Beer = Struct.new(:brewery, :name, :abv, :ibu) do
  def self.from_hash(attributes)
    new.tap do |instance|
      attributes.each do |key, value|
        instance[key] = value
      end
    end
  end

  def attributes
    {}.tap do |result|
      members.each do |name|
        result[name] = self[name]
      end
    end
  end
end
