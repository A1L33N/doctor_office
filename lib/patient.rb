class Patient

attr_reader :name, :id, :birthday, :doctor_id

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @birthday = attributes.fetch(:birthday)
    @doctor_id = attributes.fetch(:doctor_id)
  end

 define_singleton_method(:all) do
   returned_patients = DB.exec("SELECT * FROM patients;")
   all_patients = []
   returned_patients.each() do |patient|
     patient_id = patient.fetch('id').to_i
     patient_name = patient.fetch('name')
     patient_birthday = patient.fetch('birthday')
     patient_doctor_id = patient.fetch('doctor_id').to_i
     all_patients.push(Patient.new({:id => patient_id, :name => patient_name, :birthday => patient_birthday, :doctor_id => patient_doctor_id}))
   end
   all_patients
 end

 define_method(:save) do

    result = DB.exec("INSERT INTO patients (name, id, birthday, doctor_id) VALUES ('#{@name}', #{@id}, '#{@birthday}', #{@doctor_id}) RETURNING id")
   @id = result.fetch().first("id").to_i
 end

end
