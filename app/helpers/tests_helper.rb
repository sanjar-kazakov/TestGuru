module TestsHelper

  # TEST_LEVEL = {(0..1) => 'easy', (2..4) => 'medium', (5..Float::INFINITY) => 'difficult' }

  # def test_level(test)
  #   TEST_LEVEL[test.level]
  # end

  def test_level(test)
    case test.level
    when 0..1 then 'easy'
    when 2..4 then 'medium'
    else
      'difficult'
    end
  end
end
