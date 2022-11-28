import { Controller } from "@hotwired/stimulus";
import { EditorState } from "@codemirror/state";
import { EditorView, lineNumbers } from "@codemirror/view";
import { markdown } from "@codemirror/lang-markdown";

export default class extends Controller {
  async connect() {
    this.#setTextarea();
    this.#hideTextarea();
    this.#mountCodeMirror();
  }

  #mountCodeMirror() {
    const state = EditorState.create({
      doc: this.textarea.value,
      extensions: [
        EditorView.updateListener.of((update) =>
          this.#onUpdate(update.state.doc.toString())
        ),
        EditorView.theme({
          "&.cm-editor": {
            flex: 1,
          },
        }),
        lineNumbers(),
        markdown(),
      ],
    });
    new EditorView({
      state,
      parent: this.element,
    });
  }

  #setTextarea() {
    const textareas = this.element.getElementsByTagName("textarea");
    if (textareas.length != 1)
      throw new Error("wysiwyg_controller shuld have 1 textarea");
    this.textarea = textareas[0];
  }

  #hideTextarea() {
    this.textarea.style.display = "none";
  }

  #onUpdate(text) {
    this.textarea.value = text;
    this.dispatch("update", { detail: { text } });
  }
}
