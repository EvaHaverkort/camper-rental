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
    # current_user = user
    return false if user.nil?

    user.user_type == "owner"
  end

  # def update?
  #   user.user_type == "renter"
  # end

  def update?
    return false if user.nil?
    user.user_type == "owner"
    # where(user: user)
  end

  def destroy?
    user.user_type == "owner"
    # where(user: user)
  end
end
