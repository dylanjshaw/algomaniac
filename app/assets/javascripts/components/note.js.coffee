@Note = React.createClass
  getInitialState: ->
    edit: false
  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/notes/#{ @props.note.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteNote @props.note
  handleEdit: (e) ->
    e.preventDefault()
    data = content: ReactDOM.findDOMNode(@refs.content).value
    $.ajax
      method: 'PUT'
      url: "/notes/#{ @props.note.id}"
      dataType: 'JSON'
      data:
        note: data
      success: (data) =>
        console.log(@setState)
        @setState(edit: false)
        @props.handleEditNote @props.note, data
  noteRow: ->
      React.DOM.tr null,
        React.DOM.td null, @props.note.content
        React.DOM.td null,
          React.DOM.button
            className: 'btn btn-primary'
            onClick: @handleToggle
            'Edit'
          React.DOM.button
            className: 'btn btn-danger'
            onClick: @handleDelete
            'delete'
  noteForm: ->
      React.DOM.tr null,
        React.DOM.td null,
          React.DOM.input
            className: 'form-control'
            type: 'text'
            defaultValue: @props.note.content
            ref: 'content'
        React.DOM.td null,
          React.DOM.button
            className: 'btn btn-primary'
            onClick: @handleEdit
            'Update'
          React.DOM.button
            className: 'btn btn-danger'
            onClick: @handleToggle
            'Cancel'
  render: ->
    if @state.edit
      @noteForm()
    else
      @noteRow()
