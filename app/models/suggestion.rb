class Suggestion < ActiveRecord::Base
  belongs_to :author, :class_name => "User"
  belongs_to :proposal

  scope :by, lambda { |user| where(:author_id => user) }
  scope :latest, order('updated_at DESC')
  scope :after, lambda { |timestamp| where('updated_at > ?', timestamp) }

  scope :not_on_proposals_by, lambda { |user|
    joins(:proposal).merge(Proposal.not_proposed_by(user))
  }

  validates :body, :presence => true
  validate :is_a_meaningful_contribution

  after_create :update_scores

  private

  def is_a_meaningful_contribution
    if %w(+1 -1).include?(body.strip)
      errors["body"] << "should contain some concrete suggestions about how to develop this proposal"
    elsif body.length < 50
      errors["body"] << "should be a meaningful contribution or criticism (i.e. at least 50 characters)"
    end
  end

  def update_scores
    author.save
    proposal.proposer.save
  end
end
