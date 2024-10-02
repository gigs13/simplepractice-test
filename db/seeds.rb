# db/seeds.rb

require 'faker'

# Borra todos los datos existentes 
Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all

# Crea doctores
10.times do
  Doctor.create!(
    name: Faker::Name.name
  )
end

# Crea pacientes
10.times do
  Patient.create!(
    name: Faker::Name.name,
    doctor: Doctor.order('RANDOM()').first # Asigna un doctor aleatorio
  )
end

# Crea citas
10.times do
  Appointment.create!(
    doctor: Doctor.order('RANDOM()').first, # Asigna un doctor aleatorio
    patient: Patient.order('RANDOM()').first, # Asigna un paciente aleatorio
    start_time: Faker::Time.forward(days: 23, period: :morning) # Hora de inicio aleatoria
  )
end
