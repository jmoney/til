# PrivateLink Alignment

It is a little known fact, but a rather annoying fact, that the availability zones for a PrivateLink must align between the provider and consumer.

## Example

Provider is in availability zones: `us-east-1a`, `us-east-1b`, and `us-east-1c`
Consumer is in availability zones: `us-east-1b`, `us-east-1c`, and `us-east-1d`

The consumer IPs can ONLY be deployed to `us-east-1b` and `us-east-1c` as those are the AZs the provider is deployed too.

> This must be PHYSICAL availability zone. The availability zone `us-east-1a` is actually a virtual thing and maps to a physical availability zone. This mapping though can be different cross account.  The `describe-vpc-endpoints` should tell you which availability zones you can deploy too as it handles the mapping into the account.
