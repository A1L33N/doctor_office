class Patient

attr_reader :name, :id, :birthday, :doctor_id

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @birthday = attributes.fetch(:birthday)
  end

end
