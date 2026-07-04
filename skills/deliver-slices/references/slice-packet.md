# Slice Packet Template

Use this compact packet to brief a child agent. Fill only relevant fields. Prefer refs over copied content.

```text
mode: delivery child
compression: use $caveman if available; otherwise terse technical mode

slice:
  id: <slice number/name>
  objective: <one outcome>
  work_refs:
    - <issue URL/id, doc path, task id>
  repo_refs:
    - <AGENTS.md/docs paths child must read>

scope:
  in:
    - <allowed files/areas/behaviors>
  out:
    - <explicit non-goals>
  preserve:
    - <known user changes, secrets, generated files, hardware state>

acceptance:
  - <observable outcome>
  - <tests/docs/deploy expectations>

validation:
  required:
    - <command/check>
  optional:
    - <command/check if relevant>

deploy:
  policy: deploy-required | deploy-if-safe | defer-deploy | no-deploy
  targets:
    - <env/device/service or none>
  revalidate:
    - <post-deploy check>

docs:
  expected:
    - <docs paths or "none unless behavior changes">

git:
  commit_policy: supervisor-commits | child-may-commit
  branch_policy: <active branch/worktree rule>

stop_if:
  - <dirty conflicting files>
  - <unsafe deploy>
  - <unclear acceptance>
  - <test failure outside slice scope>

final_report:
  required_shape: deliver-slices child final report
```

## Child Reminder

Inspect before editing. Preserve user changes. Keep diff narrow. Validate before reporting. Do not paste long logs; summarize command, status, key failure lines.
