# Contributing to RubyCritic Skill

Thank you for considering contributing to the RubyCritic Skill for Claude Code! This document provides guidelines for contributing to the project.

## Code of Conduct

By participating in this project, you agree to maintain a respectful and inclusive environment for all contributors.

## How Can I Contribute?

### Reporting Bugs

If you find a bug, please open an issue with:

- **Clear title and description**
- **Steps to reproduce** the issue
- **Expected behavior** vs actual behavior
- **Environment details** (Ruby version, Claude Code version, OS)
- **Code samples** or error messages if applicable

### Suggesting Enhancements

Enhancement suggestions are welcome! Please open an issue with:

- **Clear description** of the enhancement
- **Use cases** - why this would be useful
- **Proposed implementation** if you have ideas
- **Examples** of how it would work

### Pull Requests

1. **Fork the repository**
   ```bash
   git clone https://github.com/esparkman/claude-rubycritic-skill.git
   cd claude-rubycritic-skill
   ```

2. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make your changes**
   - Follow the existing code style
   - Update documentation if needed
   - Test your changes thoroughly

4. **Commit your changes**
   ```bash
   git add .
   git commit -m "Add feature: description of your changes"
   ```

5. **Push to your fork**
   ```bash
   git push origin feature/your-feature-name
   ```

6. **Open a Pull Request**
   - Provide a clear description of the changes
   - Reference any related issues
   - Include examples or screenshots if applicable

## Development Guidelines

### Plugin Structure

This repository follows the Claude Code plugin format:

```
claude-rubycritic-skill/
├── .claude-plugin          # Plugin metadata
├── skills/
│   └── rubycritic-skill/
│       └── SKILL.md        # Main skill definition
├── README.md               # User-facing documentation
├── INSTALLATION.md         # Installation instructions
├── CONTRIBUTING.md         # This file
└── LICENSE
```

### SKILL.md Format

The SKILL.md file must include:

1. **YAML frontmatter** with:
   - `name`: Skill name
   - `description`: Clear, concise description
   - `version`: Semantic version (e.g., 1.0.0)
   - `author`: Author name
   - `tags`: Relevant tags in array format

2. **Clear sections**:
   - Description
   - Commands/Usage
   - Examples
   - Configuration
   - Troubleshooting

### .claude-plugin Format

The `.claude-plugin` file should be valid JSON:

```json
{
  "name": "rubycritic-skill",
  "version": "1.0.0",
  "description": "Description here",
  "author": "Author Name",
  "repository": "https://github.com/username/repo",
  "license": "MIT",
  "skills": ["rubycritic-skill"]
}
```

### Version Numbers

We follow [Semantic Versioning](https://semver.org/):

- **MAJOR** version for incompatible changes
- **MINOR** version for backwards-compatible functionality
- **PATCH** version for backwards-compatible bug fixes

When updating versions, remember to update:
- `.claude-plugin` file
- SKILL.md frontmatter
- Any version references in documentation

### Testing Your Changes

Before submitting a PR, test your changes:

1. **Install locally**
   ```bash
   # Plugin installation
   /plugin marketplace add your-fork/claude-rubycritic-skill
   /plugin install rubycritic-skill@rubycritic-skill
   ```

2. **Test all commands**
   - Try each command variant
   - Test with different Ruby/Rails projects
   - Verify error handling

3. **Check documentation**
   - Ensure README is accurate
   - Verify examples work as described
   - Check for typos or unclear instructions

## Documentation Standards

- Use clear, concise language
- Include code examples for all features
- Keep examples realistic and practical
- Use proper markdown formatting
- Include output examples where helpful

## Commit Message Guidelines

Write clear commit messages:

- Use present tense ("Add feature" not "Added feature")
- Use imperative mood ("Move cursor to..." not "Moves cursor to...")
- First line is a summary (50 chars or less)
- Add detailed description after blank line if needed
- Reference issues/PRs when relevant

**Good examples:**
```
Add support for custom RubyCritic flags

Fix error handling for missing gem installations

Update documentation with Rails 7 examples
```

## Areas for Contribution

We especially welcome contributions in:

- **New features** - Additional analysis commands or options
- **Documentation** - Improvements, examples, tutorials
- **Bug fixes** - Addressing reported issues
- **Testing** - Edge cases, error scenarios
- **Performance** - Optimizations for large codebases
- **Integration examples** - CI/CD, pre-commit hooks, etc.

## Questions?

If you have questions about contributing:

- Open an issue with the `question` label
- Check existing issues for similar questions
- Review the [Claude Code documentation](https://docs.claude.com/en/docs/claude-code)

## Recognition

Contributors will be recognized in:
- GitHub contributors list
- Release notes for significant contributions
- README acknowledgments section

Thank you for helping make this skill better!
