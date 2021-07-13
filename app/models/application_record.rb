# frozen_string_literal: true

require 'activerecord-import'

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
