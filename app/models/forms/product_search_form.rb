class Forms::ProductSearchForm
  include ActiveModel::Validations
  include ActiveModel::Validations::Callbacks
  include ActiveModel::Conversion
  include ActiveModel::AttributeMethods

  attr_accessor :name, :price_from, :price_to

  def initialize(attributes = {})
    if attributes
      attributes.each do |name, value|
        send("#{name}=", value) rescue nil
      end
    end
  end

  def search
    # idの降順
    scope = Product.order("id desc")

    # 商品名での検索
    if @name.present?
      scope = scope.where("name LIKE ?", "%#{@name}%")
    end
    # 商品価格下限での検索
    if @price_from.present?
      scope = scope.where("price >= :price_from", {price_from: @price_from})
    end
    # 商品価格上限での検索
    if @price_to.present?
      scope = scope.where("price <= :price_to", {price_to: @price_to})
    end
    return scope
  end
end
