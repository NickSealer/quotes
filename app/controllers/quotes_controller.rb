# frozen_string_literal: true

class QuotesController < ApplicationController
  before_action :quote, only: %i[show edit update destroy]

  def index
    @quotes ||= Quote.order(id: :desc)
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params)

    if @quote.save
      respond_to do |format|
        format.turbo_stream { flash.now[:notice] = "Quote #{@quote.id} created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @quote.update(quote_params)
      respond_to do |format|
        format.turbo_stream { flash.now[:notice] = "Quote #{@quote.id} updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    quote.destroy

    respond_to do |format|
      format.turbo_stream { flash.now[:notice] = "Quote #{quote.id} deleted." }
    end
  end

  private

  def quote
    @quote ||= Quote.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:content, :author)
  end
end
