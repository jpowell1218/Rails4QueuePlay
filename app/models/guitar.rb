class Guitar < ActiveRecord::Base
  attr_accessible :model, :year

  def register
    self.save && search_guitar_reviews
  end

  def to_s
    self-model + self.year.to_s
  end

  private
    
    def search_guitar_reviews

    end
end
