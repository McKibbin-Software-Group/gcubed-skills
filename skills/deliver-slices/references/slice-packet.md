# Slice Packet Template

Use this compact packet to brief a child agent. Fill only relevant fields. Prefer refs over copied content.

```text
mode: delivery child
compression: use $caveman; if unavailable, use compressed technical mode
initial_response_line: ack: caveman active
fallback_initial_response_line: ack: caveman unavailable; compressed mode active
ack_scope: first child response only; do not repeat ack: caveman active in progress updates, WIP heartbeats, or final report
fallback_final_report: if $caveman is unavailable, mention compressed fallback in final report
wip_path: /tmp/deliver-slices/<repo>-<slice-id>-<agent-role>.wip.md

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

First child response only must acknowledge `$caveman` or compressed fallback exactly. Do not repeat `ack: caveman active` in progress updates, WIP heartbeats, or the final report. If `$caveman` is unavailable, mention the fallback in the final report. Inspect before editing. Preserve user changes. Keep diff narrow. Validate before reporting. Do not paste long logs; summarize command, status, key failure lines.

Update `wip_path` every 10 minutes, before long commands, and after long commands:

```text
time: <ISO timestamp>
status: working | blocked | validating
current: <one-line current activity>
changed: <files touched or none>
validated: <checks run or none>
next: <next action>
```
