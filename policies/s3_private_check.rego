# Sample Rego policy to enforce private S3 buckets

package terraform.aws

# This rule checks that every AWS S3 bucket resource has its ACL set to private.
deny[msg] {
    resource := input.resource.aws_s3_bucket
    msg := sprintf("The S3 bucket '%s' must be private. Current ACL is '%s'.", [resource.name, resource.acl])
    
    # Check if the ACL is not 'private'
    resource.acl != "private"
}