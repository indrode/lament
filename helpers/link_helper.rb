def left_nav_link(page)
  if page.nil? || page.empty?
    link_label, link_href = "view all articles", "archives"
  else
    link_label, link_href = "next article", page
  end
  "<a id=\"next_article_link\" href=\"/#{link_href}\">&larr; #{link_label}</a>"
end

def right_nav_link(page)
  "<a id=\"previous_article_link\" href=\"/#{page}\">previous article &rarr;</a>"
end

def email_link
  %Q(<a href="mailto:indro@lamentingrobot.com">indro (at) lamentingrobot (dot) com</a>)
end