module TestsHelper
  def test_level(test)
    case test.level
    when 0..1 then I18n.t('tests.level.easy')
    when 2..4 then I18n.t('tests.level.medium')
    else
      I18n.t('tests.level.difficult')
    end
  end
end
