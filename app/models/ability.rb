# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :access, :rails_admin
      can :manage, :all
    end

    if user.member?
      can :read, :all
    end
  end
end
