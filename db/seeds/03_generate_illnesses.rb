class IllnessSeed

  def self.generate_illnesses
    illnesses.each do |illness|
      seed = Illness.create(name: illness)
      puts "Created Illness #{seed.name}"
    end
  end

private

  def self.illnesses
    [
      "Anxiety",
      "Behavioral Disorder",
      "Depression",
      "Mood Disorder",
      "id_filler_not_valid",
      "Bipolar",
      "Seasonal Affective Disorder",
      "Self-Harm",
      "id_filler_not_valid",
      "Anti-Social Personality Disorder",
      "Borderline Personality Disorder",
      "Psychotic Disorder",
      "Schizophrenia",
      "Suicidal Behavior",
      "Post-Partum Depression",
      "Major Depression with Psychotic Features",
      "OCD",
      "Panic Disorder",
      "Phobias",
      "PTSD",
      "ADHD",
      "Substance Use Disorder"
    ]
  end
end

IllnessSeed.generate_illnesses
