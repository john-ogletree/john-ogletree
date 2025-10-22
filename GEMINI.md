# GEMINI.md

***

**Note on Availability:** As a solo developer with client work, personal commitments, and ongoing training, my time for this project is limited. While I strive to keep everything as updated as possible, please understand that progress may not always be rapid. Your patience and understanding are greatly appreciated!

***

This file serves as a dedicated space for project-specific instructions, context, and memories relevant to the Gemini agent's operation within the `codeline44` repository. It helps Gemini understand the project's nuances and maintain continuity across sessions.

## Gemini Added Memories
- Commit and push after every file change.
- For future changes, ensure commit messages are descriptive and follow project conventions.
- Ensure everything is formatted correctly with an indentation of +1.

# GEMINI.md

***

**Note on Availability:** As a solo developer with client work, personal commitments, and ongoing training, my time for this project is limited. While I strive to keep everything as updated as possible, please understand that progress may not always be rapid. Your patience and understanding are greatly appreciated!

***

This file serves as a dedicated space for project-specific instructions, context, and memories relevant to the Gemini agent's operation within the `codeline44` repository. It helps Gemini understand the project's nuances and maintain continuity across sessions.

## Gemini Added Memories
- Commit and push after every file change.
- For future changes, ensure commit messages are descriptive and follow project conventions.
- Ensure everything is formatted correctly with an indentation of +1.

## Commit Message Conventions

To maintain a clear and consistent commit history, especially when dealing with submodules, please adhere to the following convention for commit messages in the main repository:

*   **Prefix for Coordinated Commits:** When a commit involves updates to both the main repository and its submodules (or just the main repository while acknowledging the submodule context), the commit message should start with:
    `Coordinated commit: Updated main repo and submodule references (if any)`
    This prefix should be followed by a descriptive message detailing the specific changes made in that commit.

    Example:
    `Coordinated commit: Updated main repo and submodule references (if any): Implemented new feature X in main app and updated Echo submodule to latest version.`

## Submodule Management and Coordinated Commits

To ensure proper synchronization and maintain a consistent history between the main repository (`john-ogletree`) and its submodules (e.g., `Echo`), follow these steps when managing changes:

1.  **Commit Submodule Changes First (if any):** Navigate into the submodule's directory (e.g., `cd Echo`). If there are any uncommitted changes within the submodule, stage and commit them. Push these changes to the submodule's remote repository.
    ```bash
    cd Echo
    git add .
    git commit -m "Descriptive commit message for submodule changes"
    git push origin master # Or the appropriate branch
    ```
    *If the submodule has no changes, you can skip this step.* 

2.  **Update and Commit Main Repository:** Return to the main repository's root directory (e.g., `cd ..`).
    *   If the submodule's HEAD moved (due to step 1), the main repository will now show that the submodule's reference has changed.
    *   Stage this change along with any other uncommitted changes in the main repository.
    *   Commit these changes with a message that ties both the main repo and submodule updates together (if applicable).
    *   Push to the main repository's remote.
    ```bash
    cd ..
    git add . # This will stage any updated submodule references and other main repo changes
    git commit -m "Coordinated commit: Updated main repo and submodule references (if any)"
    git push origin master # Or the appropriate branch
    ```
This workflow ensures that the main repository always points to a committed state of the submodule, and that related changes are clearly linked in the commit history. Even if the submodule itself has no new changes, any main repository changes will be committed and pushed, maintaining the overall project's history.
