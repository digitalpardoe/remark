xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "#{setting(:name)} RSS Feed"
    xml.description setting(:subtitle)
    xml.link setting(:url)

    for article in @articles
      xml.item do
        xml.title article.title
        if (article.url.blank?)
          xml.description text_filter(article, :body)
        else
          xml.description text_filter(article, :excerpt) + "<p><a href=\"#{article_path(article)}\">&bull;</a></p>".html_safe
        end
        xml.pubDate article.published_at.to_s(:rfc822)
        if (article.url.blank?)
          xml.link article_url(article)
        else
          xml.link article.url
        end
        xml.author article.user.username
        xml.guid article.uuid, :isPermaLink => false
        for tag in article.tags
          xml.category tag.name
        end
      end
    end
  end
end
