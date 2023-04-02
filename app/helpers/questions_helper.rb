module QuestionsHelper
  def render_with_hashtags(body)
    body.gsub(/#[[:word:]]+/){ |word| link_to word, "/questions/hashtag/#{word.delete("#")}", style: "text-decoration: none;"}.html_safe
  end
end
