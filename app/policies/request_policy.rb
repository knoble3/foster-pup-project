class RequestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def new?
    record.dog.user != user
  end

  def create?
    record.dog.user != user
  end

  def edit?
    record.user == user
  end

  def show?
    # record.user == user
    record.dog.user == user || record.user == user
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def accept?
    record.dog.user == user && record.status == 'pending'
  end

    def reject?
    record.dog.user == user && record.status == 'pending'
  end
end
