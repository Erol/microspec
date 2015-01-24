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
