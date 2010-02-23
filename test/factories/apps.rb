Factory.define :app do |app|
  app.name                      "Nezumi"
  app.subdomain                 "nezumi"
  app.subtitle                  "Awesome app"
  app.description               "Do you use Heroku for your Ruby application hosting? \n\nDo you wish you had an app to manage things on the go? \n\nWish no more...\n\n* Add Collaborators \n* Turn Up/Down Dynos and Workers \n* Flip On/Off Maintenance Mode \n* Manage Your Server Configs \n* Execute Rake and Console Tasks \n* Restart Your Heroku Application"
  app.author                    "Marshall Huss"
  app.google_analytics_id       "UI-12345678"
  app.itunes_url                "http://itunes.apple.com/us/app/nezumi/id346715875?mt=8&uo=4"
  app.small_artwork_url         "http://a1.phobos.apple.com/us/r1000/017/Purple/8e/41/29/mzl.lhtyvujk.png"
  app.screenshots               ["http://a1.phobos.apple.com/us/r1000/014/Purple/45/f4/6d/mzl.xhiptjuy.png", "http://a1.phobos.apple.com/us/r1000/027/Purple/70/67/83/mzl.wyewjmxu.png", "http://a1.phobos.apple.com/us/r1000/030/Purple/21/79/65/mzl.hyznprby.png", "http://a1.phobos.apple.com/us/r1000/047/Purple/e1/0c/62/mzl.fhemcepk.png"]
  app.large_artwork_url         "http://a1.phobos.apple.com/us/r1000/009/Purple/63/ca/17/mzl.torsskza.png"
  app.itunes_id                 "346715875"
  app.theme_name                "White"
  
  #app.domains          {}
  #app.user            { |b| b.association(:email_confirmed_user) }  
end