require 'time'
require File.dirname(__FILE__) + '/entity'

module WpxmlParser
  class Comment < Entity
    def initialize(entity, post)
      super(entity)
      @post = post
    end
    
    def self.method_element_map
      { :comment_id => 'wp:comment_id',
        :author     => 'wp:comment_author',
        :email      => 'wp:comment_author_email',
        :url        => 'wp:comment_author_url',
        :ip         => 'wp:comment_author_ip',
        :date       => 'wp:comment_date',
        :date_gmt   => 'wp:comment_date_gmt',
        :body       => 'wp:comment_content',
        :approved   => 'wp:comment_approved',
        :parent_id  => 'wp:comment_parent' }
    end

    def parent
      @post.comments.find{|c| c.comment_id == parent_id }
    end

    def children
      @post.comments.select{|c| c.parent_id == comment_id}
    end

    def approved?
      approved == '1'
    end

    def process_comment_id(comment_id)
      comment_id.to_i
    end
    
    def process_parent_id(parent_id)
      parent_id.to_i
    end

    def process_comment_id(comment_id)
      comment_id.to_i
    end

    def process_date(date)
      Time.parse(date)
    end

    def process_date_gmt(date)
      Time.parse(date)
    end
  end
end