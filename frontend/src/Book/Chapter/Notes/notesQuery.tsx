import gql from "graphql-tag";
import NoteFragment from "../../Notes/NoteFragment";

export default gql`
  query notesQuery($elementId: String!, $bookPermalink: String!) {
    book(permalink: $bookPermalink) {
      id
      notes(elementId: $elementId) {
        ...note
      }
    }
  }

  ${NoteFragment}
`;
