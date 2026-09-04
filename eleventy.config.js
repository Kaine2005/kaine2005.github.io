export default function (eleventyConfig) {
  // Static assets live at the project root, next to the build config.
  // Passthrough paths are relative to the project root and keep their structure.
  eleventyConfig.addPassthroughCopy("assets");
  eleventyConfig.addPassthroughCopy("clips");
  eleventyConfig.addPassthroughCopy("favicon.svg");
  eleventyConfig.addPassthroughCopy("kaine-photo.jpg");
  eleventyConfig.addPassthroughCopy("og-image.jpg");
  eleventyConfig.addPassthroughCopy("robots.txt");
  eleventyConfig.addPassthroughCopy("CNAME");
  // Preserve the existing /privacy.html URL exactly (standalone, self-styled page).
  eleventyConfig.addPassthroughCopy("privacy.html");

  // A collection of every page that should appear in sitemap.xml.
  // Any template can opt out with `eleventyExcludeFromCollections: true`
  // or `sitemap: false` in its front matter.
  eleventyConfig.addCollection("sitemap", (collectionApi) =>
    collectionApi
      .getAll()
      .filter((item) => item.data.sitemap !== false && item.url)
      .sort((a, b) => (a.url > b.url ? 1 : -1))
  );

  return {
    dir: {
      input: "src",
      includes: "_includes",
      data: "_data",
      output: "_site",
    },
    // Let .html files run through Nunjucks so layouts/partials work.
    htmlTemplateEngine: "njk",
    markdownTemplateEngine: "njk",
    templateFormats: ["njk", "html", "md", "11ty.js"],
  };
}
