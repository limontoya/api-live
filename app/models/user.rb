class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  #antes de crear el obj en la bd
  #before_create :algo

  #after_create :despues

  #def algo

 # end

  #def despues

  #end
end
