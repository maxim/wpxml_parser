require 'nokogiri'
require File.dirname(__FILE__) + '/post'

module WpxmlParser
  class Blog
    def initialize(xml_filename)
      File.open(xml_filename) do |xml_file|
        @xml = Nokogiri::XML(xml_file)
      end
    end
    
    def posts
      @xml.xpath('//item').map do |item|
        Post.new(item)
      end.select{|p| p.post_type == 'post' && p.status == 'publish'}
    end

    def find_post(post_id)
      posts.find{|p| p.post_id == post_id}
    end

    def attachments
      @xml.xpath('//item').map do |item|
        Post.new(item)
      end.select{|p| p.post_type == 'attachment'}
    end
  end
end