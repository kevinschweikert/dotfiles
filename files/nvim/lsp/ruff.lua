return {
  cmd = { "ruff", "server" },
  root_markers = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
    "pyrightconfig.json",
    ".git",
    "uv.lock",
  },
  filetypes = { "python" },
}
