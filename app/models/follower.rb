class Follower

    attr_reader :name, :age, :life_motto
    
    @@all = []

    def initialize name, age, life_motto
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def self.all
        @@all
    end

    def self.of_a_certain_age age
        all.filter do |follower|
            follower.age >= age
        end
    end

    def cults
        my_oaths = BloodOath.all.filter do |oath|
            oath.follower == self
        end
        my_oaths.map do |oath|
            oath.cult
        end
    end

    def join_cult cult
        BloodOath.new cult, self, Time.now
    end

    def my_cults_slogans
        cults.reduce([]) do {|count, cult| count << cult.slogan}
    end

    def self.most_active
    end
end