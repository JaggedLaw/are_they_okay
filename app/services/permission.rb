class Permission

  extend Forwardable
  attr_reader :user, :controller, :action

  def initialize(user, controller, action)
    @user = user || User.new
    @controller = controller
    @action = action
  end

  def allow?
    case
    when @user.admin?
      admin_permissions
    when @user.session_guest?
      session_guest_permissions
    else
      general_permissions
    end
  end

  private

    def user
      @user
    end

    def controller
      @controller
    end

    def action
      @action
    end

    def session_guest_permissions
      return true if controller == 'results' && action.in?(%w(index))
      return true if controller == 'surveys' && action.in?(%w(show))
      return true if controller == 'home' && action.in?(%w(index))
      return true if controller == 'sessions' && action.in?(%w(destroy))
      return true if controller == 'answers' && action.in?(%w(create new))
      return true if controller == 'episodes' && action.in?(%w(index show))
    end

    def general_permissions
      return true if controller == 'sessions' && action.in?(%w(create))
      return true if controller == 'surveys' && action.in?(%w(show))
      return true if controller == 'home' && action.in?(%w(index))
    end
end
