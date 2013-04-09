xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "#{setting(:name)} RSS Feed"
    xml.description setting(:subtitle)
    xml.link setting(:url)

    for article in @articles
      xml.item do
        xml.title article.title
        xml.description article.link_post? ? text_filter(article, :excerpt) + link_post_master(article) : text_filter(article, :body)
        xml.pubDate article.published_at.to_s(:rfc822)
        xml.link article.link_post? ? article.url : article_url(article)
        xml.author article.user.username
        xml.guid article.uuid, :isPermaLink => false
        for tag in article.tags
          xml.category tag.name
        end
      end
    end
  end
end
