require 'rspec'
require 'meredith_heller'

describe "#folding_cipher" do
  it "maps letters to the other side of the alphabet" do
    expect(folding_cipher("a")).to eq("z")
    expect(folding_cipher("d")).to eq("w")
  end

  it "encodes plaintext words" do
    expect(folding_cipher("hello")).to eq("svool")
    expect(folding_cipher("goodbye")).to eq("tllwybv")
  end

  it "deciphers encoded words" do
    expect(folding_cipher("svool")).to eq("hello")
    expect(folding_cipher("tllwybv")).to eq("goodbye")
  end
end

describe "#fibs" do
  it "returns the first 0 Fibonacci numbers" do
    expect(fibs(0)).to eq([])
  end

  it "returns the first Fibonacci number" do
    expect(fibs(1)).to eq([0])
  end

  it "returns the first two Fibonacci numbers" do
    expect(fibs(2)).to eq([0, 1])
  end

  it "returns many Fibonacci numbers" do
    expect(fibs(7)).to eq([0, 1, 1, 2, 3, 5, 8])
  end
end

describe "#jumble_sort" do
  it "defaults to alphabetical order" do
    expect(jumble_sort("hello")).to eq("ehllo")
  end

  it "takes an alphabet array and sorts by that order" do
    alph = ("a".."z").to_a
    hello = "hello".chars.uniq
    alph -= hello
    alphabet = (hello += alph)

    expect(jumble_sort("hello", alphabet)).to eq("hello")
  end

  it "sorts by a reversed alphabet" do
    reverse = ("a".."z").to_a.reverse
    expect(jumble_sort("hello", reverse)).to eq("ollhe")
  end
end

describe "#dups?" do
  it "detects a single duplicated value" do
    expect([1, 3, 0, 1].dups?).to be_truthy
  end

  it "detects multiple duplicated values" do
    expect([1, 3, 0, 3, 1].dups?).to be_truthy
  end

  it "detects values duplicated more than once" do
    expect([1, 3, 4, 3, 0, 3].dups?).to be_truthy
  end

  it "returns false when no duplicates are found" do
    expect([1, 3, 4, 5].dups?).to be_falsey
  end
end

describe "real_words_in_string" do
  it "finds a simple word" do
    words = "asdfcatqwer".real_words_in_string(["cat", "car"])
    expect(words).to eq(["cat"])
  end

  it "doesn't find words not in the dictionary" do
    words = "batcabtarbrat".real_words_in_string(["cat", "car"])
    expect(words).to be_empty
  end

  it "finds words within words" do
    dictionary = ["bears", "ear", "a", "army"]
    words = "erbearsweatmyajs".real_words_in_string(dictionary)
    expect(words).to eq(["bears", "ear", "a"])
  end
end

describe "#factors" do
  it "returns the factors of 10 in order" do
    expect(factors(10)).to eq([1, 2, 5, 10])
  end

  it "returns just two factors for primes" do
    expect(factors(13)).to eq([1, 13])
  end
end
