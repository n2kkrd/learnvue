export const addArticle = (articles, article) => {
  if (!Array.isArray(articles)) {
    throw new Error('Invalid argument: articles must be an array')
  }
  if (!article.title || !article.content || !article.author) {
    throw new Error('Article is missing required fields')
  }
  return [...articles, article]
}