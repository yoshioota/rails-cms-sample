class Site < ActiveRecord::Base

  belongs_to :user

  belongs_to :page

  has_many :pages
  has_many :sites_members
  has_many :members, through: :sites_members, source: :user

  accepts_nested_attributes_for :page
end
