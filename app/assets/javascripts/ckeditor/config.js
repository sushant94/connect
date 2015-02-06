CKEDITOR.editorConfig = function( config ) {
  config.toolbar_Custom = [
    { name: 'basicstyles', items : [ 'Bold','Italic','Underline'] },
    { name: 'links',       items : [ 'Link','Unlink'] },
  ];

  config.toolbar = 'Custom';
};
