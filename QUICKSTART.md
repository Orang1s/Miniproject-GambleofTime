# Quick Start Guide

## What Has Been Created

Your Quarto website bone structure is now ready! Here's what was set up:

### Files Created:
1. **_quarto.yml** - Main configuration file that defines:
   - Website title: "Gamble of Time - Flight Data Analysis"
   - Navigation bar with Home, Analysis, and About pages
   - Theme: Cosmo (a clean, modern Bootstrap theme)
   - Table of contents enabled

2. **index.qmd** - Your homepage with:
   - Welcome message
   - Project overview
   - Navigation links

3. **analysis.qmd** - Main analysis page with:
   - Template sections for your findings
   - Example R code blocks for loading CSV data
   - Placeholders for visualizations
   - All code blocks set to `eval: false` (won't execute until you're ready)

4. **about.qmd** - About page with:
   - Project background
   - Objectives
   - Methodology
   - Tools used

5. **data/** - Directory for your CSV files
   - Includes a README explaining how to organize your data

6. **styles.css** - Custom CSS styling

7. **.gitignore** - Configured to ignore Quarto output and common files

## How to Use This Structure

### Step 1: Add Your CSV Files
Place your CSV files in the `data/` directory:
```
data/
  ├── flight_delays.csv
  ├── carriers.csv
  ├── routes.csv
  └── README.md
```

### Step 2: Update analysis.qmd
Open `analysis.qmd` and:
- Change `eval: false` to `eval: true` in the code blocks you want to run
- Replace placeholder variable names with your actual column names
- Add your analysis code
- Uncomment the library imports

Example:
```r
#| echo: true
#| eval: true
#| label: load-data

library(readr)
library(dplyr)

# Load your actual CSV files
flight_data <- read_csv("data/your_flight_data.csv")
head(flight_data)
```

### Step 3: Preview Your Website
Run in your terminal:
```bash
quarto preview
```
This will:
- Render your website
- Open it in your browser
- Auto-refresh when you make changes

### Step 4: Customize Content
- Edit the markdown text in any `.qmd` file
- Add more visualization code blocks
- Update titles and descriptions
- Add more pages if needed

### Step 5: Render Final Website
When you're happy with the content:
```bash
quarto render
```
This creates the final HTML files in the `_site/` directory.

## Tips

1. **Code Block Options**:
   - `echo: true` - Shows your code
   - `eval: true` - Runs the code
   - `label: descriptive-name` - Names the code block
   - `warning: false` - Hides warnings
   - `message: false` - Hides messages

2. **Adding Images**:
   ```markdown
   ![Caption](path/to/image.png)
   ```

3. **Adding New Pages**:
   - Create a new `.qmd` file
   - Add it to the navbar in `_quarto.yml`

4. **Using Python Instead of R**:
   Just replace R code blocks with Python:
   ````markdown
   ```{python}
   import pandas as pd
   df = pd.read_csv("data/your_file.csv")
   ```
   ````

## Common Commands

```bash
# Preview website (with live reload)
quarto preview

# Render website
quarto render

# Render just one page
quarto render analysis.qmd

# Check Quarto version
quarto --version

# Get help
quarto --help
```

## Need Help?

- Quarto documentation: https://quarto.org/docs/guide/
- Quarto gallery: https://quarto.org/docs/gallery/
- Markdown basics: https://quarto.org/docs/authoring/markdown-basics.html

## Next Steps

1. ✅ Website structure created
2. 📁 Upload your CSV files to `data/` directory
3. 📝 Update `analysis.qmd` with your code
4. 👀 Preview with `quarto preview`
5. 🎨 Customize styling if needed
6. 🚀 Render and publish!
