class Api::V1::BrandsController < Api::V1::BaseController
  skip_before_action :authenticate_user!, :only => [:index]

  def index
    @brands = Brand.all
    render json: @brands, each_serializer: BrandSerializer
  end

  def create
    brand = Brand.new(brand_params)
    raise ActiveRecord::RecordInvalid, brand if brand.invalid?
    brand.save!
    render json: brand, serializer: BrandSerializer
  end

  def update
    brand = Brand.find_by_hashid(params[:id])
    raise ActiveRecord::RecordNotFound, I18n.t('errors.brand.not_found') unless brand
    brand.update!(brand_params)
    render json: brand, serializer: BrandSerializer
  end

  def destroy
    brand = Brand.find_by_hashid(params[:id])
    raise ActiveRecord::RecordNotFound, I18n.t('errors.brand.not_found') unless brand
    brand.destroy!
    head :no_content
  end

  private

  def brand_params
    params.require(:brand).permit(
      :name, :logo, :website_url, :founded_year, :primary_contact,
      social_media_links: [:platform, :link], :state
    )
  end
end
