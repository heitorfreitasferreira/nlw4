defmodule Rocketpay.NumbersTest do
  # explicitar que é um teste
  use ExUnit.Case

  # import com apelido do module Rocketpay.Numbers, ai aqui só usa como Numbers
  alias Rocketpay.Numbers

  describe "sum_from_file/1" do
    test "quando há um arquivo com um dado nome, retorna a soma dos numeros desse arquivo " do
      response = Numbers.sum_from_file("numbers")
      expected_response = {:ok, %{result: 37}}
      assert response == expected_response
    end

    test "quando não há um arquivo com um dado nome, retorna um erro " do
      response = Numbers.sum_from_file("banana")
      expected_response = {:error, %{message: "Arquivo inválido"}}
      assert response == expected_response
    end
  end
end
