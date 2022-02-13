class category < ActiveHash::Base


  include ActiveHash::Associations
  has_many :items

end