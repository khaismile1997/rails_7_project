class Api::V1::ClientsController < Api::V1::BaseController
  before_action :set_client, only: [:update, :destroy]

  def index
    @clients = Client.all
    authorize Client
    render json: @clients, each_serializer: ClientSerializer
  end

  def create
    client = Client.new(client_params)
    authorize client
    raise ActiveRecord::RecordInvalid, client if client.invalid?
    client.save!
    render json: client, serializer: ClientSerializer
  end

  def update
    authorize @client
    raise ActiveRecord::RecordNotFound, I18n.t('errors.client.not_found') unless @client
    @client.update!(update_client_params)
    render json: @client, serializer: ClientSerializer
  end

  def destroy
    authorize @client
    raise ActiveRecord::RecordNotFound, I18n.t('errors.client.not_found') unless @client
    @client.destroy!
    head :no_content
  end

  private

  def set_client
    @client = Client.find_by_hashid(params[:id])
  end

  def client_params
    params.require(:client).permit(:email, :password, :password_confirmation, :payout_rate)
  end

  def update_client_params
    params.require(:client).permit(:password, :password_confirmation, :payout_rate)
  end
end
