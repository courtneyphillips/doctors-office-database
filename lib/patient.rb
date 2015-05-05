class Patient
  attr_reader(:name, :birthdate, :doctor_id, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @birthdate = attributes.fetch(:birthdate)
    @doctor_id = attributes.fetch(:doctor_id)
    @id = attributes.fetch(:id)
  end

  define_method(:==) do |other|
    (self.name == other.name) && (self.birthdate == other.birthdate) && (self.doctor_id == other.doctor_id)
  end


end
