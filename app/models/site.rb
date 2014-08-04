class Site < ActiveRecord::Base

  belongs_to :user

  belongs_to :page

  has_many :pages

end
