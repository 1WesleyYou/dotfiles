return {
  {
    "michaelb/sniprun",
    branch = "master",
    build = "sh install.sh 1",
    cmd = { "SnipRun", "SnipInfo", "SnipClose", "SnipReset", "SnipTerminate", "SnipReplMemoryClean", "SnipLive" },
    keys = {
      { "<leader>rs", ":SnipRun<CR>", mode = { "n", "v" }, desc = "SnipRun" },
    },
    config = function() require("sniprun").setup {} end,
  },
}
