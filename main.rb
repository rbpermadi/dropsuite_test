require "fileutils"

def most_identical_content (base_path)
  file_paths = Dir[File.join(base_path, '**', '*')]

  file_path_counter = Hash.new
  file_paths.each do |file_path|
    if File.file? file_path
      new_file_path = ""
      file_path_counter.each do |key, value|
        if(FileUtils.compare_file(key,file_path))
          new_file_path = key
          break
        end
      end

      new_file_path = file_path if new_file_path.empty?
      file_path_counter[new_file_path] = 0 unless file_path_counter.key? new_file_path
      file_path_counter[new_file_path] += 1
    end
  end

  return file_path_counter
end

base_path = '/Users/rojalibudipermadi/Downloads/DropsuiteTest'
result = most_identical_content base_path
print result
print "\n"