class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user: user)
    end

    # Why I don't have to say true here? how do I make sure you only see the bookings of the user you are
    # booking.where(user = user_id)
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    where(user: user)
  end

  def destroy?
    where(user: user)
  end

end
