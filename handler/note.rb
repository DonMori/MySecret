require_relative "cryptography"
require_relative "base64"
require_relative "system"
require_relative "file"

def write_note(file_path, secret_key)
  editor = get_text_editor()
  execute("#{editor} #{file_path}")
  
  data = read_file(file_path)
  encrypted_data = encrypt(data, secret_key)
  encoded_data = encode(encrypted_data)

  write_file(file_path, encoded_data)
end

def read_note(file_path, secret_key)
  data = read_file(file_path)
  decoded_data = decode(data)
  decrypted_data = decrypt(decoded_data, secret_key)
  
  temp_file = "#{file_path}.temp"
  write_file(temp_file, decrypted_data)

  editor = get_text_editor()
  execute("#{editor} #{temp_file}")
  execute("rm #{temp_file}")
end

def edit_note(file_path, secret_key)
  data = read_file(file_path)
  decoded_data = decode(data)
  decrypted_data = decrypt(decoded_data, secret_key)

  temp_file = "#{file_path}.temp"
  write_file(temp_file, decrypted_data)

  editor = get_text_editor()
  execute("#{editor} #{temp_file}")

  encrypt_note(temp_file, secret_key)

  execute("rm #{file_path}")
  execute("mv #{temp_file} #{file_path}")
end

def encrypt_note(file_path, secret_key)
  data = read_file(file_path)
  encrypted_data = encrypt(data, secret_key)
  encoded_data = encode(encrypted_data)

  write_file(file_path, encoded_data)
end
