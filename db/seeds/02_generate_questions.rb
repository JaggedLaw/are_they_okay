class QuestionsSeed

  def self.generate_questions
    questions.each do |question|
      seed = Question.create(question:question)
      puts "Created Question #{seed.question}"
    end
  end

  private
    def self.questions
      ["Do you have anxiety",
        "Do you have behavioral problems",
        "Do you have depression",
        "Do you have mood problems",
        "Do you have bipolar",
        "Do you have Seasonal Affective Disorder",
        "Do you harm yourself",
        "Do you have anit-social personality disorder",
        "Do you have borderline personality disorder",
        "Do you have a psychotic disorder",
        "Do you have schizophrenia",
        "Do you think about suicide",
        "Did you have a baby and you're depressed",
        "Are you depressed with psychotic thoughts",
        "Do you do the same compulsive action over and over",
        "Do you have panic attacks",
        "Are you afraid of spiders",
        "Did you change after experiencing trauma",
        "Are you ADD",
        "Do you do too many drugs"
      ]
    end

end

QuestionsSeed.generate_questions
