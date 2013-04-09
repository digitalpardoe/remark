module BlogHelper  
  def pagination(collection)
    if collection.total_pages > 1
      content_tag :div, :id => 'pagination' do
        "".tap do |links|
          links << link_to("&larr; Previous".html_safe, paginate_path(:page => collection.previous_page)) unless collection.previous_page == nil
          links << " | " unless links.empty? || collection.next_page == nil
          links << link_to("Next &rarr;".html_safe, paginate_path(:page => collection.next_page)) unless collection.next_page == nil
        end.html_safe
      end
    end
  end
  
  def link_post_master(article)
    "<p><a href=\"#{article_path(article)}\">&bull;</a></p>".html_safe
  end
end
