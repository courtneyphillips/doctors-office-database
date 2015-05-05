require('rspec')
require('doctor')
require('pg')
require('patient')

DB = PG.connect({:dbname => 'office_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM doctors *;")
    DB.exec("DELETE FROM patients *;")
  end
end

describe(Doctor) do

  describe("#==") do
    it("recognizes when two objects have the same name") do
      test_doctor = Doctor.new({:name => "Dr.Homie", :specialty => "bro-ectomies", :id => nil})
      test_doctor2 = Doctor.new({:name => "Dr.Homie", :specialty => "bro-ectomies", :id => nil})
      expect(test_doctor).to(eq(test_doctor2))
    end
  end
  describe('#save') do
    it('saves doctor name into database and retrieves it') do
      test_doctor = Doctor.new({:name => "Dr.Homie", :specialty => "bro-ectomies", :id => nil})
      test_doctor.save()
      expect(Doctor.all).to(eq([test_doctor]))
    end
  end
  describe('#patient_list') do
    it('returns a doctors list of patients') do
      test_doctor = Doctor.new({:name => "Dr.Homie", :specialty => "bro-ectomies", :id => nil})
      test_doctor.save()
      test_patient = Patient.new({:name => "Chad Smirnoff-Ice", :birthdate => "1985-12-08", :doctor_id => test_doctor.id(), :id => nil})
      test_patient.save()
      expect(test_doctor.patient_list()).to(eq([test_patient]))
    end
  end
  describe('#patient_list') do
    it('returns a doctors list of patients') do

      test_doctor = Doctor.new({:name => "Dr.Homie", :specialty => "bro-ectomies", :id => nil})
      test_doctor.save()
      test_doctor2 = Doctor.new({:name => "Dr.Jagermeister", :specialty => "bro-ectomies", :id => nil})
      test_doctor2.save()
      test_patient = Patient.new({:name => "Chad Smirnoff-Ice", :birthdate => "1985-12-08", :doctor_id => test_doctor.id(), :id => nil})
      test_patient.save()
      test_patient2 = Patient.new({:name => "TAPOUT Nor Cal", :birthdate => "1985-12-08", :doctor_id => test_doctor.id(), :id => nil})
      test_patient2.save()
      expect(test_doctor2.patient_list()).to(eq([]))
    end
  end
end
