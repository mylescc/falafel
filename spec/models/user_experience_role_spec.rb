describe UserExperienceRole do
  describe "secondary_activities_for" do
    context "where there are secondary activities" do
      it "returns a filtered list for the primary activity" do
        secondary_activities = UserExperienceRole.secondary_activities_for(1)
        expect(secondary_activities).to eq([
          'Enterprise Architect',
          'Infrastructure Architect',
          'Solution Architect',
          'Technical Architect',
        ])
      end

      it "returns an empty array if there are no secondary activities" do
        secondary_activities = UserExperienceRole.secondary_activities_for(2000)
        expect(secondary_activities).to eq([])
      end
    end
  end

  describe "mapped_secondary_acitivities" do
    it "returns a string keyed hash of string arrays representing each primary" do
      mapped = UserExperienceRole.mapped_secondary_activities
      expect(mapped["Architect"]).to eq([
        'Enterprise Architect',
        'Infrastructure Architect',
        'Solution Architect',
        'Technical Architect',
      ])

    end
  end
end
