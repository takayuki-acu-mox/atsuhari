class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '消化器' },
    { id: 3, name: '循環器' },
    { id: 4, name: '内分泌' },
    { id: 5, name: '呼吸器' },
    { id: 6, name: '免疫' },
    { id: 7, name: '脳・神経' },
    { id: 8, name: '泌尿器' },
    { id: 9, name: '運動器' },
    { id: 10, name: '耳鼻咽喉科' },
    { id: 11, name: '眼科' },
    { id: 12, name: '精神科' },
    { id: 13, name: '婦人科' },
    { id: 14, name: '小児科' },
    { id: 15, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :therapies

  end