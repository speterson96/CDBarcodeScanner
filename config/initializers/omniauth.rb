OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '575868889255-7lqrm0arq6mniostv3o6d7i69ds1b3v5.apps.googleusercontent.com', 'BUPUqP0EuNBW-a-B0PNglvbh', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
  
  #Skyler
  #provider :google_oauth2, '786807918743-jikhuln47kb3n1lhttphhaumil6i7eiv.apps.googleusercontent.com', 'OSVLeb9HuuvriP2LbYcucrDP', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}} 
end