# This is the solution Camille Baldock showed in the video

module HandEvaluator
  class Consec
    def straight cards
      cards.sort!
      difference_always_1 = true
      i = 0

      while (difference_always_1 && i < 4) do
        difference_between_values = cards[i+1] - cards[i]
        difference_always_1 = difference_between_values == 1
        i += 1
      end

      difference_always_1
    end
  end
end

describe HandEvaluator do
  let(:hand_evaluator){ HandEvaluator::Consec.new }

  it "detects a hand that is not a straight" do
    is_straight = hand_evaluator.straight [3, 2, 4, 5, 7]
    expect( is_straight ).to be false
  end

  it "detects a hand that is a straight" do
    is_straight = hand_evaluator.straight [4, 3, 5, 6, 7]
    expect( is_straight ).to be true
  end
end

