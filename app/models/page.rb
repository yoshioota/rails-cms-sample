class Page < ActiveRecord::Base

  belongs_to :site
  belongs_to :user

  scope :updated_at_desc, -> { order('updated_at DESC') }

  def compile_body
    self.body = RedcarpetCompiler.compile(self.body_source)
  end
end
