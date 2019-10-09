-- Creating Index
create index <index_name> on <Table-Name>(<Column-Name>);

-- Creating Unique Index
create unique index <index_name> on <Table-Name>(<Column-Name>);

-- Create Bitmap Index
create bitmap index <index_name> on <Table-name>(<Column-Name>);

-- Functional Index
create index <index_name> on <Table-name>(<expression>);
