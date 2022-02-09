#!/bin/sh
. "$(dirname "$0")/pre-commit.sh"

echo '🏗️👷 Styling, testing and building your project before committing'

# Check Prettier standards
yarn check-format ||
(
    echo '🤢🤮🤢🤮 Its FOKING RAW - Your styling looks disgusting. 🤢🤮🤢🤮
            Prettier Check Failed. Run npm run format, add changes and try commit again.';
    false;
)

# Check ESLint Standards
yarn check-lint ||
(
        echo '😤🏀👋😤 Get that weak shit out of here! 😤🏀👋😤 
                ESLint Check Failed. Make the required changes listed above, add changes and try to commit again.'
        false; 
)

# Check tsconfig standards
yarn check-types ||
(
    echo '🤡😂❌🤡 Failed Type check. 🤡😂❌🤡
            Are you seriously trying to write that? Make the changes required above.'
    false;
)

# If everything passes... Now we can commit
echo '🤔🤔🤔🤔... Alright.... Code looks good to me... Trying to build now. 🤔🤔🤔🤔'

yarn build ||
(
    echo '❌👷🔨❌ Better call Bob... Because your build failed ❌👷🔨❌
            Next build failed: View the errors above to see why. 
    '
    false;
)

# If everything passes... Now we can commit
echo '✅✅✅✅ You win this time... I am committing this now. ✅✅✅✅'