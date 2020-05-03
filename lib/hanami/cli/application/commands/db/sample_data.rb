# frozen_string_literal: true

require "hanami/cli/application/command"
require_relative "structure/dump"

module Hanami
  class CLI
    module Application
      module Commands
        module DB
          class SampleData < Command
            desc "Load sample data"

            def call(**)
              if has_file?
                measure "Sample data loaded" do
                  application.boot
                  load file_path
                end
              else
                out.puts "=> no sample data available"
              end
            end

            private

            def file_path
              File.join(application.root, "db/sample_data.rb")
            end

            def has_file?
              File.exist?(file_path)
            end
          end
        end

        register "db sample_data", DB::SampleData
      end
    end
  end
end
