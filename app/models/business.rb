class Business < ActiveRecord::Base
  has_many :computers
  has_many :agents, through: :computers
end
