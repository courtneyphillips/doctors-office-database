require('rspec')
require('patient')
require('pg')

DB = PG.connect({:dbname => 'office_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM patients *;")
  end
end

describe(Patient) do

  describe('#==') do
    it('recognizes when two entries are the same') do
      test_patient = Patient.new({:name => "Hulk Hogan", :birthdate => "1915-05-05", :doctor_id => 1, :id => nil})
      test_patient2 = Patient.new({:name => "Hulk Hogan", :birthdate => "1915-05-05", :doctor_id => 1, :id => nil})
      expect(test_patient).to(eq(test_patient2))
    end
  end


  describe('#save') do
    it('saves the entry for future recall') do
      test_patient = Patient.new({:name => "Hulk Hogan", :birthdate => "1915-05-05", :doctor_id => 1, :id => nil})
      test_patient.save()
      expect(Patient.all).to(eq([test_patient]))
    end
  end

describe('.find') do
  it('locates the relevant patient record') do
    test_patient = Patient.new({:name => "Susie Q", :birthdate => "1984-04-15", :doctor_id => 1, :id => nil})
    test_patient.save()
    expect(Patient.find(test_patient)).to(eq(test_patient))
  end
end

    end
