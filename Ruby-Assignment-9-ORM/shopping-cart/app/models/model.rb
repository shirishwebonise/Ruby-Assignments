require 'active_record'

class Model < ActiveRecord::Base
  self.abstract_class = true
end
