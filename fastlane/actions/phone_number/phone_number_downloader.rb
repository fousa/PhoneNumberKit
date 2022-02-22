require 'bundler'
Bundler.require

module PhoneNumber
    class Downloader
        BASE_URL = 'https://raw.githubusercontent.com'
        PATH = '/google/libphonenumber/master/resources/PhoneNumberMetadata.xml'

        def download_metadata
            connection = Faraday.new url: BASE_URL
            response = connection.get PATH
            raise '🔥 There was a problem downloading the metadata xml.' if response.status >= 400
            response.body
        end
    end
end
