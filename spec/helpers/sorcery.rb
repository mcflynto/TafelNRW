module Sorcery
  module TestHelpers
    module Rails
      def login_user(user = nil, password = 'secret')
        visit new_session_url

        fill_in 'session_email', with: user.email
        fill_in 'session_password', with: password

        click_button "login"

        # TODO Nachricht
      end

      def logout_user
        click_link "logout"
      end
    end
  end
end
