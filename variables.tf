variable "project_id" {
    type = string
    description = "The id of the project in gcp"
}

variable "region" {
    type = string
    description = "The location of the gcp resources"
}

variable "zone" {
    type = string
    description = "The zone of the region for the gcp resources"
}