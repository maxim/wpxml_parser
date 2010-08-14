wpxml_parser
============

WordPress (version 3.x and I think there's a plugin for 2.x) can export xml with all your blog posts, comments, etc. This tool can parse the xml file and give you a convenient access to all your posts, comments, categories, etc in a ruby script that _you have to write_.

The cool thing is — you don't even need to have access to your own WordPress database, all you need is to download the xml file from your admin panel.

### Let me demonstrate

    require 'wpxml_parser'
    include WpxmlParser
    
    # Blog
    blog = Blog.new('dump_of_your_blog.xml')
    blog.posts.size # => 51
    post = blog.posts.first # => <Post>
    
    # Post
    post.title # => "Title of your post"
    post.categories # => ["ruby", "rails"]
    post.date # => <Time>
    post.slug # => "title-of-your-post"
    post.body # => "...shitload of text..."
    post.post_id # => 27
    
    # Comments
    post.comments # => [<Comment>, <Comment>, ...]
    comment = post.comments.first
    
    comment.author # => 'dude'
    comment.date # => <Time>
    
    # Comments have parent and children
    comment.parent_id # => 32
    comment.parent # => <Comment>
    comment.children # => [<Comment>, <Comment>]

    # Conveniences
    # You can quickly find a post or a comment by post_id or comment_id respectively
    blog.find_post(27) # => <Post>
    post.find_comment(32) # => <Comment>
    
    # For more info and more accessible properties check out the source code, it's pretty straightforward.

### A note on posts

Currently only published posts are included. Drafts, private, etc are skipped. This was done on purpose, since I didn't really use those wordpress features.

### A note on comments

Currently only approved comments are included. This was done on purpose, since I didn't need spam.