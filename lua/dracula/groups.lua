---@class Highlight
---@variable.member fg string color name or "#RRGGBB"
---@variable.member foreground string same fg, color name or "#RRGGBB"
---@variable.member bg string color name or "#RRGGBB"
---@variable.member background string same bg, color name or "#RRGGBB"
---@variable.member sp string color name or "#RRGGBB"
---@variable.member special string same sg, color name or "#RRGGBB"
---@variable.member blend integer value between 0 and 100
---@variable.member bold boolean
---@variable.member standout boolean
---@variable.member underline boolean
---@variable.member undercurl boolean
---@variable.member underdouble boolean
---@variable.member underdotted boolean
---@variable.member underdashed boolean
---@variable.member strikethrough boolean
---@variable.member italic boolean
---@variable.member reverse boolean
---@variable.member nocombine boolean
---@variable.member link string name of another highlight group to link to, see |:hi-link|.
---@variable.member default string Don't override existing definition |:hi-default|
---@variable.member ctermfg integer Sets foreground of cterm color |highlight-ctermfg|
---@variable.member ctermbg integer Sets background of cterm color |highlight-ctermbg|
---@variable.member cterm table cterm attribute map, like |highlight-args|.

---@alias HighlightGroups table<string, Highlight>

---setup highlight groups
---@param configs DraculaConfig
---@return HighlightGroups
---@nodiscard
local function setup(configs)
   local colors = configs.colors
   assert(colors ~= nil, "Must pass colors")

   local endOfBuffer = {
      fg = configs.show_end_of_buffer and colors.visual or colors.bg,
   }

   return {
      Normal = { fg = colors.fg, bg = colors.bg, },
      NormalFloat = { fg = colors.fg, bg = colors.bg, },
      Comment = { fg = colors.comment, italic = configs.italic_comment, },
      Constant = { fg = colors.yellow, },
      String = { fg = colors.yellow, },
      Character = { fg = colors.green, },
      Number = { fg = colors.orange, },
      Boolean = { fg = colors.cyan, },
      Float = { fg = colors.orange, },
      FloatBorder = { fg = colors.white, },
      Operator = { fg = colors.purple, },
      Keyword = { fg = colors.cyan, },
      Keywords = { fg = colors.cyan, },
      Identifier = { fg = colors.cyan, },
      Function = { fg = colors.yellow, },
      Statement = { fg = colors.purple, },
      Conditional = { fg = colors.pink, },
      Repeat = { fg = colors.pink, },
      Label = { fg = colors.cyan, },
      Exception = { fg = colors.purple, },
      PreProc = { fg = colors.yellow, },
      Include = { fg = colors.purple, },
      Define = { fg = colors.purple, },
      Title = { fg = colors.cyan, },
      Macro = { fg = colors.purple, },
      PreCondit = { fg = colors.cyan, },
      Type = { fg = colors.cyan, },
      StorageClass = { fg = colors.pink, },
      Structure = { fg = colors.yellow, },
      TypeDef = { fg = colors.yellow, },
      Special = { fg = colors.green, italic = true },
      SpecialComment = { fg = colors.comment, italic = true, },
      Error = { fg = colors.bright_red, },
      Todo = { fg = colors.purple, bold = true, italic = true, },
      Underlined = { fg = colors.cyan, underline = true, },

      Cursor = { reverse = true, },
      CursorLineNr = { fg = colors.fg, bold = true, },

      SignColumn = { bg = colors.bg, },

      Conceal = { fg = colors.comment, },
      CursorColumn = { bg = colors.black, },
      CursorLine = { bg = colors.selection, },
      ColorColumn = { bg = colors.selection, },

      StatusLine = { fg = colors.white, bg = colors.black, },
      StatusLineNC = { fg = colors.comment, },
      StatusLineTerm = { fg = colors.white, bg = colors.black, },
      StatusLineTermNC = { fg = colors.comment, },

      Directory = { fg = colors.cyan, },
      DiffAdd = { fg = colors.bg, bg = colors.green, },
      DiffChange = { fg = colors.orange, },
      DiffDelete = { fg = colors.red, },
      DiffText = { fg = colors.comment, },

      ErrorMsg = { fg = colors.bright_red, },
      VertSplit = { fg = colors.black, },
      WinSeparator = { fg = colors.black, },
      Folded = { fg = colors.comment, },
      FoldColumn = {},
      Search = { fg = colors.black, bg = colors.orange, },
      IncSearch = { fg = colors.orange, bg = colors.comment, },
      LineNr = { fg = colors.comment, },
      MatchParen = { fg = colors.fg, underline = true, },
      NonText = { fg = colors.nontext, },
      Pmenu = { fg = colors.white, bg = colors.menu, },
      PmenuSel = { fg = colors.white, bg = colors.selection, },
      PmenuSbar = { bg = colors.bg, },
      PmenuThumb = { bg = colors.selection, },

      Question = { fg = colors.purple, },
      QuickFixLine = { fg = colors.black, bg = colors.yellow, },
      SpecialKey = { fg = colors.nontext, },

      SpellBad = { fg = colors.bright_red, underline = true, },
      SpellCap = { fg = colors.yellow, },
      SpellLocal = { fg = colors.yellow, },
      SpellRare = { fg = colors.yellow, },

      TabLine = { fg = colors.comment, },
      TabLineSel = { fg = colors.white, },
      TabLineFill = { bg = colors.bg, },
      Terminal = { fg = colors.white, bg = colors.black, },
      Visual = { bg = colors.visual, },
      VisualNOS = { fg = colors.visual, },
      WarningMsg = { fg = colors.yellow, },
      WildMenu = { fg = colors.black, bg = colors.white, },

      EndOfBuffer = endOfBuffer,

      -- TreeSitter
      ['@error'] = { fg = colors.bright_red, },
      ['@punctuation.delimiter'] = { fg = colors.fg, },
      ['@punctuation.bracket'] = { fg = colors.fg, },
      ['@markup.list'] = { fg = colors.cyan, },

      ['@constant'] = { fg = colors.purple, },
      ['@constant.builtin'] = { fg = colors.purple, },
      ['@markup.link.label.symbol'] = { fg = colors.purple, },

      ['@constant.macro'] = { fg = colors.cyan, },
      ['@string.regexp'] = { fg = colors.red, },
      ['@string'] = { fg = colors.yellow, },
      ['@string.escape'] = { fg = colors.cyan, },
      ['@string.special.symbol'] = { fg = colors.purple, },
      ['@character'] = { fg = colors.green, },
      ['@number'] = { fg = colors.purple, },
      ['@boolean'] = { fg = colors.purple, },
      ['@number.float'] = { fg = colors.green, },
      ['@annotation'] = { fg = colors.yellow, },
      ['@attribute'] = { fg = colors.cyan, },
      ['@module'] = { fg = colors.orange, },

      ['@function.builtin'] = { fg = colors.cyan, },
      ['@function'] = { fg = colors.green, },
      ['@function.macro'] = { fg = colors.green, },
      ['@variable.parameter'] = { fg = colors.orange, },
      ['@variable.parameter.reference'] = { fg = colors.orange, },
      ['@function.method'] = { fg = colors.green, },
      ['@variable.member'] = { fg = colors.orange, },
      ['@property'] = { fg = colors.purple, },
      ['@constructor'] = { fg = colors.cyan, },

      ['@keyword.conditional'] = { fg = colors.pink, },
      ['@keyword.repeat'] = { fg = colors.pink, },
      ['@label'] = { fg = colors.cyan, },

      ['@keyword'] = { fg = colors.pink, },
      ['@keyword.function'] = { fg = colors.cyan, },
      ['@keyword.function.ruby'] = { fg = colors.pink, },
      ['@keyword.operator'] = { fg = colors.pink, },
      ['@operator'] = { fg = colors.pink, },
      ['@keyword.exception'] = { fg = colors.purple, },
      ['@type'] = { fg = colors.bright_cyan, },
      ['@type.builtin'] = { fg = colors.cyan, italic = true, },
      ['@type.qualifier'] = { fg = colors.pink, },
      ['@structure'] = { fg = colors.purple, },
      ['@keyword.include'] = { fg = colors.pink, },

      ['@variable'] = { fg = colors.fg, },
      ['@variable.builtin'] = { fg = colors.purple, },

      ['@markup'] = { fg = colors.orange, },
      ['@markup.strong'] = { fg = colors.orange, bold = true, },     -- bold
      ['@markup.emphasis'] = { fg = colors.yellow, italic = true, }, -- italic
      ['@markup.underline'] = { fg = colors.orange, },
      ['@markup.heading'] = { fg = colors.pink, bold = true, },        -- title
      ['@markup.raw'] = { fg = colors.yellow, },                 -- inline code
      ['@markup.link.url'] = { fg = colors.yellow, italic = true, },      -- urls
      ['@markup.link'] = { fg = colors.orange, bold = true, },

      ['@tag'] = { fg = colors.cyan, },
      ['@tag.attribute'] = { fg = colors.green, },
      ['@tag.delimiter'] = { fg = colors.cyan, },

      -- Semantic
      ['@class'] = { fg = colors.cyan },
      ['@struct'] = { fg = colors.cyan },
      ['@enum'] = { fg = colors.cyan },
      ['@enumMember'] = { fg = colors.purple },
      ['@event'] = { fg = colors.cyan },
      ['@interface'] = { fg = colors.cyan },
      ['@modifier'] = { fg = colors.cyan },
      ['@regexp'] = { fg = colors.yellow },
      ['@typeParameter'] = { fg = colors.cyan },
      ['@decorator'] = { fg = colors.cyan },

      -- LSP Semantic (0.9+)
      ['@lsp.type.class'] = { fg = colors.cyan },
      ['@lsp.type.enum'] = { fg = colors.cyan },
      ['@lsp.type.decorator'] = { fg = colors.green },
      ['@lsp.type.enumMember'] = { fg = colors.purple },
      ['@lsp.type.function'] = { fg = colors.green, },
      ['@lsp.type.interface'] = { fg = colors.cyan },
      ['@lsp.type.macro'] = { fg = colors.cyan },
      ['@lsp.type.method'] = { fg = colors.green, },
      ['@lsp.type.namespace'] = { fg = colors.orange, },
      ['@lsp.type.parameter'] = { fg = colors.orange, },
      ['@lsp.type.property'] = { fg = colors.purple, },
      ['@lsp.type.struct'] = { fg = colors.cyan },
      ['@lsp.type.type'] = { fg = colors.bright_cyan, },
      ['@lsp.type.variable'] = { fg = colors.fg, },

      -- HTML
      htmlArg = { fg = colors.green, },
      htmlBold = { fg = colors.yellow, bold = true, },
      htmlEndTag = { fg = colors.cyan, },
      htmlH1 = { fg = colors.pink, },
      htmlH2 = { fg = colors.pink, },
      htmlH3 = { fg = colors.pink, },
      htmlH4 = { fg = colors.pink, },
      htmlH5 = { fg = colors.pink, },
      htmlH6 = { fg = colors.pink, },
      htmlItalic = { fg = colors.purple, italic = true, },
      htmlLink = { fg = colors.purple, underline = true, },
      htmlSpecialChar = { fg = colors.yellow, },
      htmlSpecialTagName = { fg = colors.cyan, },
      htmlTag = { fg = colors.cyan, },
      htmlTagN = { fg = colors.cyan, },
      htmlTagName = { fg = colors.cyan, },
      htmlTitle = { fg = colors.white, },

      -- Markdown
      markdownBlockquote = { fg = colors.yellow, italic = true, },
      markdownBold = { fg = colors.orange, bold = true, },
      markdownCode = { fg = colors.green, },
      markdownCodeBlock = { fg = colors.orange, },
      markdownCodeDelimiter = { fg = colors.red, },
      markdownH2 = { link = "rainbow2" },
      markdownH1 = { link = "rainbow1" },
      markdownH3 = { link = "rainbow3" },
      markdownH4 = { link = "rainbow4" },
      markdownH5 = { link = "rainbow5" },
      markdownH6 = { link = "rainbow6" },
      markdownHeadingDelimiter = { fg = colors.red, },
      markdownHeadingRule = { fg = colors.comment, },
      markdownId = { fg = colors.purple, },
      markdownIdDeclaration = { fg = colors.cyan, },
      markdownIdDelimiter = { fg = colors.purple, },
      markdownItalic = { fg = colors.yellow, italic = true, },
      markdownLinkDelimiter = { fg = colors.purple, },
      markdownLinkText = { fg = colors.pink, },
      markdownListMarker = { fg = colors.cyan, },
      markdownOrderedListMarker = { fg = colors.red, },
      markdownRule = { fg = colors.comment, },
      ['@markup.heading.1.markdown'] = { link = 'rainbowcol1' },
		['@markup.heading.2.markdown'] = { link = 'rainbowcol2' },
		['@markup.heading.3.markdown'] = { link = 'rainbowcol3' },
		['@markup.heading.4.markdown'] = { link = 'rainbowcol4' },
		['@markup.heading.5.markdown'] = { link = 'rainbowcol5' },
		['@markup.heading.6.markdown'] = { link = 'rainbowcol6' },

      --  Diff
      diffAdded = { fg = colors.green, },
      diffRemoved = { fg = colors.red, },
      diffFileId = { fg = colors.yellow, bold = true, reverse = true, },
      diffFile = { fg = colors.nontext, },
      diffNewFile = { fg = colors.green, },
      diffOldFile = { fg = colors.red, },

      debugPc = { bg = colors.menu, },
      debugBreakpoint = { fg = colors.red, reverse = true, },

      -- Git Signs
      GitSignsAdd = { fg = colors.bright_green, },
      GitSignsChange = { fg = colors.cyan, },
      GitSignsDelete = { fg = colors.bright_red, },
      GitSignsAddLn = { fg = colors.black, bg = colors.bright_green, },
      GitSignsChangeLn = { fg = colors.black, bg = colors.cyan, },
      GitSignsDeleteLn = { fg = colors.black, bg = colors.bright_red, },
      GitSignsCurrentLineBlame = { fg = colors.white, },

      -- Telescope
      TelescopePromptBorder = { fg = colors.comment, },
      TelescopeResultsBorder = { fg = colors.comment, },
      TelescopePreviewBorder = { fg = colors.comment, },
      TelescopeSelection = { fg = colors.white, bg = colors.selection, },
      TelescopeMultiSelection = { fg = colors.purple, bg = colors.selection, },
      TelescopeNormal = { fg = colors.fg, bg = colors.bg, },
      TelescopeMatching = { fg = colors.green, },
      TelescopePromptPrefix = { fg = colors.purple, },
      TelescopeResultsDiffDelete = { fg = colors.red },
      TelescopeResultsDiffChange = { fg = colors.cyan },
      TelescopeResultsDiffAdd = { fg = colors.green },

      -- Flash
      FlashLabel =  { bg = colors.red, fg = colors.bright_white },

      -- NvimTree
      NvimTreeNormal = { fg = colors.fg, bg = colors.menu, },
      NvimTreeVertSplit = { fg = colors.bg, bg = colors.bg, },
      NvimTreeRootFolder = { fg = colors.fg, bold = true, },
      NvimTreeGitDirty = { fg = colors.yellow, },
      NvimTreeGitNew = { fg = colors.bright_green, },
      NvimTreeImageFile = { fg = colors.pink, },
      NvimTreeFolderIcon = { fg = colors.purple, },
      NvimTreeIndentMarker = { fg = colors.nontext, },
      NvimTreeEmptyFolderName = { fg = colors.comment, },
      NvimTreeFolderName = { fg = colors.fg, },
      NvimTreeSpecialFile = { fg = colors.pink, underline = true, },
      NvimTreeOpenedFolderName = { fg = colors.fg, },
      NvimTreeCursorLine = { bg = colors.selection, },
      NvimTreeIn = { bg = colors.selection, },

      NvimTreeEndOfBuffer = endOfBuffer,

      -- NeoTree
      NeoTreeNormal = { fg = colors.fg, bg = colors.menu, },
      NeoTreeNormalNC = { fg = colors.fg, bg = colors.menu, },
      NeoTreeDirectoryName = { fg = colors.fg },
      NeoTreeGitUnstaged = { fg = colors.bright_magenta },
      NeoTreeGitModified = { fg = colors.bright_magenta },
      NeoTreeGitUntracked = { fg = colors.bright_green },
      NeoTreeDirectoryIcon = { fg = colors.purple },
      NeoTreeIndentMarker = { fg = colors.nontext },
      NeoTreeDotfile = { fg = colors.comment },

      -- Bufferline
      BufferLineIndicatorSelected = { fg = colors.purple, },
      BufferLineFill = { bg = colors.black, },
      BufferLineBufferSelected = { bg = colors.bg, },
      BufferLineSeparator = { fg = colors.black },

      -- LSP
      DiagnosticError = { fg = colors.red, },
      DiagnosticWarn = { fg = colors.yellow, },
      DiagnosticInfo = { fg = colors.cyan, },
      DiagnosticHint = { fg = colors.cyan, },
      DiagnosticUnderlineError = { undercurl = true, sp = colors.red, },
      DiagnosticUnderlineWarn = { undercurl = true, sp = colors.yellow, },
      DiagnosticUnderlineInfo = { undercurl = true, sp = colors.cyan, },
      DiagnosticUnderlineHint = { undercurl = true, sp = colors.cyan, },
      DiagnosticSignError = { fg = colors.red, },
      DiagnosticSignWarn = { fg = colors.yellow, },
      DiagnosticSignInfo = { fg = colors.cyan, },
      DiagnosticSignHint = { fg = colors.cyan, },
      DiagnosticFloatingError = { fg = colors.red, },
      DiagnosticFloatingWarn = { fg = colors.yellow, },
      DiagnosticFloatingInfo = { fg = colors.cyan, },
      DiagnosticFloatingHint = { fg = colors.cyan, },
      DiagnosticVirtualTextError = { fg = colors.red, },
      DiagnosticVirtualTextWarn = { fg = colors.yellow, },
      DiagnosticVirtualTextInfo = { fg = colors.cyan, },
      DiagnosticVirtualTextHint = { fg = colors.cyan, },

      LspDiagnosticsDefaultError = { fg = colors.red, },
      LspDiagnosticsDefaultWarning = { fg = colors.yellow, },
      LspDiagnosticsDefaultInformation = { fg = colors.cyan, },
      LspDiagnosticsDefaultHint = { fg = colors.cyan, },
      LspDiagnosticsUnderlineError = { fg = colors.red, undercurl = true, },
      LspDiagnosticsUnderlineWarning = { fg = colors.yellow, undercurl = true, },
      LspDiagnosticsUnderlineInformation = { fg = colors.cyan, undercurl = true, },
      LspDiagnosticsUnderlineHint = { fg = colors.cyan, undercurl = true, },
      LspReferenceText = { fg = colors.orange, },
      LspReferenceRead = { fg = colors.orange, },
      LspReferenceWrite = { fg = colors.orange, },
      LspCodeLens = { fg = colors.cyan, },
      LspInlayHint = { fg = "#969696", bg = "#2f3146" },

      --LSP Saga
      LspFloatWinNormal = { fg = colors.fg, },
      LspFloatWinBorder = { fg = colors.comment, },
      LspSagaHoverBorder = { fg = colors.comment, },
      LspSagaSignatureHelpBorder = { fg = colors.comment, },
      LspSagaCodeActionBorder = { fg = colors.comment, },
      LspSagaDefPreviewBorder = { fg = colors.comment, },
      LspLinesDiagBorder = { fg = colors.comment, },
      LspSagaRenameBorder = { fg = colors.comment, },
      LspSagaBorderTitle = { fg = colors.menu, },
      LSPSagaDiagnosticTruncateLine = { fg = colors.comment, },
      LspSagaDiagnosticBorder = { fg = colors.comment, },
      LspSagaShTruncateLine = { fg = colors.comment, },
      LspSagaDocTruncateLine = { fg = colors.comment, },
      LspSagaLspFinderBorder = { fg = colors.comment, },
      CodeActionNumber = { bg = 'NONE', fg = colors.cyan },

      -- IndentBlankLine
      IndentBlanklineContextChar = { fg = colors.bright_red, nocombine = true, },

      -- Nvim compe
      CmpItemAbbrDeprecated = { fg = colors.white, bg = colors.bg, },
      CmpItemAbbrMatch = { fg = colors.cyan, bg = colors.bg, },

      -- barbar
      BufferVisibleTarget = { fg = colors.red },
      BufferTabpages = { fg = colors.nontext, bg = colors.black, bold = true },
      BufferTabpageFill = { fg = colors.nontext, bg = colors.black },
      BufferCurrentSign = { fg = colors.purple },
      BufferCurrentTarget = { fg = colors.red },
      BufferInactive = { fg = colors.comment, bg = colors.black, italic = true },
      BufferInactiveIndex = { fg = colors.nontext, bg = colors.black, italic = true },
      BufferInactiveMod = { fg = colors.yellow, bg = colors.black, italic = true },
      BufferInactiveSign = { fg = colors.nontext, bg = colors.black, italic = true },
      BufferInactiveTarget = { fg = colors.red, bg = colors.black, bold = true },

      -- Compe
      CompeDocumentation = { link = "Pmenu" },
      CompeDocumentationBorder = { link = "Pmenu" },

      -- Cmp
      CmpItemAbbr = { fg = colors.white, bg = colors.bg },
      CmpItemKind = { fg = colors.white, bg = colors.bg },
      CmpItemKindMethod = { link = "@function.method" },
      CmpItemKindText = { link = "@markup" },
      CmpItemKindFunction = { link = "@function" },
      CmpItemKindConstructor = { link = "@type" },
      CmpItemKindVariable = { link = "@variable" },
      CmpItemKindClass = { link = "@type" },
      CmpItemKindInterface = { link = "@type" },
      CmpItemKindModule = { link = "@module" },
      CmpItemKindProperty = { link = "@property" },
      CmpItemKindOperator = { link = "@operator" },
      CmpItemKindReference = { link = "@variable.parameter.reference" },
      CmpItemKindUnit = { link = "@variable.member" },
      CmpItemKindValue = { link = "@variable.member" },
      CmpItemKindField = { link = "@variable.member" },
      CmpItemKindEnum = { link = "@variable.member" },
      CmpItemKindKeyword = { link = "@keyword" },
      CmpItemKindSnippet = { link = "@markup" },
      CmpItemKindColor = { link = "DevIconCss" },
      CmpItemKindFile = { link = "TSURI" },
      CmpItemKindFolder = { link = "TSURI" },
      CmpItemKindEvent = { link = "@constant" },
      CmpItemKindEnumMember = { link = "@variable.member" },
      CmpItemKindConstant = { link = "@constant" },
      CmpItemKindStruct = { link = "@structure" },
      CmpItemKindTypeParameter = { link = "@variable.parameter" },

      -- Blink
      BlinkCmpLabel = { fg = colors.white, bg = colors.menu },
      BlinkCmpLabelDeprecated = { fg = colors.white, bg = colors.menu },
      BlinkCmpLabelMatch = { fg = colors.cyan, bg = colors.menu },
      BlinkCmpKind = { fg = colors.white, bg = colors.menu },
      BlinkCmpScrollBarThumb = { bg = colors.fg },
      BlinkCmpScrollBarGutter = { bg = colors.menu },
      BlinkCmpKindFunction = { link = "@function" },
      BlinkCmpKindConstructor = { link = "@type" },
      BlinkCmpKindVariable = { link = "@variable" },
      BlinkCmpKindClass = { link = "@type" },
      BlinkCmpKindInterface = { link = "@type" },
      BlinkCmpKindModule = { link = "@module" },
      BlinkCmpKindProperty = { link = "@property" },
      BlinkCmpKindOperator = { link = "@operator" },
      BlinkCmpKindReference = { link = "@variable.parameter.reference" },
      BlinkCmpKindUnit = { link = "@variable.member" },
      BlinkCmpKindValue = { link = "@variable.member" },
      BlinkCmpKindField = { link = "@variable.member" },
      BlinkCmpKindEnum = { link = "@variable.member" },
      BlinkCmpKindKeyword = { link = "@keyword" },
      BlinkCmpKindSnippet = { link = "@markup" },
      BlinkCmpKindColor = { link = "DevIconCss" },
      BlinkCmpKindFile = { link = "TSURI" },
      BlinkCmpKindFolder = { link = "TSURI" },
      BlinkCmpKindEvent = { link = "@constant" },
      BlinkCmpKindEnumMember = { link = "@variable.member" },
      BlinkCmpKindConstant = { link = "@constant" },
      BlinkCmpKindStruct = { link = "@structure" },
      BlinkCmpKindTypeParameter = { link = "@variable.parameter" },

      -- navic
      NavicIconsFile = { link = "CmpItemKindFile" },
      NavicIconsModule = { link = "CmpItemKindModule" },
      NavicIconsNamespace = { link = "CmpItemKindModule" },
      NavicIconsPackage = { link = "CmpItemKindModule" },
      NavicIconsClass = { link = "CmpItemKindClass" },
      NavicIconsMethod = { link = "CmpItemKindMethod" },
      NavicIconsProperty = { link = "CmpItemKindProperty" },
      NavicIconsField = { link = "CmpItemKindField" },
      NavicIconsConstructor = { link = "CmpItemKindConstructor" },
      NavicIconsEnum = { link = "CmpItemKindEnum" },
      NavicIconsInterface = { link = "CmpItemKindInterface" },
      NavicIconsFunction = { link = "CmpItemKindFunction" },
      NavicIconsVariable = { link = "CmpItemKindVariable" },
      NavicIconsConstant = { link = "CmpItemKindConstant" },
      NavicIconsString = { link = "String" },
      NavicIconsNumber = { link = "Number" },
      NavicIconsBoolean = { link = "Boolean" },
      NavicIconsArray = { link = "CmpItemKindClass" },
      NavicIconsObject = { link = "CmpItemKindClass" },
      NavicIconsKey = { link = "CmpItemKindKeyword" },
      NavicIconsKeyword = { link = "CmpItemKindKeyword" },
      NavicIconsNull = { fg = "blue" },
      NavicIconsEnumMember = { link = "CmpItemKindEnumMember" },
      NavicIconsStruct = { link = "CmpItemKindStruct" },
      NavicIconsEvent = { link = "CmpItemKindEvent" },
      NavicIconsOperator = { link = "CmpItemKindOperator" },
      NavicIconsTypeParameter = { link = "CmpItemKindTypeParameter" },
      NavicText = { fg = 'gray' },
      NavicSeparator = { fg = 'gray' },

      -- TS rainbow colors
      rainbowcol1 = { fg = colors.fg },
      rainbowcol2 = { fg = colors.pink },
      rainbowcol3 = { fg = colors.cyan },
      rainbowcol4 = { fg = colors.green },
      rainbowcol5 = { fg = colors.purple },
      rainbowcol6 = { fg = colors.orange },
      rainbowcol7 = { fg = colors.fg },

      -- Rainbow delimiter
      RainbowDelimiterRed = { fg = colors.fg },
      RainbowDelimiterYellow = {fg = colors.pink },
      RainbowDelimiterBlue = {fg = colors.cyan },
      RainbowDelimiterOrange = { fg = colors.green },
      RainbowDelimiterGreen = { fg = colors.purple },
      RainbowDelimiterViolet = { fg = colors.orange },
      RainbowDelimiterCyan = { fg = colors.fg },

      -- mini.indentscope
      MiniIndentscopeSymbol = { fg = "#B5629B" },
      MiniIndentscopeSymbolOff = { fg = "#B5629B" },

      -- mini.icons
      MiniIconsAzure = { fg = colors.bright_cyan },
      MiniIconsBlue = { fg = colors.bright_blue },
      MiniIconsCyan = { fg = colors.cyan },
      MiniIconsGrey = { fg = colors.white },
      MiniIconsOrange = { fg = colors.orange },
      MiniIconsPurple = { fg = colors.purple },
      MiniIconsRed = { fg = colors.red },
      MiniIconsYellow = { fg = colors.yellow },

      -- mini.statusline
      MiniStatuslineModeNormal = { fg = colors.black, bg = colors.purple, bold = true },
      MiniStatuslineModeInsert = { fg = colors.black, bg = colors.green, bold = true },
      MiniStatuslineModeVisual = { fg = colors.black, bg = colors.pink, bold = true },
      MiniStatuslineModeReplace = { fg = colors.black, bg = colors.yellow, bold = true },
      MiniStatuslineModeCommand = { fg = colors.black, bg = colors.cyan, bold = true },
      MiniStatuslineInactive = { fg = colors.fg, bg = colors.visual, bold = true },
      MiniStatuslineDevinfo = { fg = colors.purple, bg = colors.black },
      MiniStatuslineFilename = { fg = colors.white, bg = colors.black },
      MiniStatuslineFileinfo = { fg = colors.purple, bg = colors.black },

      -- mini.files
      MiniFilesNormal = { fg = colors.fg, bg = colors.menu },
      MiniFilesBorder = { fg = colors.purple, bg = colors.menu },
      MiniFilesBorderModified = { },
      MiniFilesCursorLine = { bg = colors.selection, },
      MiniFilesDirectory = { fg = colors.fg },
      MiniFilesFile = { fg = colors.fg },
      MiniFilesTitle = { fg = colors.fg },
      MiniFilesTitleFocused = { fg = colors.yellow },

      -- goolord/alpha-nvim
      AlphaHeader = { fg = colors.purple },
      AlphaButtons = { fg = colors.cyan },
      AlphaShortcut = { fg = colors.orange },
      AlphaFooter = { fg = colors.purple, italic = true },

      -- nvimdev/dashboard-nvim
      DashboardShortCut = { fg = colors.cyan },
      DashboardHeader = { fg = colors.purple },
      DashboardCenter = { fg = colors.fg },
      DashboardFooter = { fg = colors.purple, italic = true },
      DashboardKey = { fg = colors.orange },
      DashboardDesc = { fg = colors.cyan },
      DashboardIcon = { fg = colors.cyan, bold = true },

      -- dap UI
      DapUIPlayPause = { fg = colors.bright_green },
      DapUIRestart = { fg = colors.green },
      DapUIStop = { fg = colors.red },
      DapUIStepOver = { fg = colors.cyan },
      DapUIStepInto = { fg = colors.cyan },
      DapUIStepOut = { fg = colors.cyan },
      DapUIStepBack = { fg = colors.cyan },
      DapUIType = { fg = colors.bright_blue },
      DapUIScope = { fg = colors.bright_cyan },
      DapUIModifiedValue = { fg = colors.bright_cyan, bold = true },
      DapUIDecoration = { fg = colors.bright_cyan },
      DapUIThread = { fg = colors.bright_green },
      DapUIStoppedThread = { fg = colors.bright_cyan },
      DapUISource = { fg = colors.bright_blue },
      DapUILineNumber = { fg = colors.bright_cyan },
      DapUIFloatBorder = { fg = colors.bright_cyan },
      DapUIWatchesEmpty = { fg = colors.pink },
      DapUIWatchesValue = { fg = colors.bright_green },
      DapUIWatchesError = { fg = colors.pink },
      DapUIBreakpointsPath = { fg = colors.bright_cyan },
      DapUIBreakpointsInfo = { fg = colors.bright_green },
      DapUIBreakpointsCurrentLine = { fg = colors.bright_green, bold = true },
      DapStoppedLine = { default = true, link = 'Visual' },
      DapUIWinSelect = { fg = colors.bright_cyan, bold = true },

      -- Notify
      NotifyInfoIcon = { fg = colors.green },
      NotifyInfoTitle = { fg = colors.green },
      NotifyInfoBorder = { fg = "#2C453F" },
      NotifyErrorIcon = { fg = colors.red },
      NotifyErrorTitle = { fg = colors.red },
      NotifyErrorBorder = { fg = "#DD6E6B" },
      NotifyWarnIcon = { fg = colors.orange },
      NotifyWarnTitle = { fg = colors.orange },
      NotifyWarnBorder = { fg = "#785637" },
   }
end

return {
   setup = setup,
}
