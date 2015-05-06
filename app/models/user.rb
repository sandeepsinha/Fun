class User < ActiveRecord::Base
  validates :name,:presence => {:message => ""}
  validates :emp_id, :presence => {:message => "Id"}
  validates :password, :presence => {:message => ""}
end
