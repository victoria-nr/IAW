FROM squidfunk/mkdocs-material

RUN pip install --no-cache-dir \
  mkdocs-awesome-pages-plugin \
  mkdocs-minify-plugin \
  mkdocs-git-revision-date-localized-plugin
  #mkdocs-bibtex \
  #mkdocs-img2fig-plugin \
  #mkdocs-mermaid2-plugin

# Start development server by default
ENTRYPOINT ["mkdocs"]
CMD ["serve", "--dev-addr=0.0.0.0:8000"]
