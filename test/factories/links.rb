Factory.sequence :position do |n|
  n
end


Factory.define :link do |link|
  link.title                "Twitter"
  link.url                  "http://twitter.com/appmarkit"
  link.position             Factory.next(:position)
end