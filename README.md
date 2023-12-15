# ggugent

The `ggugent` package provides a custom ggplot2 theme (`theme_ugent`)
tailored to the branding guidelines of Ghent University (UGent). This
theme allows R users to create ggplot2 visualizations that adhere to the
university’s style, including font, colors, and other aesthetic
elements.

## Installation

You can install the development version from GitHub with:

    # install.packages("devtools")
    devtools::install_github("llippens/ggugent")

## Usage

After installation, you can use the `theme_ugent` function to apply the
UGent theme to your ggplot2 objects. Here’s an example using the
`mtcars` dataset.

    library(ggplot2)
    library(ggugent)

    ggplot(mtcars, aes(x = wt, y = mpg)) +
      geom_point() +
      geom_smooth(method = "lm", formula = y ~ x, alpha = .15, colour = "#1E64C8") +
      facet_wrap(~cyl, ncol = 3) +
      scale_y_continuous(limits = c(0, 40)) +
      scale_x_continuous(limits = c(0, 6), breaks = seq(0, 6, 1)) +
      labs(
        title = "Motor Trend Car Road Tests",
        subtitle = "Vehicles miles per gallon vs weight by number of cylinders",
        caption = "Source: Motor Trend US magazine"
      ) +
      xlab("Weight (1,000 lbs)") +
      ylab("Miles / (US) gallon") +
      theme_ugent(
        base_size = 20,
        faculty_colour = "EB"
      )

## Features

-   **Custom Font**: Uses ‘UGent Panno Text’ as the default font.
-   **Faculty Colours**: Allows specifying faculty colours through
    shortcodes like “EB” for the Faculty of Economics and Business
    Administration.
-   **Adaptable Text Size**: The font size parameter adjusts the base
    font size for the plot text elements.

## Contributing

Contributions are welcome! If you’d like to contribute, please fork the
repository and use a feature branch. Pull requests are warmly welcomed.

## Licensing

The code in this project is licensed under MIT license. See
[LICENSE](LICENSE.md) for more information.
