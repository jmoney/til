# Kinesis KCL Checkpoint Table

Each row in the DynamoDB table represents a shard that is being processed by your application. The hash key for the table is **leaseKey**, which is the shard ID.

In addition to the shard ID, each row also includes the following data:

+ **checkpoint:** The most recent checkpoint sequence number for the shard. This value is unique across all shards in the stream.
+ **checkpointSubSequenceNumber:** When using the Kinesis Producer Library's aggregation feature, this is an extension to **checkpoint** that tracks individual user records within the Kinesis record.
+ **leaseCounter:** Used for lease versioning so that workers can detect that their lease has been taken by another worker.
+ **leaseKey:** A unique identifier for a lease. Each lease is particular to a shard in the stream and is held by one worker at a time.
+ **leaseOwner:** The worker that is holding this lease.
+ **ownerSwitchesSinceCheckpoint:** How many times this lease has changed workers since the last time a checkpoint was written.
+ **parentShardId:** Used to ensure that the parent shard is fully processed before processing starts on the child shards. This ensures that records are processed in the same order they were put into the stream.