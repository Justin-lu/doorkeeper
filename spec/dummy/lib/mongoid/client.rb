class Client
  include Mongoid::Document
  include Mongoid::Timestamps

  doorkeeper_client!

  field :name
  field :uid
  field :secret
  field :redirect_uri

  attr_accessible :name, :redirect_uri

  # Indexes are properly generated by model generator
  if Doorkeeper.configuration.orm == :mongoid2
    index :uid, :unique => true
  else
    index({ uid: 1 }, { unique: true })
  end
end