require 'kramdown'
class PagesController < ApplicationController
  def about
    file_path = lookup_context.find_template("#{controller_path}/#{action_name}")

    p file_path
    p file_path.identifier
    p file_path.identifier.sub(".html.erb", ".md")

    file_path = file_path.identifier.sub(".html.erb", ".md")
    file = File.read(file_path)

    @name = "Kai"

    # Compiled with ERB
    result = ERB.new(file).result(binding)

    @content = Kramdown::Document.new(result, {input: "GFM"}).to_html
  end
end
