"""Pulumi demo — S3 bucket with versioning enabled."""

import pulumi
import pulumi_aws as aws

# ---------------------------------------------------------------------------
# Configuration
# ---------------------------------------------------------------------------
config = pulumi.Config()
bucket_name = config.get("bucketName")          # optional; auto-generated if omitted
environment = config.get("environment") or "dev"

# ---------------------------------------------------------------------------
# S3 Bucket
# ---------------------------------------------------------------------------
bucket = aws.s3.BucketV2(
    "demo-bucket",
    bucket=bucket_name,                         # None → AWS generates a unique name
    tags={
        "Name": bucket_name or "pulumi-demo-bucket",
        "Environment": environment,
        "ManagedBy": "Pulumi",
    },
)

# ---------------------------------------------------------------------------
# Bucket Versioning
# ---------------------------------------------------------------------------
versioning = aws.s3.BucketVersioningV2(
    "demo-bucket-versioning",
    bucket=bucket.id,
    versioning_configuration=aws.s3.BucketVersioningV2VersioningConfigurationArgs(
        status="Enabled",
    ),
)

# ---------------------------------------------------------------------------
# Block all public access (security best practice)
# ---------------------------------------------------------------------------
public_access_block = aws.s3.BucketPublicAccessBlock(
    "demo-bucket-public-access-block",
    bucket=bucket.id,
    block_public_acls=True,
    block_public_policy=True,
    ignore_public_acls=True,
    restrict_public_buckets=True,
)

# ---------------------------------------------------------------------------
# Outputs
# ---------------------------------------------------------------------------
pulumi.export("bucket_id", bucket.id)
pulumi.export("bucket_arn", bucket.arn)
pulumi.export("bucket_regional_domain_name", bucket.bucket_regional_domain_name)
pulumi.export("versioning_status", versioning.versioning_configuration.status)
