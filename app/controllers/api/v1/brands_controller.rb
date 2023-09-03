class Api::V1::BrandsController < Api::V1::BaseController
  def index
    @brands = Brand.all
    authorize Brand
    render json: @brands, each_serializer: BrandSerializer
  end

  def create
    brand = Brand.new(brand_params)
    authorize brand
    raise ActiveRecord::RecordInvalid, brand if brand.invalid?
    brand.save!
    render json: brand, serializer: BrandSerializer
  end

  def update
    brand = Brand.find_by_hashid(params[:id])
    authorize brand
    raise ActiveRecord::RecordNotFound, I18n.t('errors.brand.not_found') unless brand
    brand.update!(brand_params)
    render json: brand, serializer: BrandSerializer
  end

  def destroy
    brand = Brand.find_by_hashid(params[:id])
    authorize brand
    raise ActiveRecord::RecordNotFound, I18n.t('errors.brand.not_found') unless brand
    brand.destroy!
    head :no_content
  end

  private

  def brand_params
    params.require(:brand).permit(
      :name, :logo, :website_url, :founded_year, :primary_contact, :state,
      social_media_links: [:platform, :link]
    )
  end
end
