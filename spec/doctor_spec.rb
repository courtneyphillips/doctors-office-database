require('rspec')
require('doctor')
require('pg')

DB = PG.connect({:dbname => 'office_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM doctors *;")
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

end
