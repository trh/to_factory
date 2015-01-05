describe ToFactory::FileWriter do
  let(:fw) { ToFactory::FileWriter.new }
  let(:expected)    { File.read "./spec/example_factories/new_syntax/user_with_header.rb"}
  let(:user_file_contents)    { File.read "./tmp/factories/to_factory/user.rb"}
  let!(:user) { create_user!  }
  let!(:admin) { create_admin!  }
  it do
    fs = ToFactory::FileSync.new
    definitions = fs.new_definitions
    #sanity check generation isn't broken
    expect(definitions.keys).to eq [ToFactory::User]

    fw.write definitions
    expect(user_file_contents).to match_sexp expected
  end
end