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

  max = file_path_counter.max_by{|k,v| v}

  if max.nil?
      {content: "", count: nil, message: "there is no file in this directory"}
  else
      content = File.open(max[0])
      {content: content.read, count: max[1], message: ""}
  end
end

status = true
while status
    print "\nPlease input the directory full path : "
    base_path = gets.to_s.rstrip
    result = most_identical_content base_path
    print "#{result[:content]} #{result[:count].to_s}\n"
    print "Message : #{result[:message]}\n" unless result[:message].empty?
    print "\nDo you want to try again? (y/n) "
    answer = gets.to_s.rstrip
    status = false if answer == "n"
end