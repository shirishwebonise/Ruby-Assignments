require_relative 'helpers.rb'

class RubyIdentifier
  def identify(file_path)
    file_path = file_path.to_s
    file = open_file(file_path)
    file_contents = file.read
    match_code(file_contents.to_s)
  end

  private
    def open_file(file_name)
      begin
        return File.open(file_name)
      rescue
        puts file_name + " doesn't exist"
      end
    end

    def match_code(file_contents)
      match = /(?:class \w*[[:space:]]*(?<method>def [a-z_]*[[:space:]]*end[[:space:]]*)\g<method>\g<method>[[:space:]]*end[[:space:]]*)/.match(file_contents)
      puts "found a class:" if match
      print match
    end
end

Dir["./*"].each do |file_name|
  puts "checking file: " + file_name
  RubyIdentifier.new.identify(file_name)
  puts
end
