class EvernoteController < ApplicationController

  def ev_client
    evernote_user = User.find_by_id(current_user)
    ev_auth = evernote_user.linkedids.find_by_provider("evernote").token
    @ev_client = EvernoteOAuth::Client.new(token: ev_auth)
  end

  def note_store
    @note_store = ev_client.note_store
  end

  def create_notebook

    notebook = Evernote::EDAM::Type::Notebook.new
    notebook.name = params[:title]
    created_notebook = note_store.createNotebook(notebook)
    new_journal = Jounral.create(user_id: current_user.id, guid:created_notebook.guid, name:created_notebook.name)

    render json: created_notebook, status:201

  end

  def create_note
    note = Evernote::EDAM::Type::Note.new

    note.title = "Bryan's Test"
    note.notebookGuid ="af9e2c70-9f7b-4d50-bc4f-925e230ed60c"
    note.content = '<?xml version="1.0" encoding="UTF-8"?>' +
  '<!DOCTYPE en-note SYSTEM "http://xml.evernote.com/pub/enml2.dtd">' +
  '<en-note>'+'Here is the Evernote logo:' +
  '</en-note>'
    note.tagNames = ["tests"]
    created_note = note_store.createNote(note)
    render json: created_note , status:201

    render json: {}, status: 201
  end



end
