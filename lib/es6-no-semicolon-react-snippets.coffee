Es6NoSemicolonReactSnippetsView = require './es6-no-semicolon-react-snippets-view'
{CompositeDisposable} = require 'atom'

module.exports = Es6NoSemicolonReactSnippets =
  es6NoSemicolonReactSnippetsView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @es6NoSemicolonReactSnippetsView = new Es6NoSemicolonReactSnippetsView(state.es6NoSemicolonReactSnippetsViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @es6NoSemicolonReactSnippetsView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'es6-no-semicolon-react-snippets:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @es6NoSemicolonReactSnippetsView.destroy()

  serialize: ->
    es6NoSemicolonReactSnippetsViewState: @es6NoSemicolonReactSnippetsView.serialize()

  toggle: ->
    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      editor = atom.workspace.getActiveTextEditor()
      words = editor.getText().split(/\s+/).length
      @es6NoSemicolonReactSnippetsView.setCount(words)
      @modalPanel.show()

  close: ->
    if @modalPanel.isVisible()
      @modalPanel.hide()
