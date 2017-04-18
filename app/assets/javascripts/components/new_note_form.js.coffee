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
    # console.log('submitting the note')
    $.post 'notes', {note: @state }, (data) =>
      @props.handleNewNote(data)
      @setState content: ''
    , 'JSON'
    # console.log('submitted the note')
  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Write your note here...'
          name: 'content'
          value: @state.data
          onChange: @handleValueChange
        React.DOM.button
          type: 'submit'
          className: 'btn btn-primary'
          disabled: !@valid()
          'Create Note'
