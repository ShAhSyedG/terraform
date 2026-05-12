# pulumi/demo — S3 Bucket with Versioning

A minimal Pulumi Python project that provisions a production-ready S3 bucket with:

- **Versioning enabled** — protects against accidental deletes/overwrites
- **Public access fully blocked** — security best practice
- **Resource tagging** — `Environment` and `ManagedBy` tags applied

## Prerequisites

| Tool | Version |
|------|---------|
| Python | ≥ 3.9 |
| Pulumi CLI | ≥ 3.x |
| AWS credentials | exported in shell |

## Quick start

```bash
cd pulumi/demo

# 1. Create a virtual environment and install dependencies
python -m venv venv
source venv/bin/activate        # Windows: venv\Scripts\activate
pip install -r requirements.txt

# 2. Log in to your chosen state backend
pulumi login                    # Pulumi Cloud
# or
pulumi login s3://my-state-bucket
# or
pulumi login --local

# 3. Create / select a stack
pulumi stack init dev

# 4. (Optional) set config values
pulumi config set aws:region us-east-1
pulumi config set bucketName my-unique-bucket-name   # omit for auto-generated name
pulumi config set environment dev

# 5. Preview, then deploy
pulumi preview
pulumi up
```

## Stack outputs

| Output | Description |
|--------|-------------|
| `bucket_id` | The bucket's name / ID |
| `bucket_arn` | Full ARN of the bucket |
| `bucket_regional_domain_name` | Regional domain name for the bucket |
| `versioning_status` | Should be `Enabled` |

## Destroying the stack

```bash
pulumi destroy
```

> **Note:** You must empty the bucket before destroying it if it contains objects.
