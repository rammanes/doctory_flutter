
String base_url = "https://doctory.s2.rocksoft.io/public/doctory";

String login_api = base_url+"/auth/authenticate";
String specialist_api= base_url+"/items/department?fields=*.*";
String appointment_api= base_url+"https://doctory.s2.rocksoft.io/public/doctory/items/appointments?fields=id,status,video_room_id,rating,type,date,time,date_time,medical_file,doctor.department.name,doctor.doctor_id.first_name,doctor.doctor_id.last_name,doctor.doctor_id.avatar.data,doctor.doctor_id.id,rating&filter[medical_file.owner]=4&filter[status][in]=progress,pending&sort=-date_time";