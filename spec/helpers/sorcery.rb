module Sorcery
  module TestHelpers
    module Rails
      def login_user_post(user, password)
        page.driver.post(sessions_url, { session: { username: user, password: password } } )
      end
    end
  end
end
