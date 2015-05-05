require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('show doctor path', {:type => :feature}) do
  it('displays a list of all doctors in the system') do
    test_doctor = Doctor.new({:name => "Dr.Strangelove", :specialty => "strange things", :id => nil})
    test_doctor.save()
    visit('/')
    click_link('View Doctors')
    expect(page).to have_content(test_doctor.name)
  end
end
