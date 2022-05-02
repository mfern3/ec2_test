output "user-data" {
  value = data.template_file.user_data.rendered
}