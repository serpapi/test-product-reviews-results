describe "SerpApi Product Reviews JSON" do

  describe "Reviews results for Sceptre X505BV-FSR - 50 LED TV - 1080p" do

    before :all do
      @response = HTTP.get 'https://serpapi.com/search.json?engine=google_product&product=16618293882053925702&reviews=true&source=test'
      @json = @response.parse
    end

    it "returns http success" do
      expect(@response.code).to be(200)
    end

    it "contains Reviews results hash" do
      expect(@json["reviews_results"]).to be_an(Hash)
    end

    describe "have Reviews results" do

      before :all do
        @result = @json["reviews_results"]
      end

      it "has ratings" do
        expect(@result["ratings"]).to be_a(Array)
      end
      
      it "has summary" do
        expect(@result["summary"]).to be_a(Array)
      end

      it "has reviews" do
        expect(@result["reviews"]).to be_a(Array)
      end 
      
      describe "first ratings" do
        it "stars is 5" do
          expect(@result["ratings"][0]["stars"]).to be(5)
        end

        it "amount is not 0" do
          expect(@result["ratings"][0]["amount"]).to_not be(0)
        end
      end
      
      describe "first summary" do
        it "has title" do
          expect(@result["summary"][0]["title"]).to_not be_empty
        end

        it "has text" do
          expect(@result["summary"][0]["text"]).to_not be_empty
        end
      end
      
      describe "first reviews" do
        it "is first" do
          expect(@result["reviews"][0]["position"]).to be(1)
        end
        
        it "has title" do
          expect(@result["reviews"][0]["title"]).to_not be_empty
        end

        it "has date" do
          expect(@result["reviews"][0]["date"]).to_not be_empty
        end
        
        it "has rating" do
          expect(@result["reviews"][0]["rating"]).to_not be_empty
        end

        it "has source" do
          expect(@result["reviews"][0]["source"]).to_not be_empty
        end

        it "has content" do
          expect(@result["reviews"][0]["content"]).to_not be_empty
        end
      end
    end

  end

end