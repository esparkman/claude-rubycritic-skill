# RubyCritic Skill for Claude Code

A [Claude Code](https://docs.claude.com/en/docs/claude-code) skill that provides comprehensive code quality analysis for Ruby and Rails projects using [RubyCritic](https://github.com/whitesmith/rubycritic).

## Features

- 🔍 **Code Quality Analysis** - Get detailed metrics on complexity, duplication, and code smells
- 📊 **Multiple Commands** - Full analysis, summaries, worst files, and branch comparisons
- 🎯 **Rails-Aware** - Specific guidance for models, controllers, services, and concerns
- ⚡ **Quick Feedback** - Simple slash commands in Claude Code
- 📈 **Track Progress** - Compare quality across branches and commits

## Installation

### Quick Install

```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/claude-rubycritic-skill.git
cd claude-rubycritic-skill

# Run the install script
./install.sh
```

### Manual Install

```bash
# Create the skills directory
mkdir -p ~/.claude/skills/rubycritic

# Copy the skill file
cp SKILL.md ~/.claude/skills/rubycritic/

# Install RubyCritic gem
gem install rubycritic
```

For detailed installation instructions, see [INSTALLATION.md](INSTALLATION.md).

## Usage

Navigate to any Ruby or Rails project and use these commands in Claude Code:

```bash
# Analyze entire project
claude /rubycritic

# Analyze specific path
claude /rubycritic app/models

# Get a quick summary
claude /rubycritic-summary

# Find the worst files
claude /rubycritic-worst --limit 5

# Compare with another branch
claude /rubycritic-compare main
```

## Available Commands

| Command | Description |
|---------|-------------|
| `/rubycritic [path]` | Analyze code quality for specified path or entire project |
| `/rubycritic-summary` | Quick overview of quality metrics |
| `/rubycritic-worst` | Show files needing most attention |
| `/rubycritic-compare [branch]` | Compare quality between branches |

## Understanding the Results

**Score Grades:**
- **A (90-100)**: Excellent - minimal issues
- **B (80-89)**: Good - minor improvements needed
- **C (70-79)**: Fair - consider refactoring
- **D (60-69)**: Poor - refactoring recommended
- **F (<60)**: Critical - immediate attention required

**Key Metrics:**
- **Churn**: How frequently files change (high churn + low quality = priority)
- **Complexity**: Cyclomatic complexity (aim for < 10 per method)
- **Duplication**: Code duplication percentage (aim for < 5%)
- **Smells**: Code smell count by type (Long Method, Feature Envy, etc.)

## Configuration

Create a `.rubycritic.yml` in your project root:

```yaml
# Minimum acceptable score
minimum_score: 80.0

# Paths to exclude
paths:
  - 'db/schema.rb'
  - 'db/migrate/**/*'
  - 'config/**/*'
  - 'spec/factories/**/*'

# Enable analyzers
analyzers:
  - flay
  - flog
  - reek

# Output format
formats:
  - console
  - html
```

## Requirements

- Ruby 2.7 or higher
- [Claude Code](https://docs.claude.com/en/docs/claude-code)
- [RubyCritic](https://github.com/whitesmith/rubycritic) gem

## Examples

### Pre-Commit Hook

```bash
# Check changed files before committing
claude /rubycritic $(git diff --name-only --cached | grep '\.rb$')
```

### Focus on High-Impact Files

```bash
# Analyze models (usually high-churn)
claude /rubycritic app/models

# Check controllers for fat controller issues
claude /rubycritic app/controllers
```

### Track Improvements

```bash
# Compare current work with main branch
claude /rubycritic-compare main

# See what improved after refactoring
claude /rubycritic app/services/user_service.rb
```

## Troubleshooting

**Skill not appearing?**
- Verify file is at `~/.claude/skills/rubycritic/SKILL.md`
- Restart Claude Code
- Check file permissions: `chmod 755 ~/.claude/skills/rubycritic/SKILL.md`

**RubyCritic not found?**
- Install globally: `gem install rubycritic`
- Or add to Gemfile and run `bundle install`

**Analysis too slow?**
- Narrow scope: `/rubycritic app/models` instead of entire project
- Exclude paths in `.rubycritic.yml`
- Run full analysis in CI/CD only

See [INSTALLATION.md](INSTALLATION.md) for more troubleshooting tips.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

MIT License - see [LICENSE](LICENSE) for details.

## Resources

- [Claude Code Documentation](https://docs.claude.com/en/docs/claude-code)
- [RubyCritic GitHub](https://github.com/whitesmith/rubycritic)
- [Code Smells Reference](https://github.com/troessner/reek/blob/master/docs/Code-Smells.md)
- [Rails Best Practices](https://rails-bestpractices.com/)

## Acknowledgments

- Built for [Claude Code](https://docs.claude.com/en/docs/claude-code) by Anthropic
- Powered by [RubyCritic](https://github.com/whitesmith/rubycritic)
- Inspired by the Ruby and Rails community's commitment to code quality

---

Made with ❤️ for Ruby and Rails developers
