Food.create([{ name: 'クロワッサン', price: '250',category_id: '1',image:'クロワッサン.jpg',shop_id: '1' }, 
  { name: '食パン', price: '200',category_id: '1',image:'食パン.jpg' ,shop_id: '1'},
  { name: 'メロンパン', price: '220',category_id: '1',image:'メロンパン.jpg' ,shop_id: '1'},
  { name: 'サンドイッチ', price: '300',category_id: '1',image:'サンドイッチ.jpg',shop_id: '1' },
  { name: 'あんぱん', price: '200',category_id: '1',image:'あんぱん.jpg',shop_id: '1' },
  { name: 'バゲット', price: '200',category_id: '1' ,image:'バゲット.jpg',shop_id: '1'},
  { name: 'カレーパン', price: '300',category_id: '1' ,image:'カレーパン.jpg',shop_id: '2'},
  { name: 'BLTサンド', price: '300',category_id: '1' ,image:'BLTサンド.jpeg',shop_id: '2'},
  { name: 'コーヒーパン', price: '300',category_id: '1' ,image:'コーヒーパン.jpg',shop_id: '3'},
  ])

Shop.create([{ name: 'ベーカリー', address: '東京都港区南麻布１丁目',telephone: '08012345678',image: 'ベーカリー.jpg' }, 
  { name: 'サンモリッツ', address: '東京都港区南麻布３丁目',telephone: '08012344321',image: 'サンモリッツ.jpg' },
  { name: 'テラコーヒー', address: '横浜市神奈川区白楽129番地',telephone: '045-309-8686',image: 'テラコーヒー.jpg' }])