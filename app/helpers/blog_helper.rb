module BlogHelper
  def disqus(article)
    "".tap do |code|
      code << "<div id=\"disqus_thread\"></div>"
      code << "<script type=\"text/javascript\">"
      code << "var disqus_shortname = '#{Setting.application.value(:disqus_shortname)}';"
      code << "var disqus_identifier = '#{article.uuid}';"
      code << "var disqus_url = '#{article_url(article)}';"
      code << "var disqus_developer = #{Rails.env == 'production' ? "0" : "1"};"
      code << "(function() {"
      code << "var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;"
      code << "dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';"
      code << "(document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);"
      code << "})();"
      code << "</script>"
      code << "<noscript>Please enable JavaScript to view the <a href=\"http://disqus.com/?ref_noscript\">comments powered by Disqus.</a></noscript>"
    end.html_safe unless Setting.application.value(:disqus_shortname).blank?    
  end
end
