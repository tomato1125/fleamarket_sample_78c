class Brand < ActiveHash::Base
  self.data = [
      {id: 1, name: '三菱電機'}, {id: 2, name: 'パナソニック'}, {id: 3, name: 'LG'},
      {id: 4, name: 'SONY'} 
  ]
end