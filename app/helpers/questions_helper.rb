module QuestionsHelper
  def render_with_hashtags(body)
    sanitize(body.gsub(Tag::REGEX) { |word| link_to word, hashtag_path(word.delete("#")), class: "hashtag-link" })
  end
end
