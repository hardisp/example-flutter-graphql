String qReadUser = """
  query ReadUser(\$username: String!) {
    user(login: \$username) {
      avatarUrl
      bio
      createdAt
      id
      url
      login
      name
    }
  }
""";
