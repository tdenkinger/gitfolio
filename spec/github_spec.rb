require_relative "../app/models/adapters"

describe Adapters::Github do
  let(:user){ "tdenkinger"}
  let(:repository){ Adapters::Github.new user: user }
  let(:repo_name){ "gitfolio" }

  it "retrieves repositories from github in a list" do
    repo_list = repository.names
    expect(repo_list).to include(repo_name)
  end

  it "retrieves information about a specific repository" do
    repo_detail = repository.details name: repo_name
    expect(repo_detail["id"].to_s).to match(/\d+/)
    expect(repo_detail["name"]).to match(/gitfolio/)
    expect(repo_detail["git_url"]).to match(/^git*/)
    expect(repo_detail["clone_url"]).to match(/^https/)
  end
end
