require "uri"

module Hanami
  module CLI
    module Commands
      module DB
        module Utils
          class DatabaseConfig
<<<<<<< HEAD
            attr_reader :uri

            def initialize(database_url)
              @uri = URI(database_url)
            end

            def hostname
              uri.hostname
            end
            alias_method :host, :hostname

            def user
              uri.user
            end
            alias_method :username, :user

            def password
              uri.password
            end
            alias_method :pass, :password

            def port
              uri.port
            end

            def db_name
              @db_name ||= uri.path.gsub(/\A\//, "")
            end

            def db_type
              uri.scheme
=======
            def self.for_application(application)
              new(application.settings.database_url)
            end

            attr_reader :url

            def initialize(database_url)
              @url = database_url
            end

            def uri
              @uri ||= URI.parse(url)
            end

            def hostname
              uri.hostname
            end

            def db_name
              @db_name ||= uri.path.gsub(/^\//, '')
            end

            def cli_env_vars
              @cli_env_vars ||= {}.tap do |vars|
                vars["PGHOST"] = uri.host.to_s
                vars["PGPORT"] = uri.port.to_s if uri.port
                vars["PGUSER"] = uri.user.to_s if uri.user
                vars["PGPASSWORD"] = uri.password.to_s if uri.password
              end
>>>>>>> bae390b ([wip] start updating CLI)
            end
          end
        end
      end
    end
  end
end
