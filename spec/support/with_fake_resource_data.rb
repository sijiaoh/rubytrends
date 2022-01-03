shared_context "with fake resource data" do
  let :source_data do
    file = File.read "spec/data/mysql_in_docker.json"
    JSON.parse file
  end
end
