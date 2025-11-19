# Installing the RubyCritic Skill in Claude Code

## Quick Installation

1. **Locate your Claude Code skills directory:**

```bash
# On macOS/Linux
~/.claude/skills/

# On Windows
%USERPROFILE%\.claude\skills\
```

2. **Create the skill directory:**

```bash
mkdir -p ~/.claude/skills/rubycritic
```

3. **Copy the SKILL.md file:**

```bash
cp SKILL.md ~/.claude/skills/rubycritic/
```

4. **Restart Claude Code** (if it's running)

That's it! The skill will now be available in Claude Code.

## Verification

To verify the skill is loaded:

1. Open Claude Code in your terminal
2. Type `/` to see available commands
3. Look for `/rubycritic` in the list

Or simply try:

```bash
claude /rubycritic --help
```

## Directory Structure

Your skills directory should look like this:

```
~/.claude/skills/
└── rubycritic/
    └── SKILL.md
```

## Alternative: User Skills Directory

If you want to keep custom skills separate from built-in ones:

```bash
# Create in a custom location
mkdir -p ~/my-claude-skills/rubycritic
cp SKILL.md ~/my-claude-skills/rubycritic/

# Then symlink it
ln -s ~/my-claude-skills/rubycritic ~/.claude/skills/rubycritic
```

## Installing RubyCritic Gem

The skill requires the RubyCritic gem. Install it globally:

```bash
gem install rubycritic
```

Or add to your project's Gemfile:

```ruby
group :development do
  gem 'rubycritic', require: false
end
```

Then run:

```bash
bundle install
```

## Troubleshooting

### Skill Not Appearing

1. **Check the directory path:**
   ```bash
   ls -la ~/.claude/skills/rubycritic/
   ```

2. **Verify file name is exactly `SKILL.md`** (case-sensitive)

3. **Restart Claude Code completely**

### Permission Issues

```bash
chmod -R 755 ~/.claude/skills/
```

### RubyCritic Not Found

Make sure RubyCritic is in your PATH:

```bash
which rubycritic
# Should output: /path/to/rubycritic

# If not found, install it:
gem install rubycritic
```

## Updating the Skill

To update the skill with new features:

1. Replace the SKILL.md file
2. Restart Claude Code
3. Changes will be reflected immediately

## Multiple Skills

You can install multiple skills. Each gets its own directory:

```
~/.claude/skills/
├── rubycritic/
│   └── SKILL.md
├── rspec/
│   └── SKILL.md
└── rails-generators/
    └── SKILL.md
```

## Next Steps

Once installed, try these commands in your Rails project:

```bash
# Analyze your entire app
claude /rubycritic app/

# Check your models
claude /rubycritic app/models

# Find the worst files
claude /rubycritic-worst --limit 5
```
