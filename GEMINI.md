# GEMINI.md

***

**Note on Availability:** As a solo developer with client work, personal commitments, and ongoing training, my time for this project is limited. While I strive to keep everything as updated as possible, please understand that progress may not always be rapid. Your patience and understanding are greatly appreciated!

***

This file serves as a dedicated space for project-specific instructions, context, and memories relevant to the Gemini agent's operation within the `codeline44` repository. It helps Gemini understand the project's nuances and maintain continuity across sessions.

## Gemini Added Memories
- Commit and push after every file change.
- For future changes, ensure commit messages are descriptive and follow project conventions.
- Ensure everything is formatted correctly with an indentation of +1.

## Submodule Synchronization

To ensure proper synchronization between the main repository (`john-ogletree`) and its submodules (e.g., `Echo`), a local script `sync_echo_submodule.sh` has been created. This script handles both:

*   **Main-to-Submodule Sync:** Pushing changes made in the main repository's submodule directory to the submodule's remote.
*   **Submodule-to-Main Sync:** Pulling new commits from the submodule's remote and updating the main repository's reference.

**How to use `sync_echo_submodule.sh`:**

1.  After making any changes in the main repository or directly within a submodule's directory (e.g., `Echo/`), save your changes.
2.  Open your terminal in the root of the `john-ogletree` repository.
3.  Run the script:
    ```bash
    ./sync_echo_submodule.sh
    ```
    This script will automatically commit and push relevant changes to both the submodule's remote and the main repository.
