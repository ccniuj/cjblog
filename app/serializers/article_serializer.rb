class ArticleSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :title,
             :text,
             :created_at
  def text
    case instance_options[:template]
    when 'articles'
      object.text.split("\n").first
    else
      object.text
    end
  end
end
