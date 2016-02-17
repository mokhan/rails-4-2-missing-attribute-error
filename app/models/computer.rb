class Computer < ActiveRecord::Base
  has_one :agent
  has_many :nics
end
