# Highlight

#### What's this PR do?

#### Why is it needed?

#### Where should the reviewer start?

#### How should this be manually tested?

#### Any background context you want to provide?

#### What are the relevant issue?

#### Screenshots (if appropriate)

# Checklist

## Code Commit
- [ ] Is the branch named according to the rules?
- [ ] Ensure the source code pulled is the latest version (staging branch).
- [ ] Remove unnecessary code before merging (excess commented code, console logs, etc.).
- [ ] Review and test again after resolving conflicts and before committing.
- [ ] Review the changes in the files you modified to double-check your edits.

## General
- [ ] Are class, method, parameter, and variable names meaningful and according to naming standards?
- [ ] Have all hardcodes like magic strings and magic numbers been converted to constants or enums?
- [ ] Have all unnecessary codes, comments, unused imports been removed?
- [ ] Can newly written code be replaced by existing code or functions from other libraries?

## Third-party
- [ ] Have license or copyright terms been complied with? Confirm with the client before applying to the source code.

## Front End
- [ ] For common files, avoid customization; evaluate potential issues carefully when customizing.
- [ ] Have all class accesses and object manipulations been made null safe?
- [ ] Have the correct log levels been used?
- [ ] Convert hardcoded, repetitive strings to CONSTANTS.
- [ ] Ensure variable, file, and directory names are appropriately meaningful.
- [ ] Review changes in package.json thoroughly. Are the added libraries/packages necessary? Are new additions correctly placed in “dependencies” or “devDependencies”?
- [ ] Using styled-components library, ensure no CSS classes are written.
- [ ] Avoid inline styles on HTML tags or styled-component components.
- [ ] Have all eslint logs been fixed in files that were modified?
- [ ] Have components been broken down if possible?
- [ ] For React hooks, ensure the array dependencies and the logic within the hook do not affect the values of elements in the dependency array.
- [ ] Ensure not to use EventEmitter in child components to emit values to parent components, prefer using context or methods from parent to child.
- [ ] Ensure that components with the same rendering type and processing logic are wrapped into common or high-order components.

## Back End
- [ ] Comment at the beginning of functions if adding a new feature. Complex code should also have comments to explain.
- [ ] Instead of using if not or if !, use unless.
- [ ] Write the shortest possible logic checks.
- [ ] Avoid data queries on views, move these queries to the controller.
- [ ] Use a query interface.
- [ ] Fix all rubocop errors in modified files.
- [ ] Index foreign keys.
- [ ] Limit not-null data columns when adding new tables or columns.
- [ ] Do not arbitrarily change the current source code structure; confirm with the tech lead and client if changes are necessary.
- [ ] Limit edits to common files; if edits are necessary, assess the impact and confirm with the tech lead or client.
