require_relative 'helpers.rb'

class RubyIdentifier
  def identify(file_path)
    file_path = file_path.to_s
    
    file = open_file(file_path)
 
    file_name = Helpers::match_file_name_pattern(file_path)

    check_file_name(file_name)

    check_class(file_name, file)
  end

  private
    def open_file(file_name)
      begin
        return File.open(file_name)
      rescue
        puts file_name + " doesn't exist"
      end
    end

    def check_file_name(file_name)
      if Helpers::match_file_name_pattern(file_name)
        puts "Might be a ruby file as per the file name"
      else
        puts "That's not a ruby file"
      end
    end

    def check_class(file_name, file)
      # expected_class_name = snake_to_camel_case(file_name)
      file.each do |line|
        match = $RUBY_CLASS_PATTERN.match(line)
        puts "found a class: "+match.to_s if match

        match = $RUBY_MODULE_PATTERN.match(line)
        puts "found a module: "+match.to_s if match
      end
    end
end

Dir["./*"].each do |file_name| 
  puts "checking file: " + file_name
  RubyIdentifier.new.identify(file_name)
  puts
end
