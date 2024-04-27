module TestsHelper
  def test_level(test)
    case test.level
    when 0..1 then 'easy'
    when 2..4 then 'medium'
    else
      'difficult'
    end
  end
end
