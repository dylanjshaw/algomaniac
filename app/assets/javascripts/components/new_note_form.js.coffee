@NewNoteForm = React.createClass
  getInitialState: ->
    content: ''
  handleValueChange: (e) ->
    valueName = e.target.name
    @setState "#{ valueName }": e.target.value
  valid: ->
    @state.content
  handleSubmit: (e) ->
    e.preventDefault()
    $.post 'notes', {note: @state }, (data) =>
      @setState.content = @getInitialState()
      @props.handleNewNote(data)
    , 'JSON'
  render: ->
    React.DOM.form
      className: 'container center-div bottom-buffer'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control content-input tall-input'
          name: 'content'
          value: @state.data
          autoComplete: "off"
          onChange: @handleValueChange
        React.DOM.button
          type: 'submit'
          className: 'btn btn-primary place-right btn-buffer'
          disabled: !@valid()
          'Store Algorithm'
