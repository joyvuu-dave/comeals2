# == Schema Information
#
# Table name: guests
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  multiplier :integer          default(2), not null
#  host_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_guests_on_host_id  (host_id)
#  index_guests_on_name     (name) UNIQUE
#

require 'spec_helper'

describe Guest do
  pending "add some examples to (or delete) #{__FILE__}"
end
