class IllnessesSeed

  def self.generate_illnesses
    illnesses.each do |illness|
      seed = Illness.create(name:illness)
      puts "Created Disorder: #{seed.name}"
    end
  end

  private
    def self.illnesses
      ["Anxiety", "Behavioral Disorder", "Depression", "Mood Disorder", "Bipolar", "Seasonal Affective Disorder", "Self-Harm", "Anit-Social Personality Disorder", "Borderline Personality Disorder", "Psychotic Disorder", "Schizophrenia", "Suicidal Behavior", "Post-Partum Depression", "Major Depression with Psychotic Features", "OCD", "Panic Disorder", "Phobias", "Posttraumatic Stress Disorder(PTSD)", "Attention Deficit Hyperactivity Disorder(ADHD)", "Substance Use Disorder"]
    end

end

IllnessesSeed.generate_illnesses
