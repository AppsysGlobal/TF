variable "tenancy_ocid" {
  description = "OCI Tenancy OCID"
  type        = string
}

variable "user_ocid" {
  description = "OCI User OCID"
  type        = string
}

variable "fingerprint" {
  description = "OCI API Key Fingerprint"
  type        = string
}

variable "private_key_path" {
  description = "Path to the private key file"
  type        = string
  default     = "/var/lib/jenkins/.oci/Optimuskey_pkcs1.pem"
}

variable "region" {
  description = "OCI region (e.g., us-ashburn-1)"
  type        = string
}
