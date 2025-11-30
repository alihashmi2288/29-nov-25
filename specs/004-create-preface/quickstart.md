# Quickstart: Creating the Preface

This guide outlines the steps to create the preface for the "Physical AI & Humanoid Robotics" book.

## 1. Create the Preface File

Create a new file named `preface.md` in the `book-project/docs/` directory.

## 2. Add Content to the Preface

Populate `preface.md` with the following content:

*   A title for the preface (e.g., `# Preface`).
*   An introduction to the "Physical AI & Humanoid Robotics" book.
*   A brief overview of each of the four modules.
*   A list of the chapters within each module, as defined in the project constitution.

## 3. Update Docusaurus Sidebar

To make the preface visible in the navigation, open the `book-project/sidebars.ts` file and add an entry for the preface. For example:

```typescript
import type {SidebarsConfig} from '@docusaurus/plugin-content-docs';

const sidebars: SidebarsConfig = {
  tutorialSidebar: [
    'intro',
    'preface', // Add this line
    {
      type: 'category',
      label: 'Tutorial',
      items: ['tutorial-basics/create-a-document'],
    },
  ],
};

export default sidebars;
```

## 4. Run Docusaurus Locally

To preview the changes, run the following commands from the `book-project` directory:

```bash
npm install
npm start
```

This will start a local development server and open up a browser window. You should be able to see the new "Preface" page in the sidebar.

## 5. Commit and Push Changes

Once you are satisfied with the preface, commit the changes to the `004-create-preface` branch and push them to the remote repository.
