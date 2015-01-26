setup do
  @variable = 1
end

spec do
  refutes(self).instance_variable_defined? :@variable
end

@variable = 1

spec do
  refutes(self).instance_variable_defined? :@variable
end

define hash: -> { {o: :o} }

scope do
  define hash: -> { {O: :O} }

  spec do
    asserts(hash) == {O: :O}
  end
end

spec do
  asserts(hash) == {o: :o}
end

spec do
  hash.merge! O: :O

  asserts(hash) == {o: :o, O: :O}
end

define derived: -> { hash.merge O: :O }

spec do
  asserts(derived) == {o: :o, O: :O}
end

scope do
  setup do
    $a = :a
  end

  spec do
    asserts($a) == :a
  end

  scope do
    setup do
      $b = :b
    end

    spec do
      asserts($b) == :b
    end

    scope do
      teardown do
        $b = nil
      end
    end

    spec do
      asserts($b).nil?
    end

    teardown do
      $a = nil
    end
  end

  spec do
    asserts($a).nil?
  end
end
