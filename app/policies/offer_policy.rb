class OfferPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all # is what you passed to resolve()
    end
  end

  def show?
    true
  end
  
  def create?
    #current_user = user
    user.user_type == "owner"
  end

  # def update?
  #   user.user_type == "renter"
  # end

  def update?
    user.user_type == "owner"
  end

  def destroy?
    user.user_type == "owner"
  end
end
