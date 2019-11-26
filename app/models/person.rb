class Person < ActiveRecord::Base
  has_many :addresses
  accepts_nested_attributes_for :addresses
  # we do the above 
end
