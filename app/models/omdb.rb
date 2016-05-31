# require 'httparty'
# class Omdb
#     include HTTParty
#     base_uri "https://www.omdbapi.com"
#
#     def initialize(service, page)
#       @options = {query: {site: service}}
#     end
#
#     def titles
#       self.class.get('/?t=', 'whatever')
#     end
#
#     omdb = Omdb.new('omdb', 1)
#     puts omdb.titles
# end
