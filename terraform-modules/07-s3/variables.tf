variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all resources"
  default     = {}
}

variable "sse_algorithm" {
  type        = string
  description = "Server-side encryption algorithm, e.g., AES256 or aws:kms"
  default     = "AES256"
}

variable "kms_key_id" {
  type        = string
  description = "KMS key ID for encryption when using aws:kms"
  default     = ""
}

variable "bucket_policy" {
  type        = string
  description = "Custom bucket policy JSON, if empty default policy is used"
  default     = ""
}

variable "versioning" {
  type        = bool
  description = "Enable versioning on the bucket"
  default     = true
}

variable "mfa_delete" {
  type        = bool
  description = "Enable MFA delete on versioning"
  default     = false
}

variable "apply_lifecycle_rules" {
  type        = bool
  description = "Apply lifecycle expiration rule"
  default     = true
}

variable "enable_logging" {
  type        = bool
  description = "Enable server access logging"
  default     = false
}

variable "log_bucket_name" {
  type        = string
  description = "Target bucket for server access logs"
  default     = ""
}
