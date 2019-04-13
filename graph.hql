DROP TABLE graph;
DROP TABLE group1;

CREATE TABLE graph(node1 int, node2 int)
ROW FORMAT DELIMITED
	FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH '${hiveconf:G}'	INTO TABLE graph;

CREATE TABLE group1 as
select count(node1) as node3
from graph group by node1;

SELECT node3,count(node3) FROM group1
group by node3;
