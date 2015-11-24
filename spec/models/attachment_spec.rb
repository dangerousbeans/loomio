require 'rails_helper'

 describe Attachment do

   let(:attachment) { create :attachment, filename: nil, location: nil, file: fixture_for('images', 'strongbad.png') }
   let(:pdf_attachment) { create :attachment, file: fixture_for('strongmad.pdf')}
   let(:old_attachment) { create :attachment, filename: 'strongsad.png', filesize: 100, file_content_type: 'png', location: 'bucket.amazon.com/strongsad.png' }

   describe 'file' do
     it 'saves a file locally' do
       expect(attachment.file_file_name).to match /strongbad\.png/
       expect(attachment.file.url).to match /#{attachment.file_file_name}/
       expect(attachment.filesize).to eq attachment.file_file_size
       expect(attachment.filename).to eq 'strongbad.png'
       expect(attachment.location).to eq attachment.file.url(:original)
       expect(attachment.is_an_image?).to eq true
     end

     it 'is backwards compatible with existing attachments' do
       expect(old_attachment.original).to eq old_attachment.location
       expect(old_attachment.filetype).to eq 'png'
     end

   end

 end
