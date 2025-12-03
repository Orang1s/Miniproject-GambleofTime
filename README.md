# Miniproject-GambleofTime

This is the mini project from Georgetown DSAN6300 Database and SQL. The goal is to analyze the flight data from the Department of Transportation and give valuable insights.

## Quarto Website Structure

This project uses Quarto to create a website showcasing the analysis findings.

### Prerequisites

- [Quarto](https://quarto.org/docs/get-started/) installed on your system
- R or Python (depending on your analysis code)

### Getting Started

1. **Add your CSV files**: Place your CSV data files in the `data/` directory

2. **Edit the analysis**: Update `analysis.qmd` with your actual analysis code and findings

3. **Preview the website locally**:
   ```bash
   quarto preview
   ```

4. **Render the website**:
   ```bash
   quarto render
   ```

5. **Publish** (optional):
   ```bash
   quarto publish
   ```

### Website Structure

- `_quarto.yml` - Main configuration file for the website
- `index.qmd` - Homepage
- `analysis.qmd` - Main analysis page (update with your findings)
- `about.qmd` - About page
- `data/` - Directory for your CSV files
- `styles.css` - Custom styling
- `_site/` - Generated website output (auto-generated, git-ignored)

### Customization

- Edit `_quarto.yml` to change website title, theme, or navigation
- Update `.qmd` files with your content
- Modify `styles.css` for custom styling
- Add more pages as needed by creating new `.qmd` files

### Next Steps

1. Upload your CSV files to the `data/` directory
2. Update `analysis.qmd` with your actual R or Python code
3. Add your visualizations and findings
4. Preview and iterate on your content
5. Render the final website

For more information about Quarto, visit [https://quarto.org](https://quarto.org)
