module QuestionsHelper
  def render_with_hashtags(body)
    body.gsub(Tag::REGEX){ |word| link_to word, hashtag_path("#{word.delete("#")}"), style: "text-decoration: none;"}.html_safe
  end
end
