# privy-test
This repository is for backend programmer test in PrivyID

Framework Rails version 5.1.6.2<br/>
Ruby version: 2.3.3
Database MySQL

Cara menjalankan :
  1. Pastikan rails sudah terinstall, jika belum install rails dari <a href="http://railsinstaller.org/en" target="_blank">sini<a>.
  2. Pastikan sudah menggunakan bundler 2, jika belum dapat dibaca <a href="https://bundler.io/guides/bundler_2_upgrade.html"   target="_blank">sini<a>.
  3. Jalankan <pre>bundle install</pre>
  4. Buat database dengan nama '<b>myproducts</b>', kalau mau menggunakan nama lain dan setting username password database dapat diedit di file '<b>config/database.yml</b>' di bagian 
  <pre>
  ...
  username: root #ganti ini dengan username database local
  password: #ganti ini dengan password database local
  ...

  development:
  <<: *default
  database: myproducts #ganti ini menjadi nama database yang diinginkan
  ...
  </pre>
  4. Jalankan Migrate<pre>rails db:migrate</pre>
  5. Jalankan Seed<pre>rails db:seed</pre>
  6. Jalankan server Rails dengan menggunakan perintah <pre>rails s</pre>Server akan berjalan pada port default 3000, jika ingin menggunakan port lain dapat menggunakan perintah <pre>rails s -p (port yang diinginkan, misalnya: 3001)</pre>
  7. Untuk testing API dapat menggunakan POSTMAN, postman collection telah saya cantumkan dengan nama file '<b>Privy Test.postman_collection.json</b>'
