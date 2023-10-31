locals {
  # When the (optional) name suffix is non-empty then it must be preceeded with a
  # hyphen to separate it from the previous component of the name
  hyphenated_name_suffix = var.name_suffix != "" ? "-${var.name_suffix}" : ""
}
