require "uri"

module Hanami
  class CLI
    module Application
      module Commands
        module DB
          module Utils
            class DatabaseConfig
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
              end
            end
          end
        end
      end
    end
  end
end
