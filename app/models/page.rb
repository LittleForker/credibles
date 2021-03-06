class Page
  include Mongoid::Document
  include Mongoid::Timestamps

  references_many :edits
  referenced_in :account

  index :account_id
  field :key
  key :account_id, :key

  field :url
  field :meta, :type => Hash, :default => {}


  def self.find_or_create(account, key, url)
    p = account.pages.new(:key => key, :url => url)

    p.save if (p1 = where(:_id => p.id).first).nil?

    p1 || p
  end
end
