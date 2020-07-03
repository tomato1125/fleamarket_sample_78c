class ProductType < ActiveHash::Base
  self.data = [
    {id: 0, name: '選択してください'},
    {id: 1, name: 'レディース'},
    {id: 2, name: 'メンズ'},
    {id: 3, name: 'キッズ'},
  ]
end