class HistoriesController < ApplicationController
  before_action :detect_devise_variant

  def index
    @histories = History.all.order(:id)
  end

  private
  def detect_devise_variant
      case request.user_agent
      when /iPad/
          request.variant = :mobile
      when /iPhone/
          request.variant = :mobile
      when /Android/
          request.variant = :mobile
      end
  end
end
