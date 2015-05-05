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

  define_method(:save) do
    result = DB.exec("INSERT INTO patients (name, birthdate, doctor_id) VALUES ('#{@name}', '#{@birthdate}', #{@doctor_id}) RETURNING id;")
    @id = result.first.fetch("id").to_i()
  end

  define_singleton_method(:all) do
    all_patients = DB.exec("SELECT * FROM patients;")
    patients = []
    all_patients.each() do |patient|
      name = patient.fetch("name")
      birthdate = patient.fetch("birthdate")
      doctor_id = patient.fetch("doctor_id").to_i
      id = patient.fetch("id").to_i
      patients.push(Patient.new({:name => name, :birthdate => birthdate, :doctor_id => doctor_id, :id => id}))
    end
    patients
  end



end
