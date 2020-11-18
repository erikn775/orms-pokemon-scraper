class Pokemon

    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
            sql = <<-SQL
            INSERT INTO pokemon (name, type) VALUES (?, ?)
            SQL

            db.execute(sql, name, type)
            
    end

    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = ?"
        result = db.execute(sql, id)[0]
        self.new(id: result[0], type: result[2], name: result[1], db: db) 
    end
end
