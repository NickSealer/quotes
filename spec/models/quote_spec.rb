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
require 'rails_helper'

RSpec.describe Quote, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
