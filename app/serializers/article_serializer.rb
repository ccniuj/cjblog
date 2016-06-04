class ArticleSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :text,
             :created_at
  def text
    case instance_options[:template]
    when 'articles'
      object.text.split("\n").first
    when 'article'
      object.text
    else
    end
  end
end
