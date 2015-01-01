# https://www.youtube.com/watch?v=tJkoHFjoMuk

module HandEvaluator
  class Succ
    require "set"

    def straight cards
      evaled_hand = (cards + cards.map(&:succ)) - (cards & cards.map(&:succ))

      if evaled_hand.length == 2
        return HandEvaluator.compile_hand_details true, evaled_hand.max - 1, evaled_hand.min
      end

      HandEvaluator.compile_hand_details
    end
  end

  def self.compile_hand_details is_straight=false, high_card=nil, low_card=nil
    { is_straight: is_straight, high: high_card, low: low_card }
  end
end

describe HandEvaluator do
  let(:hand_evaluator){ HandEvaluator::Succ.new }

  it "detects a hand that is not a straight" do
    evaled_hand = hand_evaluator.straight [3, 2, 4, 5, 6, 7, 9]
    expect( evaled_hand[:is_straight] ).to be false
  end

  it "detects a hand that is a straight" do
    evaled_hand = hand_evaluator.straight [4, 3, 5, 6, 7, 8]
    expect( evaled_hand[:is_straight] ).to be true
    expect( evaled_hand[:high] ).to be 8
    expect( evaled_hand[:low] ).to be 3
  end
end
