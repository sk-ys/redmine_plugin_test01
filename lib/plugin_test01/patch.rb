module RedminePlugin01
  module Plugin01Patch
    module PrependMethods
      def user_setup
        user_setup_with_envauth
        super
      end
    end

    def self.install
      ApplicationController.class_eval do
        def user_setup_with_envauth
          logger.info '--- test01 patch ---'
        end

        if self.respond_to?(:alias_method_chain) # Rails < 5
          alias_method_chain :user_setup, :envauth
        else # Rails >= 5
          alias_method :user_setup_without_envauth, :user_setup
          prepend PrependMethods
        end
      end
    end
  end
end
