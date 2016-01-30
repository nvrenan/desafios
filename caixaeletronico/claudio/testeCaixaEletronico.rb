require 'test/unit'
require File.expand_path('caixaEletronico')

class CaixaEletronicoTest < Test::Unit::TestCase
  def setup
    @caixaEletronico = CaixaEletronico.new
  end
  def test_sacar_237    
    saque = @caixaEletronico.sacar 237
    assert_equal saque, [2, 5, 10, 20, 100, 100]
  end

  def test_sacar_1
    saque = @caixaEletronico.sacar 1
    assert_equal saque, nil
  end

  def test_sacar_2
    saque = @caixaEletronico.sacar 2
    assert_equal saque, [2]
  end

  def test_sacar_3
    saque = @caixaEletronico.sacar 3
    assert_equal saque, nil
  end

  def test_sacar_37
    saque = @caixaEletronico.sacar 37
    assert_equal saque, [2,5,10,20]
  end

  def test_sacar_41
    saque = @caixaEletronico.sacar 41
    assert_equal saque, [2,2,2,5,10,20]
  end

  def test_sacar_391
    saque = @caixaEletronico.sacar 391
    assert_equal saque, [2, 2, 2, 5, 10, 20, 50, 100, 100, 100]
  end

  def test_sacar_734
    saque = @caixaEletronico.sacar 734
    assert_equal saque, [2, 2, 10, 20, 100, 100, 100, 100, 100, 100, 100]
  end
end