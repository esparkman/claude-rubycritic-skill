# RubyCritic Skill for Claude Code

[![GitHub stars](https://img.shields.io/github/stars/esparkman/claude-rubycritic-skill?style=flat-square)](https://github.com/esparkman/claude-rubycritic-skill/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/esparkman/claude-rubycritic-skill?style=flat-square)](https://github.com/esparkman/claude-rubycritic-skill/network)
[![GitHub issues](https://img.shields.io/github/issues/esparkman/claude-rubycritic-skill?style=flat-square)](https://github.com/esparkman/claude-rubycritic-skill/issues)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](https://opensource.org/licenses/MIT)
[![Ruby](https://img.shields.io/badge/Ruby-2.7+-red.svg?style=flat-square)](https://www.ruby-lang.org/)

A [Claude Code](https://docs.claude.com/en/docs/claude-code) skill that provides comprehensive code quality analysis for Ruby and Rails projects using [RubyCritic](https://github.com/whitesmith/rubycritic).

## Features

- 🔍 **Code Quality Analysis** - Get detailed metrics on complexity, duplication, and code smells
- 📊 **Multiple Analysis Types** - Full analysis, summaries, worst files, and branch comparisons
- 🎯 **Rails-Aware** - Specific guidance for models, controllers, services, and concerns
- ⚡ **Model-Invoked** - Claude automatically knows when and how to use RubyCritic
- 📈 **Track Progress** - Compare quality across branches and commits

## Installation

### Option 1: Plugin Installation (Recommended)

Install via Claude Code's plugin system for automatic updates:

```bash
# Add this repository as a marketplace
/plugin marketplace add esparkman/claude-rubycritic-skill

# Install the plugin
/plugin install rubycritic-skill@rubycritic-skill

# Install RubyCritic gem
gem install rubycritic
```

### Option 2: Manual Installation

```bash
# Clone the repository
git clone https://github.com/esparkman/claude-rubycritic-skill.git
cd claude-rubycritic-skill

# Run the install script
./install.sh
```

Or manually:

```bash
# Clone to temporary location
git clone https://github.com/esparkman/claude-rubycritic-skill.git /tmp/rubycritic-temp

# Copy the skill folder
mkdir -p ~/.claude/skills
cp -r /tmp/rubycritic-temp/skills/rubycritic-skill ~/.claude/skills/

# Install RubyCritic gem
gem install rubycritic

# Clean up
rm -rf /tmp/rubycritic-temp
```

For detailed installation instructions, see [INSTALLATION.md](INSTALLATION.md).

## Usage

This is a **model-invoked skill** - Claude automatically knows when to use it based on your requests. Navigate to any Ruby or Rails project in Claude Code and simply ask in natural language:

**Analyze entire project:**
```
Analyze the code quality of this project
```

**Analyze specific paths:**
```
Check the code quality of app/models
Run code quality analysis on app/controllers/users_controller.rb
```

**Get a summary:**
```
Give me a quick summary of the code quality metrics
```

**Find worst files:**
```
Show me the 5 worst files that need refactoring
What files have the lowest quality scores?
```

**Compare branches:**
```
Compare the code quality between this branch and main
How has code quality changed since the main branch?
```

Claude will automatically invoke RubyCritic and provide detailed analysis with actionable insights.

## Available Capabilities

The skill provides several types of analysis you can request:

| Capability | What to Ask | What You Get |
|------------|-------------|--------------|
| **Full Analysis** | "Analyze the code quality of [path]" | Complete breakdown of metrics, scores, and smells for files |
| **Summary** | "Give me a code quality summary" | Quick overview of overall project health without file details |
| **Worst Files** | "Show me the worst files" or "Find the 5 lowest scoring files" | Prioritized list of files needing immediate attention |
| **Branch Comparison** | "Compare code quality with main branch" | Diff showing quality improvements or regressions between branches |

## What Claude Can Do

When you ask about code quality, Claude will:

- Run RubyCritic analysis on your specified files or directories
- Provide detailed metrics on complexity, duplication, and code smells
- Explain what the scores mean and why they matter
- Suggest specific refactorings for identified issues
- Compare quality across branches
- Prioritize high-impact files that need attention

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

### Pre-Commit Analysis

Before committing, ask Claude to check your changes:

```
Analyze the code quality of the files I'm about to commit
```

Claude can check the staged files and provide feedback before you commit.

### Focus on High-Impact Files

Target specific areas of your codebase:

```
Analyze the code quality of app/models
```

```
Check the controllers for code quality issues
```

### Track Improvements

Monitor quality changes over time:

```
Compare the code quality of this branch with main
```

```
How has the code quality of app/services/user_service.rb improved?
```

### CI/CD Integration

In your CI pipeline, you can run RubyCritic directly:

```bash
# Run in CI to track quality trends
rubycritic app/ --minimum-score 80 --format console
```

## Troubleshooting

**Skill not appearing?**
- Plugin install: Verify with `/plugin list`
- Manual install: Check file is at `~/.claude/skills/rubycritic-skill/SKILL.md`
- Restart Claude Code
- Run `/help` to see available skills

**RubyCritic not found?**
- Install globally: `gem install rubycritic`
- Or add to Gemfile and run `bundle install`

**Analysis too slow?**
- Narrow scope: Ask to analyze specific directories instead of entire project
- Exclude paths in `.rubycritic.yml`
- Run full analysis in CI/CD only

See [INSTALLATION.md](INSTALLATION.md) for more troubleshooting tips.

## Contributing

Contributions are welcome! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines on:

- Reporting bugs and requesting features
- Submitting pull requests
- Development workflow and testing
- Documentation standards

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
