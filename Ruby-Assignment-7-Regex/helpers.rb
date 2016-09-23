
module Helpers
  $RUBY_FILE_PATTERN = /([a-z0-9])+_?([a-z0-9])+\.rb$/
  $RUBY_MODULE_PATTERN = /(?<=module )(\w)+\b/
  $RUBY_CLASS_PATTERN = /(?<=class )(\w)+\b/

  def self.snake_to_camel_case(file_name)
    # code to change case
  end

  def self.match_file_name_pattern(file_name)
    $RUBY_FILE_PATTERN.match(file_name.to_s)
  end
end