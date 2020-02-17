# frozen_string_literal: true

module FixturesHelper
  def private_key_path
    File.expand_path(File.join('fixtures', 'private_key.p8'), __dir__)
  end

  def key_id
    'M3225B466N'
  end

  def issuer_id
    '69a6de70-03db-47e3-e053-5b8c7c11a4d1'
  end
end
