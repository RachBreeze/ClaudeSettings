#!/bin/bash

# Claude Code Configuration Setup Script
# This script sets up your Claude Code configuration with custom save locations and naming

echo "🚀 Setting up Claude Code configuration..."
echo ""

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Create .claude directory if it doesn't exist
echo -e "${BLUE}Creating ~/.claude directory...${NC}"
mkdir -p ~/.claude
mkdir -p ~/.claude/commands

# Backup existing files if they exist
if [ -f ~/.claude/settings.json ]; then
    echo -e "${YELLOW}Backing up existing settings.json to settings.json.backup${NC}"
    cp ~/.claude/settings.json ~/.claude/settings.json.backup
fi

if [ -f ~/.claude/CLAUDE.md ]; then
    echo -e "${YELLOW}Backing up existing CLAUDE.md to CLAUDE.md.backup${NC}"
    cp ~/.claude/CLAUDE.md ~/.claude/CLAUDE.md.backup
fi

# Copy settings.json
echo -e "${BLUE}Installing settings.json...${NC}"
cp settings.json ~/.claude/settings.json

# Copy CLAUDE.md
echo -e "${BLUE}Installing CLAUDE.md...${NC}"
cp CLAUDE.md ~/.claude/CLAUDE.md

# Copy custom commands
echo -e "${BLUE}Installing custom commands...${NC}"
cp new-plan.md ~/.claude/commands/new-plan.md

# Set proper permissions
chmod 644 ~/.claude/settings.json
chmod 644 ~/.claude/CLAUDE.md
chmod 644 ~/.claude/commands/new-plan.md

echo ""
echo -e "${GREEN}✓ Configuration installed successfully!${NC}"
echo ""
echo "📝 Your configuration files are located at:"
echo "   - ~/.claude/settings.json"
echo "   - ~/.claude/CLAUDE.md"
echo "   - ~/.claude/commands/new-plan.md"
echo ""
echo "🔧 What was configured:"
echo "   • Plans will be saved to: ./docs/plans/"
echo "   • Naming format: plan-YYYY-MM-DD-description.md"
echo "   • Custom /new-plan command available"
echo "   • Security restrictions for sensitive files"
echo ""
echo "🎯 Next steps:"
echo "   1. Start Claude Code: claude"
echo "   2. Try the new command: /new-plan"
echo "   3. Check your config: /status"
echo ""
echo "💡 To customize further, edit:"
echo "   • nano ~/.claude/CLAUDE.md (for naming rules)"
echo "   • nano ~/.claude/settings.json (for model/permissions)"
echo ""
echo -e "${GREEN}Happy coding! 🎉${NC}"
