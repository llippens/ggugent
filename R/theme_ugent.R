#' UGent-styled theme for ggplot2
#'
#' This function applies a custom theme to ggplot objects, using UGent Panno Text as the default font.
#' It includes customized settings for plot titles, subtitles, captions, legends, axes, and panel grids.
#' The theme aims to create a visually appealing and consistent style for data visualisations,
#' adhering to UGent's branding guidelines.
#'
#' @param base_size A numeric value determining the base font size for various text elements within the ggplot. This parameter sets a standard size from which relative sizes of other text elements (like titles, subtitles, axis labels, and legend text) are calculated. The default value is set to 20.
#' @param faculty_colour A character string representing the shortcode for a specific faculty within Ghent University. This parameter allows the theme customisation to reflect the unique identity of different faculties (e.g., "EB" for the Faculty of Economics and Business Administration) by applying their particular colour. If the provided shortcode is not recognised, or if `faculty_colour` is left as `NULL`, the function defaults to using the UGent yellow (`#FFD200`) as the accent colour. For now, this parameter only influences the strip text's colour.
#'
#' @importFrom ggplot2 geom_point geom_smooth facet_wrap scale_x_continuous scale_y_continuous labs theme theme_minimal element_text element_blank margin element_line element_rect unit
#' @importFrom extrafont loadfonts fonttable
#'
#' @return A ggplot2 theme object.
#'
#' @examples
#' library(ggplot2)
#' library(ggugent)
#'
#' # Using mtcars dataset as an example
#' ggplot(data = mtcars, mapping = aes(x = wt, y = mpg)) +
#'   geom_point() +
#'   geom_smooth(
#'     method = "lm",
#'     formula = y ~ x,
#'     alpha = .15,
#'     colour = "#1E64C8"
#'   ) +
#'   facet_wrap(~cyl, ncol = 3) +
#'   scale_x_continuous(limits = c(0, 5.5), breaks = seq(0, 5, 1)) +
#'   scale_y_continuous(limits = c(5, 35)) +
#'   labs(
#'     title = "Motor Trend car road tests",
#'     subtitle = "Vehicles miles per gallon vs weight by number of cylinders",
#'     caption = "Source: Motor Trend US magazine",
#'     x = "Weight (x1,000 lbs)",
#'     y = "Miles / (US) gallon"
#'   ) +
#'   theme_ugent(
#'     base_size = 20,
#'     faculty_colour = "EB"
#'   )
#'
#' @export

theme_ugent <-
  function(
    base_size = 20,
    faculty_colour = NULL
  ) {

    # Fonts
    extrafont::loadfonts(quiet = TRUE)
    available_fonts <- extrafont::fonttable()$Family
    primary <- "UGent Panno Text"
    secondary <- "Arial"

    ## Check for primary UGent font, else rely on fallback option
    font <-
      if (primary %in% available_fonts) {
        primary
      } else {
        secondary
      }

    # UGent colours
    ugent_blue <- "#1E64C8"
    ugent_yellow <- "#FFD200"
    ugent_white <- "#FFFFFF"
    ugent_black <- "#000000"

    ## Mapping of faculty shortcodes to colours
    faculty_colours <- list(
      LW = "#F1A42B", # Faculty of Arts and Philosophy (orange)
      RE = "#DC4E28", # Faculty of Law and Criminology (warm red)
      WE = "#2D8CA8", # Faculty of Sciences (aqua)
      GE = "#E85E71", # Faculty of Medicine and Health Sciences (salmon pink)
      EA = "#8BBEE8", # Faculty of Engineering and Architecture (medium sky-blue)
      EB = "#AEB050", # Faculty of Economics and Business Administration (light green)
      DI = "#825491", # Faculty of Veterinary Medicine (purple)
      PP = "#FB7E3A", # Faculty of Psychology and Educational Sciences (warm orange)
      BW = "#27ABAD", # Faculty of Bioscience Engineering (turquoise)
      FW = "#BE5190", # Faculty of Pharmaceutical Sciences (light purple)
      PS = "#71A860"  # Faculty of Political and Social Sciences (green)
    )

    ## Determine the faculty colour based on the provided shortcode
    accent_colour <-
      if (!is.null(faculty_colour) && faculty_colour %in% names(faculty_colours)) {
        faculty_colours[[faculty_colour]]
      } else {
        ugent_yellow # Default colour
      }

    # Plotting theme
    ggplot2::theme_minimal() +
      ggplot2::theme(
        # Customisations for plot title
        plot.title = ggplot2::element_text(
          family = font, size = base_size, colour = ugent_blue,
          margin = ggplot2::margin(b = 0.5 * base_size, unit = "pt")
        ),
        # Customisations for plot subtitle
        plot.subtitle = ggplot2::element_text(
          family = font, size = 0.8 * base_size, colour = ugent_blue,
          margin = ggplot2::margin(b = 0.5 * base_size, unit = "pt")
        ),
        # Customisations for plot caption
        plot.caption = ggplot2::element_text(
          family = font, size = 0.55 * base_size, colour = ugent_black
        ),
        # Customisations for legend
        legend.position = "top",
        legend.text.align = 0,
        legend.background = ggplot2::element_blank(),
        legend.title = ggplot2::element_blank(),
        legend.key = ggplot2::element_blank(),
        legend.text = ggplot2::element_text(
          family = font, size = 0.65 * base_size, colour = ugent_black
        ),
        # Customisations for axes
        axis.title = ggplot2::element_text(
          family = font, size = 0.8 * base_size, colour = ugent_blue
        ),
        axis.text = ggplot2::element_text(
          family = font, size = 0.65 * base_size, colour = ugent_black
        ),
        axis.text.x = ggplot2::element_text(
          margin = ggplot2::margin(t = 0.25 * base_size, b = 0.5 * base_size, unit = "pt")
        ),
        axis.text.y = ggplot2::element_text(
          margin = ggplot2::margin(r = 0.25 * base_size, l = 0.5 * base_size, unit = "pt")
        ),
        axis.ticks = ggplot2::element_blank(),
        axis.line = ggplot2::element_blank(),
        # Customisations for panel grid
        panel.grid.minor = ggplot2::element_blank(),
        panel.background = ggplot2::element_blank(),
        # Customisations for strip text and panel spacing
        strip.background = ggplot2::element_rect(
          fill = "white",
          colour = NA),
        strip.text = ggplot2::element_text(
          size = 0.8 * base_size, color = accent_colour
        ),
        panel.spacing = ggplot2::unit(0.75 * base_size, "pt")
      )
  }
