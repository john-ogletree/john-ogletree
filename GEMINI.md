# GEMINI.md

***

**Note on Availability:** As a solo developer with client work, personal commitments, and ongoing training, my time for this project is limited. While I strive to keep everything as updated as possible, please understand that progress may not always be rapid. Your patience and understanding are greatly appreciated!

***

This file serves as a dedicated space for project-specific instructions, context, and memories relevant to the Gemini agent's operation within the `codeline44` repository. It helps Gemini understand the project's nuances and maintain continuity across sessions.

## Gemini Added Memories
- Commit and push after every file change.
- For future changes, ensure commit messages are descriptive and follow project conventions.
- Ensure everything is formatted correctly with an indentation of +1.

## Submodule Management and Coordinated Commits

To ensure proper synchronization and maintain a consistent history between the main repository (`john-ogletree`) and its submodules (e.g., `Echo`), follow these steps when both the main repository and a submodule have uncommitted changes:

1.  **Commit Submodule Changes First:** Navigate into the submodule's directory (e.g., `cd Echo`). Stage and commit any changes within the submodule. Push these changes to the submodule's remote repository.
    ```bash
    cd Echo
    git add .
    git commit -m "Descriptive commit message for submodule changes"
    git push origin master # Or the appropriate branch
    ```
2.  **Update and Commit Main Repository:** Return to the main repository's root directory (e.g., `cd ..`). The main repository will now show that the submodule's reference has changed. Stage this change along with any other uncommitted changes in the main repository. Commit these changes with a message that ties both the main repo and submodule updates together. Push to the main repository's remote.
    ```bash
    cd ..
    git add . # This will stage the updated submodule reference and any other main repo changes
    git commit -m "Coordinated commit: Updated Echo submodule and other main repo changes"
    git push origin master # Or the appropriate branch
    ```
This workflow ensures that the main repository always points to a committed state of the submodule, and that related changes are clearly linked in the commit history.
