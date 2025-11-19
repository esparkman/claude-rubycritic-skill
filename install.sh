#!/bin/bash

# Installation script for RubyCritic Claude Code Skill

set -e

echo "🚀 Installing RubyCritic Skill for Claude Code..."
echo ""

# Determine the skills directory
SKILLS_DIR="${HOME}/.claude/skills"

# Create skills directory if it doesn't exist
if [ ! -d "$SKILLS_DIR" ]; then
    echo "📁 Creating Claude Code skills directory..."
    mkdir -p "$SKILLS_DIR"
fi

# Create rubycritic skill directory
SKILL_DIR="${SKILLS_DIR}/rubycritic"
echo "📁 Creating RubyCritic skill directory..."
mkdir -p "$SKILL_DIR"

# Copy the SKILL.md file
if [ -f "SKILL.md" ]; then
    echo "📄 Copying SKILL.md..."
    cp SKILL.md "$SKILL_DIR/"
    echo "✅ Skill file installed to: $SKILL_DIR/SKILL.md"
else
    echo "❌ Error: SKILL.md not found in current directory"
    exit 1
fi

# Check if rubycritic gem is installed
echo ""
echo "🔍 Checking for RubyCritic gem..."
if command -v rubycritic &> /dev/null; then
    echo "✅ RubyCritic is already installed"
    rubycritic --version
else
    echo "⚠️  RubyCritic gem not found"
    read -p "Would you like to install it now? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "📦 Installing RubyCritic gem..."
        gem install rubycritic
        echo "✅ RubyCritic installed successfully"
    else
        echo "⚠️  Remember to install RubyCritic later with: gem install rubycritic"
    fi
fi

echo ""
echo "🎉 Installation complete!"
echo ""
echo "Next steps:"
echo "1. Restart Claude Code if it's currently running"
echo "2. Navigate to a Ruby/Rails project"
echo "3. Try: claude /rubycritic app/"
echo ""
echo "For more information, see INSTALLATION.md"

