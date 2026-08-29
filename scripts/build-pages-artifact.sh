#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
output_dir="${PAGES_DIST_DIR:-${repo_root}/.pages-dist}"
required_paths=(
  CNAME
  favicon.svg
  index.html
  like-me-campaign-collage.png
  like-me-mockup-gallery.png
)

[[ "${output_dir}" != "/" && "${output_dir}" != "${repo_root}" ]] || {
  echo "error: unsafe Pages output directory: ${output_dir}" >&2
  exit 1
}

rm -rf "${output_dir}"
mkdir -p "${output_dir}"
for relative_path in "${required_paths[@]}"; do
  [[ -f "${repo_root}/${relative_path}" ]] || {
    echo "error: missing Pages source file: ${relative_path}" >&2
    exit 1
  }
  cp "${repo_root}/${relative_path}" "${output_dir}/${relative_path}"
done
printf '\n' >"${output_dir}/.nojekyll"

[[ "$(tr -d '\r\n' <"${output_dir}/CNAME")" == "likeme.mprlab.com" ]] || {
  echo "error: CNAME must be likeme.mprlab.com" >&2
  exit 1
}
echo "Prepared ${output_dir}."
