def read_file(file_path)
  file = File.open(file_path)
  if file
    data = file.read
    return data
  else
    puts "error: not able to access the file"
    return ""
  end
end

def write_file(file_path, data)
  File.open(file_path, "w") do |line|
    line.puts data
  end
end
