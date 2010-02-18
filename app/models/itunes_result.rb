class ItunesResult
  include HTTParty
  format :json
  
  def self.find_by_term(term)
    res = get('http://ax.phobos.apple.com.edgesuite.net/WebObjects/MZStoreServices.woa/wa/wsSearch?parameterkeyvalue', :query => { :media => 'software', :term => term})
    res['results']
  end
  
end