class RedcarpetCompiler

  # [NOTE] スクリプトタグをエスケープしてautolinkする方法がわからなかったのでRinkuでautolink
  def self.compile(markdown_text)
    @renderer ||= Redcarpet::Render::HTML.new(hard_wrap: true, autolink: true, tables: true, escape_html: true)
    @markdown ||= Redcarpet::Markdown.new(@renderer)
    markdown_text = @markdown.render(markdown_text)
  end

  def self.compile_text(markdown_text)
    body_html = compile(markdown_text)
    html_to_text(body_html)
  end

  def self.html_to_text(html_str)
    nokogiri_doc = Nokogiri::HTML(html_str)
    nokogiri_doc.inner_text
  end
end
