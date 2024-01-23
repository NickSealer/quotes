# frozen_string_literal: true

# == Schema Information
#
# Table name: quotes
#
#  id         :bigint           not null, primary key
#  author     :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Quote < ApplicationRecord
  after_save :broadcast_quotes_count
  after_destroy :broadcast_quotes_count

  validates :content, :author, presence: true

  def broadcast_quotes_count
    broadcast_replace_to(
      :quotes_count,
      target: 'quotes-count',
      html: "<div id='quotes-count'><h1>All my Quotes (#{Quote.count})</h1></div>"
    )
  end
end
