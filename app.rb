require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/doctor')
require('./lib/patient')
require('pg')

DB = PG.connect({:dbname => "office"})

get('/') do
  erb(:index)
end

get('/doctors') do
  @doctors = Doctor.all()
  erb(:doctor)
end

get('/doctor_form') do
  erb(:doctor_form)
end

post('/add_doctor') do
  name = params.fetch("name")
  specialty = params.fetch("specialty")
  new_doctor = Doctor.new({:name => name, :specialty => specialty, :id => nil})
  new_doctor.save()
  redirect('/doctors')
end

get('/patients/:id') do
  @doctor = Doctor.find(params.fetch("id").to_i)
  erb(:patient)
end

get('/patient/:id/patient_form') do
  @doctor = Doctor.find(params.fetch("id").to_i)
  erb(:patient_form)
end

post('/add_patient') do
  doctor_id = params.fetch('doctor_id').to_i
  name = params.fetch("name")
  birthdate = params.fetch("birthdate")
  new_patient = Patient.new({:name => name, :birthdate => birthdate,  :doctor_id => doctor_id, :id => nil})
  new_patient.save()
  #@doctor = Doctor.find(doctor_id)
  url = "/patients/"+ (doctor_id.to_s)
  redirect(url)
end
