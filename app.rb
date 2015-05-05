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
