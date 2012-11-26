Factory.define :document do |d|
  d.name "Ruby on rails book"
  d.file File.new(Rails.root.join('spec', 'fixtures', 'ruby_on_rails_book.xml'))
end