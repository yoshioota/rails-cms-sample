class Site < ActiveRecord::Base

  belongs_to :user

  belongs_to :page

  has_many :pages
  has_many :site_members
  has_many :members, through: :site_members
end
