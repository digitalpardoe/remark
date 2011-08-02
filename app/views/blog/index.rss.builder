xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "#{name} RSS Feed"
    xml.description subtitle
    xml.link Setting.application.value(:url)

    for article in @articles
      xml.item do
        xml.title article.title
        xml.description text_filter(article, :body)
        xml.pubDate article.published_at.to_s(:rfc822)
        xml.link article_url(article)
        xml.author article.user.username
        xml.guid article.uuid, :isPermaLink => false
        for tag in article.tags
          xml.category tag.name
        end
      end
    end
  end
end
