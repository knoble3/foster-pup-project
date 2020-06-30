class RequestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
    def new?
        user
    end

    def create?
      return true
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
end
