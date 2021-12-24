# Alas

Alas is a command line utility for managing a plan in a single Markdown file.

An example plan:

```markdown
# My Plan

## Inbox

- [ ] #home - Fix the lamp
- [ ] Update Rust

## 2020-08-01, Saturday

- [ ] Develop photos
- [X] Pay bills

## 2020-07-31, Friday

- Met with Mike and Molly
- [X] #work - Review open pull requests
- [X] #work - Fix the flaky test
```

## Commands

### `--stats`

`alas --stats` command will print the number of days in your plan, the number
of completed tasks and the number of pending tasks:

```bash
$ alas --stats ~/todo.md
2 days
3 completed tasks
1 pending task
```

### `--insert-days`

`alas --insert-days 3` will insert 3 new days (starting from today) in your plan
file.

### `--remove-empty-days`

`alas --remove-empty-days` will remove past days that don't have any events or
tasks from the plan.

### Running multiple commands

Alas supports running multiple commands:

```bash
alas --insert-days 3 --remove-empty-days plan.md
```
