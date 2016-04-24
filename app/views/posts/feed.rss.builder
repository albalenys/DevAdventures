# encoding: UTF-8
# Reference: https://www.codingfish.com/blog/129-how-to-create-rss-feed-rails-4-3-steps

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "DevAdventures"
    xml.author "Abby De Los Santos"
    xml.description "Software Development"
    xml.link "http://www.albalenys.com/"
    xml.language "en"

    for post in @posts
      xml.item do
        xml.title post.title
        xml.author "Abby De Los Santos"
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link "http://www.albalenys.com/posts/#{post.id}"
        xml.guid post.id

        text = post.text

    # Optional: Insert image tags.
        if post.image.exists?
          image_url = post.image.url(:large)
          image_caption = post.image_caption
          image_align = ""
          image_tag = "<p><img src='" + image_url +  "' alt='" + image_caption + "' title='" + image_caption + "' align='" + image_align  + "' /></p>"
          text = text.sub('{image}', image_tag)
        end

        xml.description "<p>" + text + "</p>"
      end
    end
  end
end