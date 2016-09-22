
module Helpers
  $RUBY_FILE_PATTERN = /([a-z0-9])+_?([a-z0-9])+\.rb$/

  def snake_to_camel_case(file_name)

  end

  def match_file_name_pattern(file_name)
    $RUBY_FILE_PATTERN.match(file_name)
  end
end