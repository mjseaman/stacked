# == Schema Information
#
# Table name: cards
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  twitter_handle :string(255)
#  slug           :string(255)      not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Card < ActiveRecord::Base
	extend FriendlyId	
	friendly_id :name, :use => :slugged

  attr_accessible :name, :twitter_handle

  # before_create :create_slug

  # may remove twitter_handle validation once we auth more users
  validates_presence_of :name, :twitter_handle
  has_many :board_cards
  has_many :boards, through: :board_cards

  private

  # def create_slug
  # 	# IMPLEMENT ME!
  # 	slug = name.downcase 
  # 	howmany = Card.where("slug LIKE ?%", slug).count
  # 	if howmany > 0

		# else 
		# 	self.slug = slug + 1 
		# end
  # end

end

