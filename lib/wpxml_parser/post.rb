require File.dirname(__FILE__) + '/entity'
require File.dirname(__FILE__) + '/comment'

module WpxmlParser
  class Post < Entity
    def self.method_element_map
      { :title     => 'title',
        :link      => 'link',
        :date      => 'pubDate',
        :author    => 'dc:creator',
        :body      => 'content:encoded',
        :post_id   => 'wp:post_id',
        :slug      => 'wp:post_name',
        :status    => 'wp:status',
        :post_type => 'wp:post_type' }
    end

    def categories
      @entity.xpath('category').map(&:content).uniq
    end
  
    def comments
      @entity.xpath('wp:comment').map do |comment|
        Comment.new(comment, self)
      end.select(&:approved?)
    end
    
    def find_comment(comment_id)
      comments.find{|c| c.comment_id == comment_id}
    end
    
    def process_date(date)
      Time.parse(date)
    end

    def process_post_id(post_id)
      post_id.to_i
    end
  end
end