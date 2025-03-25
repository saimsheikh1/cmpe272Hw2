CREATE KEYSPACE data_endpoint_auth WITH replication = {'class': 'NetworkTopologyStrategy', 'us-east-2': '3'}  AND durable_writes = true;

CREATE TABLE data_endpoint_auth."token" (
    auth_token uuid PRIMARY KEY,
    created_timestamp int,
    username text
) WITH additional_write_policy = '99p'
    AND bloom_filter_fp_chance = 0.01
    AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.UnifiedCompactionStrategy'}
    AND compression = {'chunk_length_in_kb': '16', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND crc_check_chance = 1.0
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair = 'BLOCKING'
    AND speculative_retry = '99p';

CREATE KEYSPACE datastax_sla WITH replication = {'class': 'NetworkTopologyStrategy', 'us-east-2': '3'}  AND durable_writes = true;

CREATE TABLE datastax_sla.check (
    a int PRIMARY KEY
) WITH additional_write_policy = '99p'
    AND bloom_filter_fp_chance = 0.01
    AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.UnifiedCompactionStrategy'}
    AND compression = {'chunk_length_in_kb': '16', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND crc_check_chance = 1.0
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair = 'BLOCKING'
    AND speculative_retry = '99p';

CREATE KEYSPACE default_keyspace WITH replication = {'class': 'NetworkTopologyStrategy', 'us-east-2': '3'}  AND durable_writes = true;

CREATE TABLE default_keyspace.chatlog1_vector_collection (
    key frozen<tuple<tinyint, text>> PRIMARY KEY,
    array_contains set<text>,
    array_size map<text, int>,
    doc_json text,
    exist_keys set<text>,
    query_bool_values map<text, tinyint>,
    query_dbl_values map<text, decimal>,
    query_null_values set<text>,
    query_text_values map<text, text>,
    query_timestamp_values map<text, timestamp>,
    query_vector_value vector<float, 1536>,
    tx_id timeuuid
) WITH additional_write_policy = '99p'
    AND bloom_filter_fp_chance = 0.01
    AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
    AND comment = '{"collection":{"name":"chatlog1_vector_collection","schema_version":1,"options":{"vector":{"dimension":1536,"metric":"cosine","sourceModel":"OTHER","service":{"provider":"openai","modelName":"text-embedding-3-small","authentication":{"providerKey":"langflow_apikey.providerKey"},"parameters":{"organizationId":"","projectId":""}}},"defaultId":{"type":""}}}}'
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.UnifiedCompactionStrategy'}
    AND compression = {'chunk_length_in_kb': '16', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND crc_check_chance = 1.0
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair = 'BLOCKING'
    AND speculative_retry = '99p';
CREATE CUSTOM INDEX chatlog1_vector_collection_array_contains ON default_keyspace.chatlog1_vector_collection (values(array_contains)) USING 'StorageAttachedIndex';
CREATE CUSTOM INDEX chatlog1_vector_collection_array_size ON default_keyspace.chatlog1_vector_collection (entries(array_size)) USING 'StorageAttachedIndex';
CREATE CUSTOM INDEX chatlog1_vector_collection_exists_keys ON default_keyspace.chatlog1_vector_collection (values(exist_keys)) USING 'StorageAttachedIndex';
CREATE CUSTOM INDEX chatlog1_vector_collection_query_bool_values ON default_keyspace.chatlog1_vector_collection (entries(query_bool_values)) USING 'StorageAttachedIndex';
CREATE CUSTOM INDEX chatlog1_vector_collection_query_dbl_values ON default_keyspace.chatlog1_vector_collection (entries(query_dbl_values)) USING 'StorageAttachedIndex';
CREATE CUSTOM INDEX chatlog1_vector_collection_query_null_values ON default_keyspace.chatlog1_vector_collection (values(query_null_values)) USING 'StorageAttachedIndex';
CREATE CUSTOM INDEX chatlog1_vector_collection_query_text_values ON default_keyspace.chatlog1_vector_collection (entries(query_text_values)) USING 'StorageAttachedIndex';
CREATE CUSTOM INDEX chatlog1_vector_collection_query_timestamp_values ON default_keyspace.chatlog1_vector_collection (entries(query_timestamp_values)) USING 'StorageAttachedIndex';
CREATE CUSTOM INDEX chatlog1_vector_collection_query_vector_value ON default_keyspace.chatlog1_vector_collection (query_vector_value) USING 'StorageAttachedIndex' WITH OPTIONS = {'similarity_function': 'cosine', 'source_model': 'OTHER'};
