require_relative './phone_number/phone_number_downloader.rb'

module Fastlane
    module Actions
      class UpdatePhoneMetadataAction < Action
        DIRECTORY = 'PhoneNumberKit/Resources'

        def self.run params            
            # Download the json from Github
            UI.message '☎️  Downloading metadata from Github.'
            downloader = PhoneNumber::Downloader.new
            xml_contents = downloader.download_metadata

            UI.message '☎️  Converting the xml to json.'
            # Write the downloaded file to disk.
            File.write "#{DIRECTORY}/Original/PhoneNumberMetadata.xml", xml_contents
            # Convert to xml to json.
            sh "cd #{DIRECTORY}; ./update.sh"
        end

        def self.description
            'Update `PhoneNumberKit` to use the latest version of the metadata'
        end
  
        def self.authors
            ['Jelle Vandebeeck']
        end
  
        def self.details
          'update_phone_metadata'
        end
  
        def self.available_options
            []
        end
  
        def self.return_value
        end
  
        def self.is_supported? platform
            platform == :ios
        end
      end
    end
  end
  