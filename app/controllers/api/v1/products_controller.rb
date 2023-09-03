class Api::V1::ProductsController < Api::V1::BaseController
  before_action :set_brand, :authenticate_user_or_client!
  before_action :set_product, only: [:show, :update, :destroy]

  def index
    raise ActiveRecord::RecordNotFound, I18n.t('errors.brand.not_found') unless @brand
    products = @brand.products
    render json: products, each_serializer: ProductSerializer
  end

  def show
    raise ActiveRecord::RecordNotFound, I18n.t('errors.product.not_found') unless @product
    render json: @product, serializer: ProductSerializer
  end

  def create
    raise ActiveRecord::RecordNotFound, I18n.t('errors.brand.not_found') unless @brand
    product = @brand.products.new(product_params)
    raise ActiveRecord::RecordInvalid, product if product.invalid?
    product.save!
    render json: product, serializer: ProductSerializer
  end

  def update
    raise ActiveRecord::RecordNotFound, I18n.t('errors.product.not_found') unless @product
    @product.update!(product_params)
    render json: @product, serializer: ProductSerializer
  end

  def destroy
    raise ActiveRecord::RecordNotFound, I18n.t('errors.product.not_found') unless @product
    @product.destroy
    head :no_content
  end

  private

  def set_brand
    @brand = Brand.find(params[:brand_id])
  end

  def set_product
    @product = @brand.products.find(params[:id])
  end

  def product_params
    params.require(:product).permit(
      :name, :description, :material, :size_options, :color_options, :care_instructions,
      :price_cents, :price_currency, :state
    ).tap do |whitelisted|
      whitelisted[:price] = Money.new(whitelisted[:price_cents].to_i, whitelisted[:price_currency])
    end
  end
end
