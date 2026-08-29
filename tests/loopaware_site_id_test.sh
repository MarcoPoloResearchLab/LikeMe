#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
production_widget_url="https://loopaware.mprlab.com/widget.js?site_id=e7e71194-c2f3-4baa-8afe-a9aeb677c4ce"
production_pixel_url="https://loopaware.mprlab.com/pixel.js?site_id=e7e71194-c2f3-4baa-8afe-a9aeb677c4ce"

[[ "$(grep -F -c "${production_widget_url}" "${repo_root}/index.html")" -eq 1 ]] || {
  echo "error: index.html must load the LikeMe production LoopAware widget exactly once" >&2
  exit 1
}

[[ "$(grep -F -c "${production_pixel_url}" "${repo_root}/index.html")" -eq 1 ]] || {
  echo "error: index.html must load the LikeMe production LoopAware pixel exactly once" >&2
  exit 1
}

echo "LikeMe LoopAware site identifier passed"
