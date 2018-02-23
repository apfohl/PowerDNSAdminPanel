# frozen_string_literal: true

module Api
  module V1

    # DomainsController class
    class DomainsController < ApplicationController
      before_action :authenticate
      before_action :set_domain, only: %i[show update destroy]

      def index
        @domains = Domain.all
        render json: @domains
      end

      def show
        render json: @domain
      end

      def create
        @domain = Domain.new(domain_params)
        if @domain.save
          render json: @domain, status: :created
        else
          render nothing: true, status: :unprocessable_entity
        end
      end

      def update
        if @domain.update(domain_params)
          render json: @domain, status: :ok
        else
          render nothing: true, status: :unprocessable_entity
        end
      end

      def destroy
        @domain.destroy
        render nothing: true, status: :ok
      end

      private

      def set_domain
        @domain = Domain.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render nothing: true, status: :not_found
      end

      def domain_params
        params.require(:domain).permit(:name, :master, :type)
      end
    end
  end
end