Sequel.migration do
  up do
    create_table(:tracks) do
      primary_key :id
      String :url, :null => false
    end
  end

  down do
    drop_table(:tracks)
  end
end
