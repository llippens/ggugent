**Important.** This package is currently under development.

# ggugent

The `ggugent` package provides a custom, opinionated ggplot2 theme
(`theme_ugent`) tailored to the branding guidelines of Ghent University
(UGent). This theme allows R users to create ggplot2 visualisations that
align with the university’s style, including font, colours, and other
aesthetic elements.

## Installation

You can install the development version from GitHub.

    # install.packages("devtools")
    devtools::install_github("llippens/ggugent")

## Usage

After installation, you can use the `theme_ugent` function to apply the
UGent theme to your ggplot2 objects. Here’s an example using the
`mtcars` dataset.

    library(ggplot2)
    library(ggugent)
    ggplot(data = mtcars, mapping = aes(x = wt, y = mpg)) +
      geom_point() +
      geom_smooth(
        method = "lm",
        formula = y ~ x,
        alpha = .15,
        colour = "#1E64C8"
      ) +
      facet_wrap(~cyl, ncol = 3) +
      scale_x_continuous(limits = c(0, 5.5), breaks = seq(0, 5, 1)) +
      scale_y_continuous(limits = c(5, 35)) +
      labs(
        title = "Motor Trend car road tests",
        subtitle = "Vehicles miles per gallon vs weight by number of cylinders",
        caption = "Source: Motor Trend US magazine",
        x = "Weight (x1,000 lbs)",
        y = "Miles / (US) gallon"
      ) +
      theme_ugent(
        base_size = 20,
        faculty = "EB"
      )

## Features

1.  **Custom Font**. The theme uses ‘UGent Panno Text’ as the default
    font (and ‘Arial’ as secondary or fall-back font).
2.  **Adaptable Text Size**. The `base_size` parameter sets a standard
    font size from which relative sizes of other text elements are
    calculated.
3.  **UGent Colour Theme**. The theme uses UGent blue `#1E64C8` as its
    base colour.
4.  **Faculty Colours**. The `faculty_colour` parameter specifies
    faculty colours through character shortcodes like “EB” for the
    Faculty of Economics and Business Administration.
    -   `LW` for the Faculty of Arts and Philosophy (orange, `#F1A42B`)
    -   `RE` for the Faculty of Law and Criminology (warm red,
        `#DC4E28`)
    -   `WE` for the Faculty of Sciences (aqua, `#2D8CA8`)
    -   `GE` for the Faculty of Medicine and Health Sciences (salmon
        pink, `#E85E71`)
    -   `EA` for the Faculty of Engineering and Architecture (medium
        sky-blue, `#8BBEE8`)
    -   `EB` for the Faculty of Economics and Business Administration
        (light green, `#AEB050`)
    -   `DI` for the Faculty of Veterinary Medicine (purple, `#825491`)
    -   `PP` for the Faculty of Psychology and Educational Sciences
        (warm orange, `#FB7E3A`)
    -   `BW` for the Faculty of Bioscience Engineering (turquoise,
        `#27ABAD`)
    -   `FW` for the Faculty of Pharmaceutical Sciences (light purple,
        `#BE5190`)
    -   `PS` for the Faculty of Political and Social Sciences (green,
        `#71A860`)

## Contributing

Contributions are appreciated! The development of this package is still
in its very early phase. If you would like to contribute, please use a
pull request. Issue reports are also warmly welcomed.

## Licensing

The code in this project is licensed under MIT license. See
[LICENSE](LICENSE) for more information.
