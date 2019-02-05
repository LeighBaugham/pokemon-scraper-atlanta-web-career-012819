require 'pry'
class Pokemon

  attr_reader :id, :name, :type, :db
  attr_accessor :hp

  def initialize(props={})
    @id = props[:id]
    @name = props[:name]
    @type = props[:type]
    @db = props[:db]
    @hp = props[:hp]
  end

  def self.save (name, type, db)
    db.execute("insert into pokemon (name, type) values
    ('#{name}','#{type}')")
  end

  def self.find(id, db)
    db.results_as_hash = true
    row = db.execute("select * from pokemon where id =#{id}").first
    Pokemon.new(id: row['id'], name: row['name'],
      type: row['type'], hp: row['hp'], db: db)
  end

  def alter_hp(hp_new, db)
    db.execute("UPDATE pokemon SET hp=#{hp_new} WHERE id=#{id}")
  end


end
