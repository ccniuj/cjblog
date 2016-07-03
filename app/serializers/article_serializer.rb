class ArticleSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :title,
             :text,
             :tags,
             :is_presented,
             :created_at
  def text
    case instance_options[:template]
    when 'articles'
      object.text.split("\n").first
    else
      object.text
    end
  end

  def tags
    object.tags.map do |tag|
      TagSerializer.new tag
    end
  end
end
