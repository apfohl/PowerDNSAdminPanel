class Api::V1::RecordsController < ApplicationController
  before_action :set_domain
  before_action :set_record, only: [:show, :update, :destroy]

  def index
    @records = @domain.records.all
    render json: @records
  end

  def show
    render json: @record
  end

  def create
    @record = Record.new(record_params)
    @record.domain = @domain
    if @record.save
      render json: @record, status: :created
    else
      render nothing: true, status: :unprocessable_entity
    end
  end

  def update
    if @record.update(record_params)
      render json: @record, status: :ok
    else
      render nothing: true, status: :unprocessable_entity
    end
  end

  def destroy
    @record.destroy
    render nothing: true, status: :ok
  end

  private
    def set_domain
      begin
        @domain = Domain.find(params[:domain_id])
      rescue ActiveRecord::RecordNotFound
        render nothing: true, status: :not_found
      end
    end

    def set_record
      begin
        @record = @domain.records.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render nothing: true, status: :not_found
      end
    end

    def record_params
      params.require(:record).permit(:name, :type, :content, :ttl, :prio, :disabled)
    end
end
