class ItunesStore
  include HTTParty
  format :json
  
  def self.find_app(term)
    res = get('http://ax.phobos.apple.com.edgesuite.net/WebObjects/MZStoreServices.woa/wa/wsSearch?parameterkeyvalue', :query => { :media => 'software', :term => term})
    res['results'].collect { |app| app.to_struct("ItunesApp") }
  end
  
end