class ItunesStore
  include HTTParty
  format :json
  
  def self.find_apps(term)
    res = get('http://ax.phobos.apple.com.edgesuite.net/WebObjects/MZStoreServices.woa/wa/wsSearch?parameterkeyvalue', :query => { :media => 'software', :term => term })
    res['results'].collect { |app| app.to_struct("ItunesApp") }
  end
  
  def self.find_app(id)
    res = get('http://ax.phobos.apple.com.edgesuite.net/WebObjects/MZStoreServices.woa/wa/wsLookup', :query => { :id => id })
    res['results'].collect { |app| app.to_struct("ItunesApp") }
  end

end