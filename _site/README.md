# Developer & Infrastructure Cheat Sheets

A small, static reference library for Terraform, VS Code, Git/GitHub, and Okta app integrations. The landing page is plain HTML/CSS; the reference sheets are Markdown files rendered by GitHub Pages.

## Project structure

```text
.
|-- assets/
|   `-- style.css
|-- _layouts/
|   `-- doc.html
|-- pages/
|   |-- terraform.md
|   |-- vscode.md
|   |-- github.md
|   `-- okta-integration.md
|-- index.html
`-- README.md
```

## Preview locally

Open `index.html` in a browser. To preview the Markdown pages as rendered HTML, use a local Markdown preview extension or run the site through Jekyll.

## Publish with GitHub Pages

1. Create an empty repository on GitHub.
2. From this project directory, initialize Git and push the files:

   ```sh
   git init
   git add .
   git commit -m "Add developer cheat sheets"
   git branch -M main
   git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPO-NAME.git
   git push -u origin main
   ```

3. In the repository, open **Settings > Pages**.
4. Under **Build and deployment**, select **Deploy from a branch**, then choose `main` and `/(root)`. Save.
5. After the Pages deployment completes, the site will be available at `https://YOUR-USERNAME.github.io/YOUR-REPO-NAME/`.

Each cheat sheet has YAML front matter so GitHub Pages' Jekyll build renders `pages/terraform.md` as `pages/terraform.html`, matching the links from `index.html`.