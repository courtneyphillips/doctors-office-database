
class Doctor
  attr_reader(:name, :specialty, :id)

  define_method(:initialize) do |attributes|

    @name = attributes.fetch(:name)
    @specialty = attributes.fetch(:specialty)
    @id = attributes.fetch(:id)

  end

  define_method(:==) do |other|
    same_class = self.class() == other.class()
    same_name = self.name() == other.name()
    same_specialty = self.specialty() == other.specialty()

    same_class && same_name && same_specialty
  end

  define_singleton_method(:all) do
    returned_doctors = DB.exec("SELECT * FROM doctors;")
    doctors = []
    returned_doctors.each do |doctor|
      name = doctor.fetch("name")
      specialty = doctor.fetch("specialty")
      id = doctor.fetch("id").to_i
      doctors.push(Doctor.new({:name => name, :specialty => specialty, :id => id}))
    end
    doctors
  end
  define_method(:save) do
    result = DB.exec("INSERT INTO doctors (name, specialty) VALUES ('#{@name}', '#{@specialty}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end


  define_method(:patient_list) do
    patients = []
    returned_patients = DB.exec("SELECT * FROM patients WHERE doctor_id = #{self.id()};")
    returned_patients.each do |patient|
       name = patient.fetch("name")
       birthdate = patient.fetch("birthdate")
       id = patient.fetch("id").to_i
       doctor_id = patient.fetch("doctor_id").to_i
      #  if doctor_id == .id()
        patients.push(Patient.new({:name => name, :birthdate => birthdate, :doctor_id => doctor_id, :id => id}))
      # end
    end
    patients
  end

  define_singleton_method(:find) do |person|
      all_doctors = Doctor.all()
      found_doctor = nil
      all_doctors.each do |doctor|
        if person == doctor
          found_doctor = doctor
        end
      end
      found_doctor
    end


end
