def most_identical_content (base_path)
  file_paths = Dir[File.join(base_path, '**', '*')]

  new_file_paths = []
  file_paths.each do |file_path|
    if File.file? file_path
        new_file_paths << file_path
    end
  end

  return new_file_paths
end

base_path = '/Users/rojalibudipermadi/Downloads/DropsuiteTest'
result = most_identical_content base_path
print result
print "\n"