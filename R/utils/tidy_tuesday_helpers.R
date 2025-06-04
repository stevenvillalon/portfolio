# Helper functions for Steve's Tidy Tuesday projects

# Saving Tidy Tuesday plots
save_tt_plots <- function(plot, title, date, output_folder = "output", formats = "png", width = 10, height = 6, dpi = 300) {
  # Create output folder if it doesn't exist
  if (!dir.exists(output_folder)) {
    dir.create(output_folder, recursive = TRUE)
  }
  
  # Replace non-alphanumeric characters (ie, spaces) with underscores
  filename <- paste0(
    output_folder, 
    "/", 
    date,
    "_tidy_tuesday_",
    gsub("[^a-zA-Z0-9]", "_", tolower(title))
  )
  
  # Loop over the supplied list of formats to create a file for each
  for (ext in formats) {
    ggsave(
      filename = paste0(filename, ".", ext),
      plot = plot,
      height = height,
      width = width,
      dpi = dpi,
      device = ext
    )
  }
}
