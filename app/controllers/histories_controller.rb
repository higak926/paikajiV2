class HistoriesController < ApplicationController
  def index
    @histories = History.all.order(:id)
  end
end
