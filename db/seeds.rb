# db/seeds.rb

require 'faker'

# Borra todos los datos existentes (opcional)
Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all

# Crea doctores y pacientes
Doctor.transaction do
  10.times do
    doctor = Doctor.create!(
      name: Faker::Name.name
      #email: Faker::Internet.email
    )

    # Crea 10 pacientes únicos por cada doctor
    10.times do
      patient = Patient.create!(
        name: Faker::Name.unique.name, # Asegura nombres únicos
        doctor: doctor
      )

      # Crea 5 citas en el pasado
      5.times do
        Appointment.create!(
          doctor: doctor,
          patient: patient,
          start_time: Faker::Time.backward(days: 30, period: :morning)
        )
      end

      # Crea 5 citas en el futuro
      5.times do
        Appointment.create!(
          doctor: doctor,
          patient: patient,
          start_time: Faker::Time.forward(days: 30, period: :morning)
        )
      end
    end
  end
end
