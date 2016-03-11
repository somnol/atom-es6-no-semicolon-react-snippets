module.exports =
class Es6NoSemicolonReactSnippetsView
  constructor: (serializedState) ->
    # Create root element
    @element = document.createElement('div')
    @element.classList.add('es6-no-semicolon-react-snippets')

    # Create message element
    message = document.createElement('div')
    message.textContent = "The Es6NoSemicolonReactSnippets package is Alive! It's ALIVE!"
    message.classList.add('message')
    @element.appendChild(message)

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element

  setCount: (count) ->
    displayText = "There are #{count} words."
    @element.children[0].textContent = displayText
