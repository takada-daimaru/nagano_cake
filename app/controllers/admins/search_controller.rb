class Admins::SearchController < ApplicationController
  def search
    @model = params["search"]["model"]
    @content = params["search"]["content"]
    @how = params["search"]["how"]
    @datas = search_for(@how, @model, @content)
  end


  private

  # どのモデルを検索するか
  def match(model, content)
    if model == "customer"
      Customer.where(first_name: content)
    elsif model == "item"
      Item.where(name: content)
    elsif model == "type"
      Item.where(name: content)
    end
  end

  # 前方一致
  def forward(model, content)
    if model == "customer"
      Customer.where("first_name LIKE ?", "#{content}%")
    elsif model == "item"
      Item.where("name LIKE ?", "#{content}%")
    elsif model == "type"
      Item.where("name LIKE ?", "#{content}%")
    end
  end

  # 後方一致
  def backward(model, content)
    if model == "customer"
      Customer.where("first_name LIKE ?", "%#{content}")
    elsif model == "item"
      Item.where("name LIKE ?", "%#{content}")
    elsif model == "type"
      Item.where("name LIKE ?", "%#{content}")
    end
  end

  # 完全一致
  def partical(model, content)
    if model == "customer"
      Customer.Where("first_name LIKE ?", "%#{content}%")
    elsif model == "item"
      Item.where("name LIKE ?", "%#{content}%")
    elsif model == "type"
      Item.where("name LIKE ?", "%#{content}%")
    end
  end

  
  def search_for(how, model, content)
    case how
    when "match"
      match(model, content)
    when "forward"
      forward(model, content)
    when "backward"
      backward(model, content)
    when "partical"
      partical(model, content)
    end
  end
end
