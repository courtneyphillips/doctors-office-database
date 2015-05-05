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
      test_patient = Patient.new({:name => "Hulk Hogan", :birthdate => 1915-05-05, :doctor_id => 1, :id => nil})
      test_patient2 = Patient.new({:name => "Hulk Hogan", :birthdate => 1915-05-05, :doctor_id => 1, :id => nil})
    expect(test_patient).to(eq(test_patient2))
  end
end

end
