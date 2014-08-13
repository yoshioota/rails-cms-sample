class MyRenderer < Redcarpet::Render::HTML

  def initialize(*args)
    super
  end

  def postprocess(full_document)
    html = Rinku.auto_link(full_document, mode = :all, link_attr = 'target="_blank"', skip_tags = nil)
    html = html.gsub(/\[site:(.+)[^\\]\]/){|html| %Q|<a href="#{$1}">#{$1}</a>|}
    html
  end
end
