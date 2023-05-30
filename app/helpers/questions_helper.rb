module QuestionsHelper
  def text_with_hashtags(text)
    simple_format strip_tags(text).gsub(Tag::REGEX) { |word| link_to word, hashtag_path(word.delete("#")), class: "hashtag-link" }
  end
end
