require_relative 'helpers.rb'

class RubyIdentifier
  def identify(file_path)
    file_path = file_path.to_s
    
    file = open_file(file_path)
 
    file_name = match_file_name_pattern(file_path)

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
        puts "Looks like a ruby file from the file name"
      else
        puts "That's not a ruby file"
      end
    end

    def check_class(file_name, file)
      expected_class_name = snake_to_camel_case(file_name)

      file.each do |line|
        
      end
    end
end

RubyIdentifier.new.identify('./code_snippet.rb')