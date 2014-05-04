require 'bundler/setup'
require 'redcarpet'
require './renderer.rb'

@data = File.read(File.dirname(__FILE__) + "/text.md")

renderer = MyRenderer.new(with_toc_data: true, prettify: true)
markdown = Redcarpet::Markdown.new(renderer,
                                   autolink: false,
                                   space_after_headers: true,
                                   prettify: true,
                                   no_intra_emphasis: true,
                                   fenced_code_blocks: true,
                                   disable_indented_code_blocks: false,
                                   strikethrough: true,
                                   space_after_headers: true,
                                   superscript: true,
                                   underline: true,
                                   highlight: true,
                                   tables: true,
                                   quote: false,
                                   footnotes: true)

# Parse the Markdown and set the body attribute
@body = markdown.render(@data)

puts @body
