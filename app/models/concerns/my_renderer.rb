class MyRenderer < Redcarpet::Render::HTML

  def initialize(*args)
    super
  end

  def postprocess(full_document)
    Rinku.auto_link(full_document, mode = :all, link_attr = 'target="_blank"', skip_tags = nil)
  end
end
